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
$ docker run --privileged --name mycontainer -ti moritzsalla/raspi-flask-sensehat-protik bash
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

## Running the Flask server

Runs locally. Make sure to connect to the same wifi.

```
$ export FLASK_APP=main.py
$ export FLASK_ENV=development
$ sudo python2 main.py # make sure you are running 2.7
```

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

# start server:
http://127.0.0.1:8000/sentiment?val=255
```
