FROM python:3.7

RUN pip install fastapi uvicorn sense-hat 

EXPOSE 80

COPY ./app /app

ENV PYTHONPATH "${PYTHONPATH}:/app/"

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]