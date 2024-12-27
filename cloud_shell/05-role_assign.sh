. ./environment

# Retrieve default subscription ID
subscription_id=`az account list --query "[?isDefault].id" --output tsv`
echo "subscription_id="${subscription_id} >> ./environment

# Assign Contributor role to service principal for a given subscription
az role assignment create --assignee "${sp_object_id}" \
--role "Contributor" \
--scope "/subscriptions/${subscription_id}"