# source this from within your python repo folder
export DJANGO_SETTINGS_MODULE=brokerage.settings.unittest
export PROJECT_PATH=$PWD/..
export PGPASSWORD=postgres
export PATH=$PATH:$PROJECT_PATH/tools
export PYTHONPATH=$PWD:$PYTHONPATH
export GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_Object_Access.json
