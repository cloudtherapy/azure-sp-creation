. ./environment

# Destroy Application including Enterprise App
az ad app delete --id ${object_id}

# Delete app_name from environment file
sed -i '/app_name/d' ./environment

# Delete object_ID from environment file
sed -i '/object_id/d' ./environment

# Delete subscription_id from environment file
sed -i '/subscription_id/d' ./environment

# Delete client_id from environment file
sed -i '/client_id/d' ./environment

# Delete client_secret from environment file
sed -i '/client_secret/d' ./environment

# Delete sp_object_id from environment file
sed -i '/sp_object_id/d' ./environment