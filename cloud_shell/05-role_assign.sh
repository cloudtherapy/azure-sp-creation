# Assign Contributor role to service principal for a given subscription
az role assignment create --assignee "${sp_object_id}" \
--role "Contributor" \
--scope "/subscriptions/${subscription_id}"