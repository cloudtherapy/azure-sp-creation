. ./environment

# Create Enterprise Application
sp_object_id=`az ad sp create --id ${object_id} | jq -r '.id'`

# Store SP_OBJECT_ID in environment file
echo "sp_object_id="${sp_object_id} >> ./environment

# Output SP_OBJECT_ID to terminal
echo "sp_object_id="${sp_object_id}

cat ./environment