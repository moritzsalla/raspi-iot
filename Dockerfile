FROM armhf/ubuntu

# install python3
RUN apt-get update && apt-get install -y python3.9 python3-pip python-pip
RUN pip install -U pip

# install build dependencies
RUN apt-get install -y curl python-numpy python-pil

RUN curl -LO  https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib-dev_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib//librtimulib-utils_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib7_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/python-rtimulib_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/p/python-sense-hat/python-sense-hat_2.1.0-1_armhf.deb

RUN dpkg -i librtimulib-dev_7.2.1-3_armhf.deb librtimulib-utils_7.2.1-3_armhf.deb librtimulib7_7.2.1-3_armhf.deb python-rtimulib_7.2.1-3_armhf.deb python-sense-hat_2.1.0-1_armhf.deb

# cleanup
RUN rm -f /tmp/*.deb
RUN apt-get clean

COPY ./app /app

# install python requirements
RUN pip3 install fastapi uvicorn

EXPOSE 80

ENV PYTHONPATH "${PYTHONPATH}:/app/"

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]