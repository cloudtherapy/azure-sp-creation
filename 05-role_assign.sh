. ./environment

# Assign Contributor role to service principal for a given subscription
az role assignment create --assignee "${SP_OBJECT_ID}" \
--role "Contributor" \
--scope "/subscriptions/${SUBSCRIPTION_ID}"