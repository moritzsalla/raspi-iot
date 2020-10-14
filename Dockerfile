FROM python:3.8

RUN pip install pipenv

COPY ./app /app

# install sense hat library
RUN apt-get install sense-hat
# RUN git clone https://github.com/RPi-Distro/RTIMULib/ RTIMU

# lock pipenv and install python requirements using pip
RUN cd ./app && pipenv lock --requirements > requirements.txt && pip install -r /app/requirements.txt

EXPOSE 80

ENV PYTHONPATH "${PYTHONPATH}:/app/"

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]