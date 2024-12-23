# Obtain unique domain name
domain_name=`az rest --method get --url https://graph.microsoft.com/v1.0/domains --query 'value[?isDefault].id' -o tsv`

# Set DISPLAY NAME from Terraform random name generation
app_name="sp_terraform_"${domain_name}

# Display chosen DISPLAY NAME on terminal
echo "app_name="${app_name} >> ./environment

# Retrieve subscription ID
subscription_id=`az account list --query "[?isDefault].id" --output tsv`

# Store OBJECT_ID in environment file
echo "subscription_id="${subscription_id} >> ./environment

# Create App Registration
object_id=`az ad app create --display-name ${app_name} \
--web-redirect-uris https://misfirm.com \
--sign-in-audience AzureADMultipleOrgs | jq -r '.id'`

# Store OBJECT_ID in environment file
echo "object_id="${object_id} >> ./environment