FROM python:3.10

WORKDIR /code

COPY ./requirements.txt /code/
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

COPY ./alembic.ini /code/alembic.ini

EXPOSE 8000

CMD ["/bin/sh", "-c", \
    "alembic upgrade head && \
    uvicorn app.main:app --host 0.0.0.0 --port 80"]