. ./environment

# Destroy Application including Enterprise App
az ad app delete --id ${OBJECT_ID}

# Delete OBJECT_ID from environment file
sed -i '/OBJECT_ID/d' ./environment

# Delete SUBSCRIPTION_ID from environment file
sed -i '/SUBSCRIPTION_ID/d' ./environment