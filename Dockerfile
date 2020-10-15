FROM python:2.7.13

RUN apt-get update && apt-get install -y curl python-numpy python-pil
WORKDIR /tmp

RUN curl -LO  https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib-dev_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib//librtimulib-utils_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib7_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/python-rtimulib_7.2.1-3_armhf.deb

RUN dpkg -i librtimulib-dev_7.2.1-3_armhf.deb librtimulib-utils_7.2.1-3_armhf.deb librtimulib7_7.2.1-3_armhf.deb python-rtimulib_7.2.1-3_armhf.deb

RUN pip install flask sense-hat

COPY ./app /app

RUN cd ./app && pipenv lock --requirements > requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/app/"

# clean up
RUN rm -f /tmp/*.deb
RUN apt-get clean

WORKDIR /

CMD ["python", "/main.py"]