# Tuning the Granite Model

Now that you've set up InstructLab, let's get tuning the Granite Model.

## Sanity check

First thing you should do is verify you can talk to the Granite model, go ahead and run
the following commands to verify you can.

```bash
cd instructlab
source venv/bin/activate
ilab model chat
/q
```

## Prepare to train your model

!!! note
    If you are running CPU only, or don't have a modern GPU or a Apple M1/M2/M3 this will take a long time. We strongly suggest finding someone with a GPU enabled machine to continue with this workshop. If anything the instructor or teaching assistants should have a laptop that can be projected on the main screen.

1. Pull down an example `qna.yaml`. But wait what is a `qna.yaml`? There's a few things you should know before going any further.

Knowledge is based more on answering questions that involve facts, data, or references.

Knowledge in the taxonomy tree consists of a few more elements than skills:

- Each knowledge node in the tree has a `qna.yaml`, similar to the format of the `qna.yaml` for skills.
- ⭐ Knowledge submissions require you to create a Git repository, can be with GitHub, that contains the markdown files of your knowledge contributions. These contributions in your repository must use the markdown (.md) format.
- The `qna.yaml` includes parameters that contain information from your repository.

!!! tip
    Guidelines for Knowledge contributions

    - Submit the most up-to-date version of the document
    - All submissions must be text, images will be ignored
    - Do not use tables in your markdown freeform contribution

Format of the `qna.yaml`:

- `version`: The chache verion of the qna.yaml file, this is the format of the file used for SDG. The value must be the number 3.
- `created_by`: Your GitHub username.
- `domain`: Specify the category of the knowledge.
- `seed_examples`: A collection of key/value entries.
  - `context`: A chunk of information from the knowledge document. Each `qna.yaml` needs five `context` blocks and has a maximum word count of 500 words.
  - `questions_and_answers`: The parameter that holds your questions and answers
    - `question`: Specify a question for the model. Each `qna.yaml` file needs at least three question and answer pairs per `context` chunk with a maximum word count of 250 words.
    - `answer`: Specify the desired answer from the model. Each `qna.yaml` file needs at least three question and answer pairs per `context` chunk with a maximum word count of 250 words.
- `document_outline`: Describe an overview of the document your submitting.
- `document`: The source of your knowledge contribution.
  - `repo`: The URL to your repository that holds your knowledge markdown files.
  - `commit`: The SHA of the commit in your repository with your knowledge markdown files.
  - `patterns`: A list of glob patterns specifying the markdown files in your repository. Any glob pattern that starts with `*`, such as `*.md`, must be quoted due to YAML rules. For example, `"*.md"`.

## Create a new knowledge `qna.yaml`

Find a location for this wikipedia markdown generator, and clone down the repository.
```bash
git clone git@github.com:erictherobot/wikipedia-markdown-generator.git
```
The first thing we need to do is create a new directory to have a clean place to work and pull down some software. Most of the time, the easiest thing to update in the model is the Wikipedia entry, so luckily, `erictherobot` has written a helpful tool to pull down markdown versions of the articles for us.

```bash
mkdir instructlab-knowledge-docs
```

After this, clone down your instructlab knowledge docs repository, or create it :). It can be named whatever you'd like, but if you use our <https://ui.instructlab.ai> (in the next lab), you'll notice you already have `instructlab-knowledge-docs`.

```bash
cd wikipedia-markdown-generator
python3.11 -m venv venv-md-gen
source venv-md-gen/bin/activate
pip install -r requirements
python3 wiki-to-md.py Texas_Longhorns_football
```
Next, we need to build a Python virtual environment and install the dependencies to get it to work. These commands cd into the directory, create the virtual environment with python3.11 (you may need to change the version of Python on your machine), activate the virtual environment, and then do the pip install the dependencies.
You'll notice the `Texas_Longhorns_football` there, a Wikipedia article I wanted to pull down and create the `qna.yaml` against. You should choose whatever new knowledge you want to do here.

```bash
cp md_output/Texas_Longhorns_football.md ../../instructlab-knowledge-docs/
cd ../../instructlab-knowledge-docs
git add .
git commit -m "added markdown doc"
git push origin main
cd ..
```

Next, we go ahead and copy the markdown into the knowledge repository, and commit it to our repository and push it up to GitHub.

```
git clone git@github.com/instructlab/taxonomy
cd taxonomy
```

Next we pull down the upstream public taxonomy directory, and `cd` into that directory.

```bash
mkdir -p arts/sports/american_football/college/university_of_texas/
```
This next step is a "best effort" for you. As the taxonomy grows, there will be some obvious choices, but if you select a tree that hasn't been flushed out yet, you'll have to do your best to think about where you'd find the `qna.yaml`. In this case, the Dewey Decimal System says sports should be under arts; this is American Football, college level with the University of Texas. Also, notice the underscores for the spaces; this is important.

```bash
wget https://raw.githubusercontent.com/instructlab/taxonomy/main/docs/template_qna.yaml
mv template_qna.yaml sports/american_football/college/university_of_texas/qna.yaml
```
Finally, you can pull down the `template_qna.yaml` and fill it out for the needed questions and answers. Be sure to put the context at a maximum of about 500 Tokens and questions and answers around 250 Tokens.

```
$EDITOR sports/american_football/college/university_of_texas/qna.yaml
```

Start adding good questions and answers to this document leveraging the context sections. Remember only 5 contexts with 3 `qna` pairs will work, everything else will be ignored.

## Generating synthetic data

After you've built a good knowledge submission like above, the `qna.yaml`, the `attribution.txt` and
finally the hosted `.md` file, you need to tell the teacher model to build questions around
your seeded ones. Lets do that now.

1. If you haven't yet, you'll need to pull down the default teacher model, this is done with this command:

```bash
ilab model download
```

Next sanity check the merlinite model, via the following command:

```bash
ilab serve --model-path models/merlinite-7b-lab-Q4_K_M.gguf

# in another terminal
ilab model chat
```
After the model is working as expected, ie running "who is batman?" close out the `ilab serve` and `ilab model chat`.

2. Next we need to generate the data, this is done with the following command:

```bash
ilab data generate
```

This can take some time, take note of the time in the right hand corner, this is building 1000 questions off of your initial 15.

3. After this is complete, now we'll need to train the actual model. If this isn't a Mac M3, this will take **at least an hour**, so
hopefully you can take a lunch break or something while this is running.

```bash
ilab model train --model-dir instructlab/granite-7b-lab --tokenizer-dir models/granite-7b-lab --model-name instructlab/granite-7b-lab
```

This takes the granite model, leverages the tokenized version of it, and runs the SDG from the `generate` command against it.

4. When this is completed, you'll need to test this model, which is the following command:
```bash
ilab model test --model-dir instructlab-granite-7b-lab-mlx-q
```

5. Now to run the command on the Mac M3, or Apple hardware you'll need to convert it to a `gguf`, that is this next command.

!!! note
    You won't need to do this if you are running on Linux (or maybe Windows remember that's unsupported at the moment)

```bash
ilab model convert --model-dir instructlab-granite-7b-lab-mlx-q
```

6. Finally run the new model with `ilab model serve`.

```bash
ilab model serve --model-path instructlab-granite-7b-lab-trained/instructlab-granite-7b-lab-Q4_K_M.gguf
```

Success! You should notice a difference in the knowledge from what you've trained. If you haven't or something isn't working as expected please understand
that the way [quantization](https://huggingface.co/docs/optimum/en/concept_guides/quantization#) happens to run on your laptop sometimes causes the model to
not know what you trained it. We have some evidence that 1 out of 5 models trained retains your submissions when running on your local laptop. Don't fret
though your submission is great for the upstream model, and extremely valuable to the project.

When the full run from the upstream happens, the PR you submit with the new (or corrected) knowledge will be "baked in" better then the quantization
method you use here, which will give much higher percentage of retrieval.
