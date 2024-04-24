# Bicep
My Bicep templates

## Budget_Monthly

Created this to set a forecasted budget for an Azure subscription. Userd to get an email alert if forecasted cost is set to go over limit coming month.
Use this json to deploy budget or do it yourself with
This is based on https://github.com/Azure/azure-quickstart-templates/tree/ad176f7c9c989d73e5695af0ed4aa1ad77e25cf2/quickstarts/microsoft.consumption/create-budget  
New-AzSubscriptionDeployment -TemplateFile Budget_Monthly.bicep -amount 40 -startDate 2024-05-01 -contactEmails someone@some.com -Location westeurope

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMathiasgreyit%2Fbicep%2Fmain%2Fazuredeploy%2Fbudget_monthly.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FMathiasgreyit%2Fbicep%2Fmain%2Fazuredeploy%2Fbudget_monthly.json)