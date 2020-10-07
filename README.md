# Raspberry Pi Wekinator Client

## Installation Guise

#### 1. Clone this repository to your raspberry pi

`git clone https://github.com/moritzsalla/raspi-wekinator-client`

#### 2. Install Wekinator

Head to the `wekinator-executable` directory.

To run Wekinator (2.1.0.4) on Raspberry Pi, use a terminal to cd to the appropriate folder and run the command: `java -jar WekiMini.jar`.

Run `python main.py` to execute.

#### 3. Run the python input script

This script periodically fetches data from an API. You will need to use pipenv, a python package manager, to install your dependencies. 

To install pipenv run `brew install pipenv` for Mac. For other platforms, run `pip install --user pipenv`. Run `pipenv install` to install all packages, or crudely: `curl https://raw.githubusercontent.com/pypa/pipenv/master/get-pipenv.py | python`. 

If pipenv can't be found, run `sudo pip install pipenv`.

#### 4. Run the output script

Under construction…

## Git Cheatsheet

Clone: `git clone url`  
Push: `git push origin master`  
Pull: `git fetch origin`  
Merge changes: `git merge origin/master`

Make commits case sensitive: `git config core.ignorecase false`
