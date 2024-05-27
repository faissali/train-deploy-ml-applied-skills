"""
PART 1 : Installation & extensions configuration
"""
# Remove any existing ml extensions
az extension remove -n azure-cli-ml
az extension remove -n ml

# Add the Azure Machine Learning extension
az extension add -n ml

"""
PART 2 : Setup the environment
"""

# Login to azure
az login

# You can set active subscription using below command
# az account set --subscription <subscription_id>

$GROUP="fbu-rg-dp100-labs"
$LOCATION="westeurope"
$WORKSPACE="fbu-mlw-dp100-labs"


"""
PART 3 : Create a resource group and a workspace
"""

# Create a resource group
az group create --name $GROUP --location $LOCATION

# Create a workspace
az ml workspace create --name=$WORKSPACE --resource-group=$GROUP

# Clean up
#az group delete --name $GROUP --yes --no-wait


