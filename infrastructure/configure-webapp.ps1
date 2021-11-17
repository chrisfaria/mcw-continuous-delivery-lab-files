$studentprefix = "491799"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix + "cf"
$webappName = "fabmedical-web-" + $studentprefix

# Fetch CosmosDB Mongo connection string
$mongodbConnectionString = `
    $(az cosmosdb keys list `
        --name $cosmosDBName `
        --resource-group $resourcegroupName `
        --type connection-strings `
        --query 'connectionStrings[0].connectionString')

# Configure Web App
az webapp config appsettings set `
    --name $webappName `
    --resource-group $resourcegroupName `
    --settings MONGODB_CONNECTION=$mongodbConnectionString
