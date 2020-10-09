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

## Controling Wekinator via OSC

http://www.wekinator.org/detailed-instructions/#Customizing_DTW8217s_behavior

## Installing Docker on Raspi

https://phoenixnap.com/kb/docker-on-raspberry-pi

```
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker [user_name]
sudo usermod -aG docker Pi

# test
docker version
docker info
docker run hello-world

# check out port app is running at 
sudo docker ps
```

## Git Cheatsheet

Clone: `git clone url`  
Push: `git push origin master`  
Pull: `git fetch origin`  
Merge changes: `git merge origin/master`

Make commits case sensitive: `git config core.ignorecase false`

## Raspi Cheatsheet

Ping: `ping raspberrypi.local`

## To–Do

- [ ] Set up docker on raspi
- [x] Create Server that receives POST requests
- [x] Setup simple output without Wekinator
- [x] Decide what to do with data. Save them in database? Periodically train wekinator?
- [ ] Remove Django credentials from Github, add to gitignore

## Content

```
.
├── README.md
├── image.jpg
├── in
│   ├── api
│   │   ├── Dockerfile
│   │   ├── README.md
│   │   └── app
│   │       ├── main.py
│   │       └── wekinator.py
│   ├── processing_in_test
│   │   ├── README.md
│   │   └── processing_in_test.pde
│   └── wekinator_control_osc
│       ├── OSC.py
│       ├── OSC.pyc
│       ├── README.md
│       └── main.py
├── out
│   └── processing_output_test
│       ├── README.md
│       ├── processing_output_test.pde
│       └── sketch.properties
└── wekinator
    ├── executable
    │   ├── README.md
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
    └── wekinator_project
        └── README.md
```
