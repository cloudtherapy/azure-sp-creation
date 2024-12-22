. ./environment

# Create appID and secret to be utilized
az ad app credential reset --id ${OBJECT_ID} >> ./secret.json

# Store appID and secret in environment file
APP_ID=`cat secret.json | jq -r '.appId'`
SECRET_ID=`cat secret.json | jq -r '.password'`

# Delete secret.json file
rm -f ./secret.json

# Store appID and secret in environment file
echo "client_id="${APP_ID} >> ./environment
echo "client_secret="${SECRET_ID} >> ./environment