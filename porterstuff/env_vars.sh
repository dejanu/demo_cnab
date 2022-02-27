#!/usr/bin/env bash

# porter home
export PORTER_HOME=~/.porter
export PATH=$PORTER_HOME:$PATH

# access keys for storage account
export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=portersa;AccountKey=c54LjxFlXCEiXVkiejCA/66zUC0Fmtfm1zQeP7iZqurjGXfLNnuTNqdAR1qYvZXanvl47z4ri4qX+AStz3zJAw==;EndpointSuffix=core.windows.net"
# service principal (new app registration in AD) app id and 
export AZURE_CLIENT_ID="9cb76cf8-cfad-4fc4-8224-40ebc12dd6b7"
export AZURE_TENANT_ID="13d690a2-380a-41b4-9f55-cbcca9037ca9"

export AZURE_CLIENT_SECRET="hwm7Q~cbySlyv4lpxlI_Sm.hCZl7nNuV~bwNV"
export AZURE_CLIENT_SECRET_ID="9d46f2c2-da84-495f-84f3-679e67bb4884"

# subscription ID
export AZURE_SUBSCRIPTION_ID="bbe29726-b75f-4baa-87b6-c2a3f1eb4114"
