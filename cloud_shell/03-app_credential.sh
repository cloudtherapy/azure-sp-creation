. ./environment

# Create appID and secret to be utilized
az ad app credential reset --id ${object_id} \
--end-date "2299-12-30T23:00:00Z" >> ./secret.tfvars.json

tenant_id=`cat ./secret.tfvars.json | jq -r '.tenant'`
echo "tenant_id="${tenant_id} >> ./environment