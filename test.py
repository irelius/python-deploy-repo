import os

environment = os.getenv("FLASK_ENV")
SCHEMA = os.environ.get("SCHEMA")

print("ENVIRONMENT TEST BOOBA", environment)
print("SCHEMA TEST BOOBA", SCHEMA)
