# Tuning the Granite Model

Now that you've set up InstructLab, lets get tuning the Granite Model.

## Sanity check

First thing you should do is verify you can talk to the Granite model, go ahead and run
the following commands to verify you can.

```bash
cd instructlab
source venv/bin/activate
ilab model chat
/q
```

## Prepare to train your model.

!!! note
    If you are running CPU only, or don't have a modern GPU or a Apple M1/M2/M3 this will take a long time. We strongly suggest finding someone with a GPU enabled machine to continue with this workshop. If anything the instructor or teaching assistants should have a laptop that can be projected on the main screen.

1. Pull down an example `qna.yaml`. But wait what is a `qna.yaml`? There's a few things you should know before going any farther.

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

TODO: https://github.com/instructlab/taxonomy/pull/1260

<img src="https://count.asgharlabs.io/count?p=/lab4_opensource_ai_page>
