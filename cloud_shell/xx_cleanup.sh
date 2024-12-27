. ./environment

# Destroy Application including Enterprise App
az ad app delete --id ${object_id}

# Delete app_name from environment file
sed -i '/app_name/d' ./environment

# Delete object_ID from environment file
sed -i '/object_id/d' ./environment

# Delete subscription_id from environment file
sed -i '/subscription_id/d' ./environment

# Delete tenant_id from environment file
sed -i '/tenant_id/d' ./environment

# Delete sp_object_id from environment file
sed -i '/sp_object_id/d' ./environment

rm -Rf ./secret.tfvars.json