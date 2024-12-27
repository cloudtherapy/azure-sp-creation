. ./environment

# Add API permission of User.Read (Graph)
az ad app permission add --id ${object_id} \
--api 00000003-0000-0000-c000-000000000000 \
--api-permissions e1fe6dd8-ba31-4d61-89e7-88639da4683d=Scope