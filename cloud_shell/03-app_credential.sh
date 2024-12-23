. ./environment

# Create appID and secret to be utilized
az ad app credential reset --id ${object_id} \
--end-date "2299-12-30T23:00:00Z" >> ./secret.json

# Store appID and secret in environment file
client_id=`cat secret.json | jq -r '.appId'`
client_secret=`cat secret.json | jq -r '.password'`

# Delete secret.json file
rm -f ./secret.json

# Store appID and secret in environment file
echo "client_id="${client_id} >> ./environment
echo "client_secret="${client_secret} >> ./environment