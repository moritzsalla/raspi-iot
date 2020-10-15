# Raspberry Pi Wekinator Client

Monorepo containing server, wekinator executable and output script. Ongoing work…

![Image](./image.jpg)

## Installation

### Pipenv (prefered)

```shell
cd app/
pip install pipenv
pipenv install
```

### Pip

Make sure you are running `python2.7.13`

To install requirements, run:

```shell
cd app/
pip install pipenv
pipenv lock --requirements > requirements.txt
pip install -r requirements.txt
```

### Docker

Compatibility issues. Might resolve some time later!

```shell
docker build -t sensehat .
docker run --privileged --name sensehat -ti sensehat bash
python main.py
```

Reference Dockerfile: https://github.com/bmwshop/sensehat

## Running the Flask server

Runs locally. Make sure to connect to the same wifi.

```shell
export FLASK_APP=main.py
export FLASK_ENV=development
sudo python2 main.py # make sure you are running 2.7
```

Which hostname am I running on?

```shell
hostname -I
```

Example query:

```shell
http://127.0.0.1:8000/items/5?q=somequery
```
