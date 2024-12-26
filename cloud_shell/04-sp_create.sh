# Create Enterprise Application and export
sp_object_id=`az ad sp create --id ${object_id} | jq -r '.id'`
export $sp_object_id

# Store sp_object_id in environment file
echo "sp_object_id="${sp_object_id} >> ./environment