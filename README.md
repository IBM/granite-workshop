# InstructLab Workshop

This is the InstructLab Workshop source code.

<***>

Create a new repo based off this template, and use the following folders as a guide:

```ini

- data (any data (CSV, JSON, etc files) to be used)
- docs (this is where the workshop is documented)
|_ <folder-n> (these are exercises for the workshop)
  |_README.md (the steps for the exercise, in Markdown)
|_ README.md (this will appear on the gitbook home page)
- notebooks (any Jupyter notebooks can go here)
- src (any application source code can go here)
.mkdocs.yaml (configuration for mkdocs)
.travis.yaml (runs markdownlint by default)
README.md (only used for GitHub.com)
```

## Tips and conventions

### Screenshots

Screenshots look better if they are full page.
Use [ImageMagick](https://imagemagick.org) to create a nice border around images with this command:

```bash
magick mogrify -bordercolor gray -border 2
```
