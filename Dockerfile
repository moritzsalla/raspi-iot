FROM python:2.7.13

RUN apt-get update && apt-get install -y curl python-numpy python-pil
WORKDIR /tmp

# install sensehat dependencies
RUN curl -LO  https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib-dev_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib//librtimulib-utils_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib7_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/python-rtimulib_7.2.1-3_armhf.deb

RUN dpkg -i librtimulib-dev_7.2.1-3_armhf.deb librtimulib-utils_7.2.1-3_armhf.deb librtimulib7_7.2.1-3_armhf.deb python-rtimulib_7.2.1-3_armhf.deb
RUN git clone https://github.com/RPi-Distro/RTIMULib/ RTIMU

# clean up
RUN rm -f /tmp/*.deb
RUN apt-get clean

WORKDIR /
COPY ./app /app

WORKDIR /app
RUN pip install pipenv
RUN pipenv lock --requirements > requirements.txt
RUN pip install -r requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/app/"
CMD FLASK_APP=main.py && export FLASK_ENV=production && flask run