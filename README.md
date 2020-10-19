# Raspberry Pi Wekinator Client

Monorepo containing server, wekinator executable and output script. Ongoing work…

![Image](./image.jpg)

## Installation

Clone this repository:

```
$ git clone https://github.com/moritzsalla/REPO_NAME
$ cd REPO_NAME
```

### Docker (prefered)

Based on Protik77's python3-based [dockerfile](https://hub.docker.com/r/protik77/python3-sensehat).

```
$ docker pull moritzsalla/raspi-flask-sensehat-protik
$ docker run --privileged --name mycontainer -p 80:80 -ti moritzsalla/raspi-iot:latest bash
$ python3 main.py
```

### Crude

Make sure you are running `python2.7.13`

To install requirements, run:

```
$ pip install pipenv
$ cd app/
$ pipenv lock --requirements > requirements.txt
$ pip install -r requirements.txt
```

# Misc

Which hostname am I running on?

```
$ hostname -I
```

Example POST request:

```
# find your raspi's address:
$ hostname -I

# run tests:
http://127.0.0.1:8000/test

# set color values:
http://192.168.0.22/color?r=120&g=120&b=255
```
