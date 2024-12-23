. ./environment

# Destroy Application including Enterprise App
az ad app delete --id ${object_id}

# Delete OBJECT_ID from environment file
sed -i '/object_id/d' ./environment

# Delete SUBSCRIPTION_ID from environment file
sed -i '/subscription_id/d' ./environment

# Delete APP_ID from environment file
sed -i '/client_id/d' ./environment

# Delete SECRET_ID from environment file
sed -i '/client_secret/d' ./environment

# Delete SP_OBJECT_ID from environment file
sed -i '/sp_object_id/d' ./environment

# Delete SUBSCRIPTION_ID from environment file
sed -i '/subscription_id/d' ./environment