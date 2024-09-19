In this tutorial we will walk you through building out a new `qna.yaml` for adding new or updated knowledge to the `granite-7b-lab` model. Let's get started!

!!! tip
	A quick aside, if you have reached this point, you probably have noticed gaps in the model, or maybe some knowledge needs to be updated. In theory the work you do here will be able to upstreamed to the public taxonomy repository, and you can help shape our community based model! Thank you!

```bash
mkdir instructlab
git clone git@github.com:erictherobot/wikipedia-markdown-generator.git
```
The first thing we need to do is create a new directory to have a clean place to work and pull down some software. Most of the time, the easiest thing to update in the model is the Wikipedia entry, so luckily, `erictherobot` has written a helpful tool to pull down markdown versions of the articles for us.

```bash
git clone git@github.com:<USERNAME>/instructlab-knowledge-docs.git
```

After this, clone down your instructlab knowledge docs repository. It can be named whatever you'd like, but if you use our https://ui.instructlab.ai, you'll notice you already have `instructlab-knowledge-docs`.

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
vim sports/american_football/college/university_of_texas/qna.yaml
```
