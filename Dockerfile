FROM arm32v7/python:2.7.13-jessie AS base

# isntall global dependencies
RUN apt-get update && apt-get install -y curl python-numpy python-pil
WORKDIR /tmp

# install sensehat dependencies
RUN curl -LO  https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib-dev_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib//librtimulib-utils_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib7_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/python-rtimulib_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/p/python-sense-hat/python-sense-hat_2.1.0-1_armhf.deb

RUN dpkg -i librtimulib-dev_7.2.1-3_armhf.deb librtimulib-utils_7.2.1-3_armhf.deb librtimulib7_7.2.1-3_armhf.deb python-rtimulib_7.2.1-3_armhf.deb python-sense-hat_2.1.0-1_armhf.deb

# clean up
RUN rm -f /tmp/*.deb
RUN apt-get clean

# lock and install python requirements
COPY ./app /app
WORKDIR /app
RUN pip install pipenv && pipenv lock --requirements > requirements.txt
RUN pip install -r requirements.txt

# run
ENV PYTHONPATH "${PYTHONPATH}:/app/"
RUN FLASK_APP=main.py && export FLASK_ENV=production
CMD ["flask", "run"]