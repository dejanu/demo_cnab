# check if user is logged in azure cli
if [ -z "$(az account show)" ]; then
    echo "Please login to azure cli"
    az login --use-device-code
else
    echo "Logged in to azure cli with the following account:"
    az account show -o table
fi
separator_stuff="\e[1;32m ===============================================================\e[0m\n"
# list available subscriptions
echo -e "$separator_stuff Available subscriptions:"
az account list -o table --all

# select and set subscription using subscription_id variable
echo -e "$separator_stuff Select subscriptionId :"
read subscription_id
az account set --subscription $subscription_id

# list all resource groups in the selected subscription
echo -e "$separator_stuff Available RESOURCE GROUPS in the selected subscription:"
#az group list -o table --query "[?contains(id, '$subscription_id')]"
az group list -o table

# select and set resource group using resource_group variable
echo -e "$separator_stuff Select resource group :"
read resource_group
echo -e "$separator_stuff Available RESOURCES in the $resource_group RESOURCE GROUP:"
az resource list --query "[?resourceGroup=='$resource_group']" -o table