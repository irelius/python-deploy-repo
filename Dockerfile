# FROM python:3.9.18-alpine3.18

# RUN apk add build-base

# RUN apk add postgresql-dev gcc python3-dev musl-dev

# ARG FLASK_APP
# ARG FLASK_ENV
# ARG DATABASE_URL
# ARG SCHEMA
# ARG SECRET_KEY

# WORKDIR /var/www

# COPY requirements.txt .

# RUN pip install -r requirements.txt
# RUN pip install psycopg2

# COPY . .

# RUN flask db upgrade
# RUN flask seed all
# CMD gunicorn app:app


# -----------------------------------------------------------------------------------------

# template uses alpine3.18, but trying out slim-bookworm with python version 3.12
# theoretically, there shouldn't be an error between 3.9 and 3.12, but possible. we'll see
FROM python:3.12-slim-bookworm

# "apk" commands are necessary for an alpine image, since I'm using slim-bookworm, not used

WORKDIR /var/www

ARG FLASK_APP
ENV FLASK_APP="app"

ARG FLASK_ENV
ENV FLASK_ENV="production"

ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

ARG SCHEMA
ENV SCHEMA="python_deploy_docker"

ARG SECRET_KEY
ENV SECRET_KEY="super-secret-key"


COPY requirements.txt .

RUN pip install -r requirements.txt
RUN pip install psycopg2-binary

COPY . .

# Establish a new user so container doesn't run as the root user
RUN useradd python-docker-user
USER python-docker-user

# RUN ["flask db upgrade", "flask seed all"]


CMD ["flask db upgrade && flask seed all", "gunicorn app:app"]