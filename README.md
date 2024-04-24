# Bicep
My Bicep templates

## Budget_Monthly

Created this to set a forecasted budget for an Azure subscription. Userd to get an email alert if forecasted cost is set to go over limit coming month.
Use this json to deploy budget or do it yourself with
This is based on https://github.com/Azure/azure-quickstart-templates/tree/ad176f7c9c989d73e5695af0ed4aa1ad77e25cf2/quickstarts/microsoft.consumption/create-budget  
New-AzSubscriptionDeployment -TemplateFile Budget_Monthly.bicep -amount 40 -startDate 2024-05-01 -contactEmails someone@some.com -Location westeurope

- **Budget Name**: Name of the budget. It should be unique within the resource group.
- **Amount**: The total amount of cost or usage to track with the budget. Any decimal value is allowed.
- **Time Grain**: The time covered by a budget. Tracking of the amount will be reset based on the time grain. Allowed values are: _Monthly_, _Quarterly_, _Annually_. If not defined it will be monthly
- **Start Date**: The start date must be first of the month in `YYYY-MM-DD` format and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date shouldn't be more than three months. Past start date should be selected within the **Time Grain** period.
- **Threshold**: Notification is sent when the expected cost exceeded the threshold. It's always percent and has to be between 0.01 and 1000.
- **Contact Emails**: The list of email addresses to send the budget notification to when the threshold is exceeded. It accepts array of strings. Example, single ["user1@somet.com"] or multiple ["user1@somet.com","user2@other5.com"] 

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMathiasgreyit%2Fbicep%2Fmain%2Fazuredeploy%2Fbudget_monthly.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FMathiasgreyit%2Fbicep%2Fmain%2Fazuredeploy%2Fbudget_monthly.json)