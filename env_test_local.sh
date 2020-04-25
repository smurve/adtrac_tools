# source this from within your python repo folder

echo Settings for test and local DB instance
echo
export DJANGO_SETTINGS_MODULE=brokerage.settings.test
echo DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE

export DATABASE_USER=postgres
echo DATABASE_USER=postgres

export DATABASE_PASSWORD=postgres
echo DATABASE_PASSWORD=postgres

export PGPASSWORD=postgres
echo PGPASSWORD=postgres

export PROJECT_PATH=$PWD/..
echo PROJECT_PATH=$PWD/..

export TOOLS_PATH=$PROJECT_PATH/tools
echo TOOLS_PATH=$PROJECT_PATH/tools
export PATH=$TOOLS_PATH:$PATH

export PYTHONPATH=$PWD:$PYTHONPATH
echo PYTHONPATH=$PWD:$PYTHONPATH

export GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_SQL_Access_test.json
echo GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_SQL_Access_test.json

export SENDGRID_API_KEY=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
export SENDGRID_API_KEY=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
