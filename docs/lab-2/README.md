# Using the local AI co-pilot

Lets play with our new found local AI InstructLab!

## Pre reqs
* laptop with GPU
* Python 3.9+
* xcode (if on a Mac)
* git
	* configure user.name and user.email
* VS Code (recommended) with YAML plug in from Red Hat
* yamllint (pip install)
* Public github (github.com) account
	* [SSH Key set up for github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* [Install InstructLab](https://ibm.ent.box.com/folder/271730051148?s=hywj3rlwbiv2nqe32qgw4v3app7wc1wo) [README](https://github.com/instructlab/instructlab/blob/main/README.md) and verify it is installed correctly with `ilab` command

## Set up InstructLab and Create Knowledge
### Validate install complete
* review how to update instructlab `https://github.com/instructlab/instructlab/blob/main/README.md#-upgrade-instructlab-to-latest-version`
```
pip install instructlab --upgrade
```
	* [README](https://github.com/instructlab/instructlab/blob/main/README.md)
	* might need to rerun `ilab init`
	* M1/M2/M3 Mac instructions
```
source venv/bin/activate
(venv) $ pip cache remove llama_cpp_python
(venv) $ pip install git+https://github.com/instructlab/instructlab.git@stable -C cmake.args="-DLLAMA_METAL=on"
```
	* see README link above for other hardware instructions
* verify `ilab` is installed correctly
```
ilab
```
* Activate the virtual environment for python if you haven’t done so already
	* change directory to the subdirectory where you installed InstructLab
	* for Mac
```
source venv/bin/activate
```
	* for Windows
```
# In cmd.exe
venv\Scripts\activate.bat
# In PowerShell
venv\Scripts\Activate.ps1
```
* Helpful hints:
	* shouldn’t have to redownload the model unless it has been updated
	* **EVERY** time you start working with `ilab`, be sure you execute `source venv/bin/activate` (if Mac) or `venv\Scripts\activate.bat` (if Windows) from where you installed `instructlab` first

### Fork instructlab/taxonomy to your repo - ie ljmwaugh/taxonomy
* Fork the instuctlab/taxonomy repo to your local taxonomy repo
	* Open `https://github.com/instructlab/taxonomy` in your browser
	* Click on Fork
			![](.data/md-images/09778739-aecf-4e20-949f-3399c08114b4.webp#$width=60p$)
	* Validate the Owner to Fork to and click `Create fork` button
		![](.data/md-images/c146a7a2-0ed1-4f78-a2a7-b8c1b6f5e3c4.webp#$width=60p$)
	* Open the new fork of the repository in browser
* Create a local clone of the fork
	* Click on Green `Code` button. Be sure SSH tab is selected, and click on copy icon.
		![](.data/md-images/b194382e-8c7b-4b31-ba10-ef4894c141b1.webp#$width=60p$)
	* Open a terminal window or command prompt
	* Change directory to where your github repos reside
	* Issue the following command `git clone ` then paste the SSH link you copied from Green `Code` button
* Additional helpful links
	* [CONTRIBUTING](https://github.com/instructlab/community/blob/main/CONTRIBUTING.md#getting-started-with-contribution)
	* [github-workflow](https://github.com/kubernetes/community/blob/master/contributors/guide/github-workflow.md)
	* [helpful git commands](https://training.github.com/downloads/github-git-cheat-sheet.pdf)
### Configure ilab to point to the forked taxonomy repo
```
ilab init
```
* Enter the `Path to taxonomy repo` on your local harddrive.
![](.data/md-images/271c60b9-fe23-4c3a-89e8-cbe2df0d774b.webp#$width=80p$)
* Press the Return or Enter key to use the default path for model.  You can specify the granite model instead of the merlinite model by entering `models/granite-7b-lab-Q4_K_M.gguf`
![](.data/md-images/859dbeb1-cbb3-4221-809c-9b2d8779e4c6.webp#$width=85p$)
* Should see this message
![](.data/md-images/4d731826-15ab-4faf-9915-1889bb124dfb.webp#$width=80p$)
* `config.yaml` stores the configuration information you just supplied.  This file can be edited if needed.  You can also recreate the file by running `ilab init` again.
### Download the model
```
ilab download
```
* The ilab download command downloads the merlinite model from the HuggingFace instructlab organization that we will use for this workshop.
* To download the granite model enter `ilab download --repository instructlab/granite-7b-lab-GGUF --filename=granite-7b-lab-Q4_K_M.gguf`
### Serve the model
```
ilab serve
```
* This command will start the server process for the merlinite model.
* To start the server process for the granite model enter `ilab serve --model-path ./models/granite-7b-lab-Q4_K_M.gguf`
### Chat with the model
* Open a new terminal window
	* `cd` to the subdirectory where you installed instructlab
	* `source venv/bin/activate` to activate the Python virtual environment
		* or `venv\Scripts\activate.bat`if Windows
	* `ilab chat` to start asking questions
		* `/q` to exit the chat when you’re done experimenting
	* To use the granite model instead of the merlinite model, enter `ilab chat -m ./models/granite-7b-lab-Q4_K_M.gguf`
* Ask questions of the model to determine where there are gaps and identify what knowledge you want to add
	* Ideas to consider:
		* Information that is new as of 2023 or 2024
		* It needs to be information that can be found in Wikipedia, wikisource.org, openstack docs, open organization.org, open practice, the scrum guide.org.  The InstructLab github pages should be updated with this new information shortly.
		* `.gov` websites are not blanket approved because individual pages have different licenses
### Create repo to hold knowledge markdown files - ie ljmwaugh/instructlab_knowledge
* Create personal github repository to hold knowledge markdown files :{OR use knowledge already created here:(style="background-color:#ffffa0ff"):}: `https://github.com/juliadenham/Summit_knowledge`
	* Navigate to `https://github.com/<yourgitname>?tab=repositories`.  Mine is `https://github.com/ljmwaugh?tab=repositories`
			 ![](.data/md-images/c0a8275a-a8c8-4d7d-98b3-a193d59b9b75.webp#$width=60p$)
	* Create a new repo by clicking on the green `New` button
	* On the `Create a new repository` screen, enter the `Respository name` in the field that you want to create.  Mine is instructlab\_knowledge.
			![](.data/md-images/bcf50c00-a090-4aad-ad4c-b43bfe5247b1.webp#$width=60p$)
	* Fill in the rest of the fields as you want.  I left mine `Public` and added a README file but those are optional.
	* Click on green `Create respository` button at the bottom of the page.
![](.data/md-images/c95bb5d1-8bad-499a-a69f-15a1e5a66a1b.webp#$width=60p$)
	* On the next screen we will copy the `SSH` link for cloning.  Look for Quick setup in the middle of the page, click on `SSH` and copy the link displayed.  Mine is `git@github.com:ljmwaugh/test.git`
			![](.data/md-images/265ffb13-a552-40d2-a16f-e075593b94da.webp#$width=60p$)
	* Open a terminal window, different from where you installed instructlab, navigate to where your github repositories are cloned and enter `git clone <ssh link>`.  Respond to any prompts for passcodes as necessary.  If you get an error about authentication, make sure you have completed the steps above for SSH key setup.
* Create a markdown file with the “source” knowledge
	* For now, copy information from wikipedia for the markdown file
* Add, commit, and push the markdown file to the github repo you created for the knowledge files.
* Navigate to the github repo (for the markdown file) in a browser.
	* The `repo`, `commit`, and `patterns` in the qna.yaml are all about the **markdown file** and NOT the qna.yaml
	* the SHA commit is the commit of the markdown file, not the qna.yaml
### Create knowledge in forked taxonomy repo - ljmwaugh/taxonomy
* Create a branch in your forked taxonomy repo for this knowledge submission.
	* Follow directions here [Creating and deleting branches within your repository - GitHub Docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository) or [How to Create and Delete Branches in Visual Studio Code | Jason N. Gaylord](https://www.jasongaylord.com/blog/2020/07/08/create-delete-branches-using-visual-studio-code) or [how-to-create-a-new-branch-with-git-using-vs-code-1in0](https://dev.to/jasurkurbanov/how-to-create-a-new-branch-with-git-using-vs-code-1in0).  :{If you are using VS Code, I recommend creating the branch with VS Code.:(style="background-color:#ffffa0ff"):}:
* In VS Code (or other editor), navigate to the subdirectory that will contain the knowledge.  You may have to create subdirectories as appropriate for the new knowledge.  :{Be sure you are on the correct branch inside the editor.:(style="background-color:#ffffa0ff"):}:
* Create `attribution.txt` file.  I recommend copying an existing attribution file and editing it.
	* `Link to work:` and `Revision:` point to the Wikipedia page that you copied the information in the Markdown file from
	* `Link to work:` is the standard Wikipedia URL
	* To get the URL for `Revision:`, Click on `View history` on the right side of the page, then click on the date/time link at the top of the list of revisions.  Then you can copy that URL for the `Revision:`.  It will look something like this `https://en.wikipedia.org/w/index.php?title=Tabby_cat&oldid=1224796569`
	* Copy the other information from an existing attribution.txt file.
* Writing your first knowledge contribution.
	* Create `qna.yaml` in the same subdirectory with the `attribution.txt` file.  I would copy an existing `qna.yaml` to be sure the format is correct.
	* Modify the
	* YAML hints
		* `task_description` is important
		* name the `domain` like a chapter in a text book - like tabby cats vs animals
		* be sure to include `version: 2`
		* `repo` your repo with the knowledge markdown files that you created above.  This can be the same repo or a separate repo.
		* `commit` the SHA commit in your repo with your knowledge markdown files.
		* no trailing blanks
		* one blank line at the end of the file
		* only one space after `:`
		* multiline indicated by `|`
* execute `git submodule update --init` in the subdirectory where you forked taxonomy (in your repo). [Additonal information](https://github.com/instructlab/instructlab/discussions/1044) and [more information](https://github.com/instructlab/taxonomy/discussions/776).
* Validate `qna.yaml` using `./.github/scripts/check-yaml.py <path>/qna.yaml`
	* see common YAML issues above
* `ilab diff`to validate that everything is set up correctly and the qna.yaml and knowledge markdown file are found
* `ilab generate --num-instructions 10` generate synthetic data used to train the model, set it to 10 instead of generating 100
### Commit qna.yaml and attribution.txt
* `cd` to the `taxonomy` repo
* `git status` to check status.  You should see `qna.yaml` and `attribution.txt` need to be added.
* There are two ways you can do this.  You can use VS Code Source Control to add the files or you can do it on the command line/terminal.
	* `git add .` will add all of the files listed by `git status`
	* In VS Code, you can click on the `+` beside each file to add it.
* Next you need to **commit** the files you just added with a **sign off** trailer
	* `git commit -sm ‘<commit message>` will work from the command line.  Actually, this is the simplest way in my opinion.
	* In VS Code, press Shift+CMD+P to Show and Run commands
		* enter `git commit` and then select `Git: Commit (Signed Off)`
		* select `taxonomy main+`
		* enter a COMMIT_EDITMSG then CMD+s to save the file
		* click the X on the tab to close it
* Now we are ready to Sync Changes.
	* `git push` followed by `git pull` will work from the command line
	* In VS Code, click the `Sync Changes` button
### Create PR
* In a browser, navigate to `https://github.com/instructlab/taxonomy`
* Click on `Pull requests`
* Click on `New pull request` button
* Click on `compare across forks` link
* Change the dropdown that says `head repository: instructlab/taxonomy` to the fork that you created.  In my case that is `ljmwaugh/taxonomy`.  Change the branch in your fork if needed.
* Click on `Create pull request` button
* Fill out the PR template
* Click `Compare & pull request`