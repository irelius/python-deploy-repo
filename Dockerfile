# Not relevant as this repo is for deployment directly from github, not from docker
FROM python:3.9.18-alpine3.18

# ENV FLASK_APP=${FLASK_APP}
# ENV FLASK_DEBUG=${FLASK_DEBUG}
# ENV FLASK_RUN_PORT=${FLASK_RUN_PORT}
# ENV FLASK_ENV=${FLASK_ENV}

# ENV SECRET_KEY=${SECRET_KEY}
# ENV SCHEMA=${SCHEMA}
# ENV DATABASE_URL=${DATABASE_URL}

# WORKDIR /var/www

# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# RUN pip install psycopg2-binary
# RUN pip install --upgrade pip

# COPY . .

# RUN flask db init
# RUN flask db migrate -m 'first docker migration'
# RUN flask db upgrade
# RUN flask seed all


# CMD ["gunicorn", "app:app"]