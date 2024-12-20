# Choose a DISPLAY NAME for the service principal
echo "What DISPLAY NAME would you like to utilize?"
read DISPLAY_NAME

# Display chosen DISPLAY NAME on terminal
echo "DISPLAY="${DISPLAY_NAME}

# Retrieve subscription ID
SUBSCRIPTION_ID=`az account list --query "[?isDefault].id" --output tsv`

# Store OBJECT_ID in environment file
echo "SUBSCRIPTION_ID="${SUBSCRIPTION_ID} >> ./environment

# Create App Registration
OBJECT_ID=`az ad app create --display-name ${DISPLAY_NAME} \
--sign-in-audience AzureADMultipleOrgs | jq -r '.id'`

# Store OBJECT_ID in environment file
echo "OBJECT_ID="${OBJECT_ID} >> ./environment

# Output OBJECT_ID to terminal
echo "SUBSCRIPTION_ID="${SUBSCRIPTION_ID}

# Output OBJECT_ID to terminal
echo "OBJECT_ID="${OBJECT_ID}