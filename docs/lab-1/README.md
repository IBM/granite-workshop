# Building a local AI co-pilot

## Overview

Success! We're ready to start with the first steps on your AI journey with us today.
With this first lab, we'll be taking almost exact copy of [this blogpost](https://developer.ibm.com/tutorials/awb-local-ai-copilot-ibm-granite-code-ollama-continue/)
and expanding on it for this time together.

In this tutorial, I will show how to use a collection of open-source components to run a feature-rich developer co-pilot in Visual Studio Code while meeting data privacy, licensing, and cost challenges that are common to enterprise users. The setup is powered by local large language models (LLMs) with IBM's open-source LLM family, Granite Code. All components run on a developer's workstation and have business-friendly licensing.

There are three main barriers to adopting these tools in an enterprise setting:

- Data Privacy: Many corporations have privacy regulations that prohibit sending internal code or data to third party services.
- Generated Material Licensing: Many models, even those with permissive usage licenses, do not disclose their training data and therefore may produce output that is derived from training material with licensing restrictions.
- Cost: Many of these tools are paid solutions which require investment by the organization. For larger organizations, this would often include paid support and maintenance contracts which can be extremely costly and slow to negotiate.

## Fetching the Granite Models

First what is Granite? According to section 2 of this paper published by IBM Research titled, "[Granite Code Models: A Family of Open Foundation Models for Code Intelligence][paper],", the IBM Granite Code models meticulously curated their training data to ensure all training code carried enterprise-friendly licenses and all text did not contain any hate, abuse, or profanity.

Granite Code comes in a wide range of sizes to fit your workstation's available resources. Generally, the bigger the model, the better the results, but the more resources it will require and the slower it'll be. I chose the 20b option as my starting point for chat and the 8b option for code generation. Ollama offers a convenient pull feature to download models:

Open up your terminal, and run the following commands:
```bash
ollama pull granite-code:20b
ollama pull granite-code:8b
```

## Set up Continue

Now we need to install [continue.dev](https://continue.dev) so VSCode can "talk" to the ollama instance, and work with the
granite model(s). There are two different ways of getting `continue` installed. If you have your `terminal` already open
you can run:

```bash
code --install-extension continue.continue
```

If not you can use these steps in VSCode:

1. Open the Extensions tab.
2. Search for "continue."
3. Click the Install button.

Next you'll need to configure `continue` which will require you to take the following `json` and open the `config.json`
file via the command pallete.

1. Open the command pallette (Press Ctrl/Cmd+Shift+P)
2. Select Continue: Open `config.json`.

Copy the following `json` into the locations that are in the `config.json` file.
```json
  "models": [
    {
      "title": "Granite Code 20b",
      "provider": "ollama",
      "model": "granite-code:20b"
    }
  ],

  "tabAutocompleteModel": {
    "title": "Granite Code 8b",
    "provider": "ollama",
    "model": "granite-code:8b"
  },
```

!!! note
    The "models" and "tabAutocompleteModel" are different sections, and be sure to line them up correctly
    in the unedited pre-installed `config.json`.

## Sanity Check

Now that you have everything wired together in VSCode, lets make sure that everything works. Go ahead and open
up `continue` on the extention bar:

![](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/lKHl3FNCegebKYdHuXR-GA/continue-sidebar.png)

And ask it something! Something fun I like is:

```text
What language should I use for backend development?
```

It should give you a pretty generic answer, but as you can see, it works, and hopefully will help spur a thought
or two, now lets continue on to Lab 2, where we are going to actually this process in-depth!

[paper]: https://arxiv.org/pdf/2405.04324?utm_source=ibm_developer&utm_content=in_content_link&utm_id=tutorials_awb-local-ai-copilot-ibm-granite-code-ollama-continue

<img src="https://count.asgharlabs.io/count?p=/lab1_opensource_ai_page">

