This is a repo for testing purposes. This repo deploys to Render directly from the repository. Click [here](https://github.com/irelius/python-deploy-docker) to see the repo that deploys using Docker.

# Running Locally:
1. Run `pip install -r requirement.txt` at the root of this project folder
2. Run `pipenv shell` to enter the virtual environment
3. Run `flask db migrate && flask db upgrade && flask seed all` to prep your database
4. Change directory to "/react-vite" and run `npm install`
5. Run `flask run` to start the backend
6. Change directory to the "/react-vite" directory, run `npm run build` and then `npm run preview`
    - Note: Any changes made to frontend components will require you to rerun `npm run build` before `npm run preview`. There is no `nodemon` for preview 

<br></br>

# Deployment via Repo:
- Environment variables needed on **Render**:
    - `DATABASE_URL`
        - Get from postgres database service. Use internal database url
    - `FLASK_APP`
        - Set to "app"
    - `FLASK_ENV`
        - Set to "production"
    - `SCHEMA`
        - Something short, concise, and descriptive of the project
    - `SECRET_KEY`
        - A random string of characters. Do not share. It's a secret
- Build command: `pip install -r requirements.txt && pip install psycopg2 && flask db upgrade && flask seed all`
    - Install the packages first, run upgrade, and seeds database on connected postgres database
- Start command: `gunicorn app:app`

<br></br>

# Working on Production Locally:
- To connect your project to your postgres database while on local...
    - Change your local .env file's DATABASE_URL variable from "sqlite:///dev.db" to be the *external* database url of Render's postgres database service
    - Then change your local .env file's FLASK_ENV variable from "development" to production"
    - Then enter your shell with "pipenv shell" and migrate and seed like normal
        - Make sure that you specify the schema in your model files (refer to model files)

<br></br>

# WARNING
- There's some issue with having multiple flask projects on one postgres database from my tests. It could be that my testing methodology is flawed, but having multiple flask projects with differing alembic identifiers seems to be causing an issue with the downgrade function
- To reset your alembic history, enter your postgres database with your PSQL command and run `DELETE FROm alembic_history;`
    - This will clear your alembic history and you can deploy either your Dockerfile project or directly from your repo

<br></br>

## Notes:
- "psycopg2-binary" was added to requirements.txt file so that it gets installed with the `pipenv install -r requirements.txt` command
    - This is a plus because you don't have to add that command to the build command on Render
- Development python version is 3.9.4
- Development pip version is 24.3.1
- Development pyenv version is 2.4.20



