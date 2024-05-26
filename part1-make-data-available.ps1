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

$GROUP="rg-fbu-aml-001"
$LOCATION="westeurope"
$WORKSPACE="fbu-aml-001"
$COMPUTE_INSTANCE="fbu-compute-instance"
$COMPUTE_CLUSTER="fbu-compute-cluster"

"""
PART 3 : Create a resource group and a workspace
"""

# Create a resource group
az group create --name $GROUP --location $LOCATION

# Create a workspace
az ml workspace create -w $WORKSPACE -g $GROUP -l $LOCATION

# set default configuratons
az configure --defaults group=$GROUP workspace=$WORKSPACE location=$LOCATION

# list the configurations
az configure -l -o table

# Create compute instance
Write-Output "Creating a compute instance with name: " $COMPUTE_INSTANCE
az ml compute create --workspace-name=$WORKSPACE --resource-group=$GROUP --name=$COMPUTE_INSTANCE --size=STANDARD_DS11_V2 --type=ComputeInstance 

# Create compute cluster
Write-Output "Creating a compute cluster with name: " $COMPUTE_CLUSTER
az ml compute create --name=$COMPUTE_CLUSTER --size=STANDARD_DS11_V2 --max-instances=2 --type=AmlCompute 



"""
PART 4 : Force cleaning all the resource group
"""

# Clean up
az group delete --name $GROUP --yes --no-wait


