# Raspberry Pi Wekinator Client

## Git Cheatsheet

Push: `git push origin master`  
Pull: `git fetch origin`  
Merge changes: `git merge origin/master`

Make commits case sensitive: `git config core.ignorecase false`

## Python Dependencies

Scripts use the `pipenv` package manager.

### Installation

To install, run: `brew install pipenv` for Mac. For other platforms, run `pip install --user pipenv`.  

Run `pipenv install` to install all packages, or crudely: `curl https://raw.githubusercontent.com/pypa/pipenv/master/get-pipenv.py | python`. 

If pipenv can't be found, run `sudo pip install pipenv`.

### Execute

Run `python main.py` to execute
