# Obtain unique domain name
DOMAIN_NAME=`az rest --method get --url https://graph.microsoft.com/v1.0/domains --query 'value[?isDefault].id' -o tsv`

# Set DISPLAY NAME from Terraform random name generation
DISPLAY_NAME="SP_TF_"${DOMAIN_NAME}

# Display chosen DISPLAY NAME on terminal
echo "DISPLAY_NAME="${DISPLAY_NAME}

# Retrieve subscription ID
SUBSCRIPTION_ID=`az account list --query "[?isDefault].id" --output tsv`

# Store OBJECT_ID in environment file
echo "SUBSCRIPTION_ID="${SUBSCRIPTION_ID} >> ./environment

# Create App Registration
OBJECT_ID=`az ad app create --display-name ${DISPLAY_NAME} \
--web-redirect-uris https://misfirm.com \
--sign-in-audience AzureADMultipleOrgs | jq -r '.id'`

# Store OBJECT_ID in environment file
echo "OBJECT_ID="${OBJECT_ID} >> ./environment

# Output OBJECT_ID to terminal
echo "SUBSCRIPTION_ID="${SUBSCRIPTION_ID}

# Output OBJECT_ID to terminal
echo "OBJECT_ID="${OBJECT_ID}