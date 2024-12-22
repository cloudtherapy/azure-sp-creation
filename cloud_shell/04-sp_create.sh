. ./environment

# Create Enterprise Application
SP_OBJECT_ID=`az ad sp create --id ${OBJECT_ID} | jq -r '.id'`

# Store SP_OBJECT_ID in environment file
echo "sp_object_id="${SP_OBJECT_ID} >> ./environment

# Output SP_OBJECT_ID to terminal
echo "sp_object_id="${SP_OBJECT_ID}

cat ./environment