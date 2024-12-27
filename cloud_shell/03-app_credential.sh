. ./environment

# Create appID and secret to be utilized
az ad app credential reset --id ${object_id} \
--end-date "2299-12-30T23:00:00Z" >> ./secret.tfvars.json

tenant_id=`cat ./secrets.tfvars.json | jq -r '.tenant_id'`
echo "tenant_id="${tenant_id} >> ./environment