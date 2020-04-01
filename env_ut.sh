# source this from within your python repo folder
export DJANGO_SETTINGS_MODULE=brokerage.settings.unittest
echo
echo DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE

export PROJECT_PATH=$PWD/..
export PGPASSWORD=postgres
export PATH=$PATH:$PROJECT_PATH/tools
export PYTHONPATH=$PWD:$PYTHONPATH
export GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_Object_Access.json
export SENDGRID_API_KEY=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


# source this from within your python repo folder

echo Settings for wgi_local and test-424242 database

export DJANGO_SETTINGS_MODULE=brokerage.settings.unittest
echo DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE

export DATABASE_USER=postgres
echo DATABASE_USER=postgres

export DATABASE_PASSWORD=temporarypassword
echo DATABASE_PASSWORD=temporarypassword

export PROJECT_PATH=$PWD/..
echo PROJECT_PATH=$PWD/..

export PGPASSWORD=postgres
echo PGPASSWORD=postgres

export TOOLS_PATH=$PROJECT_PATH/tools
echo TOOLS_PATH=$PROJECT_PATH/tools
export PATH=$TOOLS_PATH:$PATH

export PYTHONPATH=$PWD:$PYTHONPATH
echo PYTHONPATH=$PWD:$PYTHONPATH

export GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_Object_Access.json
echo GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_Object_Access.json

export SENDGRID_API_KEY=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
export SENDGRID_API_KEY=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

alias proxy='cloud_sql_proxy -instances=adtrac-test-424242:europe-west6:brokerage-master=tcp:5432 -credential_file=/Users/wgiersche/secrets/sql-editor-test.json'
