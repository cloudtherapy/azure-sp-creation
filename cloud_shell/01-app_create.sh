# Obtain unique domain name
DOMAIN_NAME=`az rest --method get --url https://graph.microsoft.com/v1.0/domains --query 'value[?isDefault].id' -o tsv`

# Set DISPLAY NAME from Terraform random name generation
DISPLAY_NAME="sp_terraform_"${DOMAIN_NAME}

# Display chosen DISPLAY NAME on terminal
echo "app_name="${DISPLAY_NAME}

# Retrieve subscription ID
SUBSCRIPTION_ID=`az account list --query "[?isDefault].id" --output tsv`

# Store OBJECT_ID in environment file
echo "subscription_id="${SUBSCRIPTION_ID} >> ./environment

# Create App Registration
OBJECT_ID=`az ad app create --display-name ${DISPLAY_NAME} \
--web-redirect-uris https://misfirm.com \
--sign-in-audience AzureADMultipleOrgs | jq -r '.id'`

# Store OBJECT_ID in environment file
echo "object_id="${OBJECT_ID} >> ./environment

# Output OBJECT_ID to terminal
echo "subscription_id="${SUBSCRIPTION_ID}

# Output OBJECT_ID to terminal
echo "object_id="${OBJECT_ID}