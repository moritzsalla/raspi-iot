# Raspberry Pi Wekinator Client

Monorepo containing server, wekinator executable and output script. Ongoing work…

![Image](./image.jpg)

## Installation Guide

### 1. Clone this repository to your raspberry pi

`git clone https://github.com/moritzsalla/raspi-wekinator-client`

### 2. Install Wekinator

Head to the `wekinator-executable` directory.

To run Wekinator (2.1.0.4) on Raspberry Pi, use a terminal to cd to the appropriate folder and run the command: `java -jar WekiMini.jar`.

Run `python main.py` to execute.

### 3. Run the python input script

The main script periodically fetches data from an API and sends them to the serial port via OSC. You will need to use pipenv, a python package manager, to install your dependencies.

To install pipenv run `brew install pipenv` for Mac. For other platforms, run `pip install --user pipenv`. Run `pipenv install` to install all packages, or crudely: `curl https://raw.githubusercontent.com/pypa/pipenv/master/get-pipenv.py | python`.

If pipenv can't be found, run `sudo pip install pipenv`.

### 4. Run the output script

Under construction…

## Git Cheatsheet

Clone: `git clone url`  
Push: `git push origin master`  
Pull: `git fetch origin`  
Merge changes: `git merge origin/master`

Make commits case sensitive: `git config core.ignorecase false`

## To–Do

- [ ] Create Server that receives POST requests
- [ ] Setup simple output without Wekinator
- [ ] Decide what to do with data. Save them in database? Periodically train wekinator?

## Content

```
.
├── README.md
├── image.jpg
├── in
│   ├── api
│   │   ├── api
│   │   │   ├── __init__.py
│   │   │   ├── __pycache__
│   │   │   │   ├── __init__.cpython-37.pyc
│   │   │   │   ├── settings.cpython-37.pyc
│   │   │   │   ├── urls.cpython-37.pyc
│   │   │   │   └── wsgi.cpython-37.pyc
│   │   │   ├── asgi.py
│   │   │   ├── settings.py
│   │   │   ├── urls.py
│   │   │   └── wsgi.py
│   │   ├── db.sqlite3
│   │   └── manage.py
│   ├── osc_api_client
│   │   ├── OSC.py
│   │   ├── OSC.pyc
│   │   ├── Pipfile
│   │   ├── Pipfile.lock
│   │   ├── __pycache__
│   │   │   └── OSC.cpython-38.pyc
│   │   ├── main.py
│   │   └── main3.py
│   └── processing_in_test
│       └── processing_in_test.pde
├── out
│   └── processing_output_test
│       ├── processing_output_test.pde
│       └── sketch.properties
└── wekinator
    ├── executable
    │   ├── WekiMini.jar
    │   └── lib
    │       ├── AbsoluteLayout.jar
    │       ├── FastDTW1.1.0.jar
    │       ├── JSON.jar
    │       ├── swing-layout-1.0.4.jar
    │       ├── swing-worker-1.2.jar
    │       ├── weka.jar
    │       ├── xmlpull-1.1.3.1.jar
    │       ├── xpp3_min-1.1.4c.jar
    │       └── xstream-1.4.8.jar
    └── project
        ├── current
        │   ├── currentData.arff
        │   └── models
        │       └── model0.xml
        ├── inputConfig.xml
        ├── outputConfig.xml
        ├── project.wekproj
        └── saved
```
