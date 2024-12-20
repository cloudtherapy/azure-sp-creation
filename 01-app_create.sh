# Set DISPLAY NAME from Terraform random name generation
DISPLAY_NAME=`terraform output -raw service_principal`

echo "DISPLAY_NAME="${DISPLAY_NAME} >> ./environment

# Display chosen DISPLAY NAME on terminal
echo "DISPLAY="${DISPLAY_NAME}

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