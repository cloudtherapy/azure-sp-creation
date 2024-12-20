. ./environment

# Create Enterprise Application
SP_OBJECT_ID=`az ad sp create --id ${OBJECT_ID} | jq '.id'`

# Store SP_OBJECT_ID in environment file
echo "SP_OBJECT_ID="${SP_OBJECT_ID} >> ./environment

# Output SP_OBJECT_ID to terminal
echo "SP_OBJECT_ID="${SP_OBJECT_ID}