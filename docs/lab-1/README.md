# Generating Bash Code with Granite Code and Ollama

> **NOTE:** This recipe assumes you are working on a Linux, MacOS, or other UNIX-compatible system. While we haven't tested on Windows, some of the examples may generate valid DOS or PowerShell output. See comments below.

### Prerequisite: Install Ollama and Granite Code models

1. [Download and install Ollama](https://ollama.com/download), if you haven't already.
1. Start the Ollama server: `ollama serve`

Now, in a new terminal window, install one or more of the following Granite Code models. The smallest model `3b` works better on machines with limited resources, but doesn't produce very good results for this notebook. The `8b` model works better and the `20b` model works best, if you are able to use it.

```shell
ollama pull granite-code:3b
ollama pull granite-code:8b
ollama pull granite-code:20b
```

> **NOTE:** By default, this notebook only uses the `3b` model to ensure the widest set of users can run the code. This is also necessary for our CI/CD unit test environment. However, if you have access to a reasonably new and powerful machine, we recommend using the `8b` or the `20b` version instead.
>
> Change the value in the next cell if you decide to use the `8b` or `20b` model.

```python
default_model = 'granite-code:3b'  # The `8b` and `20b` models work better!
```

```python
!pip install ollama
```

## One-shot Prompt with Granite Code 3b

In One-shot prompting, you provide the model with a question and no examples. The model will generate an answer given its training. Larger models tend to do better at this task.

Use the [ollama-python package](https://github.com/ollama/ollama-python) to access the model.

```python
import ollama
```

Let's write two helper functions that we'll use for all our queries. First, we'll find it useful to determine the name of our operating system and use that string in queries. This is because shell commands sometimes have different options on Linux vs. MacOS, etc. We'll write our queries so they take this difference into account. Note that `platform.system()` returns `Windows` on Windows system.

> **TIPS:** If you are using MacOS, you can install Linux-compatible versions of many commands. Consider these two options:
>
> * Install GNU Coreutils on a Mac. See [these instructions](https://superuser.com/questions/476575/replace-os-xs-shell-commands-with-the-linux-versions).
> * Install [HomeBrew](https://brew.sh/) and use it to install Linux-compatible (and other) tools.

```python
import platform

def os_name():
    os_name = platform.system()
    # It turns out, using "MacOS" is better than "Darwin", which is what gets returned on MacOS.
    # For all other cases, the returned value should be fine as is, so we map the result to the desired
    # name, but only for MacOS...
    name_map = {'Darwin': 'MacOS'}
    shell_map = {'Windows': 'DOS'} # On Windows and use Power Shell, change from `DOS` to `Power Shell`.
    # ... then pass the os_name value as the second arg, which is used as the default return value.
    # For the shell name, return `bash` by default. (You can change this to zsh, fish, etc.)
    return name_map.get(os_name, os_name), shell_map.get(os_name, 'bash')
```

```python
my_os, my_shell = os_name()
print(f"My OS is {my_os}. My shell is {my_shell}.")
```

Now let's write a helper function for running queries, wrapping the Ollama `generate()` API call. The user specifies the prompt and a model name, which defaults to the value of `default_model` defined above.

Note how we add additional context to the user's input prompt, such as _"make sure you write code that works for _my_ system!"_ (We'll see another way to do this below.)

The reason we print the result, then return it, is to get nicely readable output.

```python
def query(prompt: str, model: str = default_model) -> str:

    response = ollama.generate(  # Calling Ollama!
        model=model,
        prompt=f"{prompt}. Make sure you generate {my_shell} code that is {my_os}-compatible!")

    result = response["response"]
    print(result)
    return result
```

```python
result1 = query(f"""
    Show me a {my_shell} script to print the first 50 files found under the current working directory
    that have been modified within the last week. Make sure you show the last modification time
    for each file in the output.""")
```

Remove any markdown formatting in the output and paste the commands generated into the next cell _**after the %%bash line shown**_. Also delete the `ls -l`, which is there to allow the cell to run without error if nothing is pasted there (e.g., in our CI/CD test system). So, for example, you might have something like the following:

```shell
%%bash
find dir -type d | do_something
...
```

The `%%bash` "magic" tells Jupyter to run the commands as a shell script instead of as Python code. You can omit lines like `#!/bin/bash` and keep or remove any comments `# this is a comment...`.

Does the script work? If not try running the query again. Also try modifying the query string. What difference do these steps make?

```bash
%%bash
ls -l
```

## Few-shot Prompting with Granite Code 3b

In few-shot prompting, you provide the model with a question and some examples. The model will generate an answer given its training. The additional examples help the model zero in on a pattern, which may be required for smaller models to perform well at this task.

One of the examples uses the `stat` command, which requires different syntax for Linux vs. MacOS systems.

> **NOTE:** If you are using a Windows system, try changing the "answers" in the `examples` cell to be valid Power Shell or DOS commands. You can ignore the `stat_flags` in the next cell.

```python
stat_flags = '-c "%y %n" {}'
if my_os == 'MacOS':
    stat_flags = '-f "%m %N" {}'
print(f"The 'stat' flags for my OS \'{my_os}\' and shell \'{my_shell}\' are \'{stat_flags}\'")
```

```python
examples = f"""
Question:
Recursively find files that match '*.js', and filter out files with 'excludeddir' in their paths.
Answer:
find . -name '*.js' | grep -v excludeddir

Question:
Dump \"a0b\" as hexadecimal bytes
Answer:
printf \"a0b\" | od -tx1

Question:
create a tar ball of all pdf files in the current folder and any subdirectories.
Answer:
find . -name '*.pdf' | xargs tar czvf pdf.tar

Question:
Sort all files and directories in the current directory, but no subdirectories, according to modification time, and print only the seven most recently modified items
Answer:
find . -maxdepth 1 -exec stat {stat_flags} \; | sort -n -r | tail -n 7

Question:
find all the empty directories in and under the current directory.
Answer:
find . -type d -empty

"""
```

Let's define another helper function for calling `ollama.chat()`. Why it is called `chat1()` will be explained below.

```python
def chat1(prompt: str, examples: str = examples, model: str ='granite-code:3b') -> str:
    user_prompt = f"""
        {examples}
        Question:
        {prompt}. Make sure you generate {my_shell} code that is {my_os}-compatible!
        Answer:"""

    response = ollama.chat(model=model, messages=[
      {
        'role': 'user',
        'content': user_prompt
      },
    ])

    result = response['message']['content']
    print(result)
    return result
```

```python
result2 = chat1(f"""
    Show me a {my_shell} script to print the first 50 files found under the current working directory
    that have been modified within the last week. Make sure you show the last modification time
    for each file in the output.""")
```

## Adding a System Prompt

Finally, a _system prompt_ is the preferred way to provide additional instructions and clarity about the context for a task, especially when this same information applies for _all_ user queries in the application. When you are building an AI-enabled application for a set of use cases, you will probably spend a lot of time refining the system prompt to maximize the quality of the results!

Here we define a `default_system_prompt` to let the model know what we expect from it.

So, let's define a final helper function, `chat()`, that includes a system prompt, where `default_system_prompt` is the default. Also, note that we move the sentence `Make sure you only generate {shell} code that is {os}-compatible!` to the system prompt, where it really belongs!

```python
default_system_prompt = f"""
    You are a helpful software engineer. You write clear, concise, well-commented code.
    Make sure you only generate {my_shell} code that is {my_os}-compatible!
    """

def chat(prompt: str,
         system_prompt:str = default_system_prompt,
         examples: str = examples,
         model: str ='granite-code:3b') -> str:
    user_prompt = f"""
        {examples}
        Question:
        {prompt}
        Answer:"""

    response = ollama.chat(model=model, messages=[
      {
        'role':'system',
        'content': system_prompt
      },
      {
        'role': 'user',
        'content': user_prompt
      },
    ])

    result = response['message']['content']
    print(result)
    return result
```

```python
result3 = chat(f"""
    Show me a {my_shell} script to print the first 50 files found under the current working directory
    that have been modified within the last week. Make sure you show the last modification time
    for each file in the output.""")
```

If you modify `chat()` to return the whole `response`, what additional information do you get?

Try invoking `chat()` several times. How do the responses change from one invocation to the next? Try different queries. adding more examples to the `examples` string or modifying the ones shown. Does this affect the outputs.
