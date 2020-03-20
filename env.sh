# source this from within your python repo folder
s=$1
[ -z "$1" ] && s=unittest
export DJANGO_SETTINGS_MODULE=brokerage.settings.$s
export PROJECT_PATH=$PWD/..
export PGPASSWORD=postgres
export PATH=$PATH:$PROJECT_PATH/tools
export PYTHONPATH=$PWD:$PYTHONPATH
export GOOGLE_APPLICATION_CREDENTIALS=$PROJECT_PATH/secrets/GCS_Object_Access.json
export SENDGRID_API_KEY=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
  
  
