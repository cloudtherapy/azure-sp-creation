# Obtain default domain name
domain_name=`az rest --method get --url https://graph.microsoft.com/v1.0/domains \
--query 'value[?isDefault].id' -o tsv`

# Create a unique app name and append a random number
app_name="sp_terraform_"${domain_name}"_"${RANDOM}
echo "app_name="${app_name} >> ./environment

# Create App Registration
# Two options for sign-in-audience AzureADMyOrg, AzureADMultipleOrgs
object_id=`az ad app create --display-name ${app_name} \
--web-redirect-uris https://${domain_name} \
--sign-in-audience AzureADMyOrg | jq -r '.id'`
echo "object_id="${object_id} >> ./environment