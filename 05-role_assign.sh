. ./environment

# Assign Contributor role to service principal for a given subscription
az role assignment create --assignee "${SP_OBJECT_ID}" \
--role "Contributor" \
--scope "/subscriptions/${SUBSCRIPTION_ID}"

# Delete SP_OBJECT_ID from environment file
sed -i '/SP_OBJECT_ID/d' ./environment

# Delete SUBSCRIPTION_ID from environment file
sed -i '/SUBSCRIPTION_ID/d' ./environment