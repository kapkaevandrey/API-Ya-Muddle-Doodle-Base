FROM python:3.9.7

LABEL authors='Andrey Kapkaev, Moskalev Anton, Shaposhnikov Anton' version=1.0

WORKDIR /code

COPY requirements.txt .

RUN python -m pip install --upgrade pip

RUN pip3 install -r /code/requirements.txt

RUN python

COPY . .

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000