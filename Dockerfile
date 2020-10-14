FROM python:3.8

RUN apt-get update && apt-get install -y curl python-numpy python-pil 
WORKDIR /tmp

RUN curl -LO  https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib-dev_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib//librtimulib-utils_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/librtimulib7_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/r/rtimulib/python-rtimulib_7.2.1-3_armhf.deb \
      && curl -LO https://archive.raspberrypi.org/debian/pool/main/p/python-sense-hat/python-sense-hat_2.1.0-1_armhf.deb


RUN dpkg -i librtimulib-dev_7.2.1-3_armhf.deb librtimulib-utils_7.2.1-3_armhf.deb librtimulib7_7.2.1-3_armhf.deb python-rtimulib_7.2.1-3_armhf.deb python-sense-hat_2.1.0-1_armhf.deb

ADD test.py /test.py

RUN rm -f /tmp/*.deb
RUN apt-get clean

WORKDIR /

CMD ["python", "/test.py"]

# FROM python:3.8

# RUN pip install pipenv

# COPY ./app /app

# RUN cd ./app && pipenv lock --requirements > requirements.txt && pip install -r /app/requirements.txt

# EXPOSE 80

# ENV PYTHONPATH "${PYTHONPATH}:/app/"

# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]