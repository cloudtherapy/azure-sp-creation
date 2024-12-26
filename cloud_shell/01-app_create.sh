#!/bin/bash
# Obtain domain name and export
domain_name=`az rest --method get --url https://graph.microsoft.com/v1.0/domains --query 'value[?isDefault].id' -o tsv`
export domain_name

# Set, export and store app name
app_name="sp_terraform_"${domain_name}"_"${RANDOM}
export app_name
echo "app_name="${app_name} >> ./environment

# Retrieve, export and store subscription ID
subscription_id=`az account list --query "[?isDefault].id" --output tsv`
export subscription_id
echo "subscription_id="${subscription_id} >> ./environment

# Create App Registration, export object ID and store it
object_id=`az ad app create --display-name ${app_name} \
--web-redirect-uris https://misfirm.com \
--sign-in-audience AzureADMultipleOrgs | jq -r '.id'`
export object_id
echo "object_id="${object_id} >> ./environment