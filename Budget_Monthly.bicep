targetScope = 'subscription'

@description('Name of customer')
param customer string

@description('The total amount of cost or usage to track with the budget')
param amount int = 1000

@description('The time covered by a budget. Tracking of the amount will be reset based on the time grain.')
@allowed([
  'Monthly'
  'Quarterly'
  'Annually'
])
param timeGrain string = 'Monthly'

@description('Name of the Budget. It should be unique within a resource group.')
param budgetName string = '${customer} ${timeGrain}'

@description('The start date must be first of the month in YYYY-MM-DD format. Future start date should not be more than three months. Past start date should be selected within the timegrain preiod.')
param startDate string

@description('The end date for the budget in YYYY-MM-DD format. If not provided, we default this to 10 years from the start date.')
var endDate = dateTimeAdd(startDate, 'P5Y')

@description('Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold. It is always percent and has to be between 0.01 and 1000.')
param Threshold int = 100

@description('The list of email addresses to send the budget notification to when the threshold is exceeded.')
param contactEmails array

resource budgetName_resource 'Microsoft.Consumption/budgets@2021-10-01' = {
  name: budgetName
  properties: {
    timePeriod: {
      startDate: startDate
      endDate: endDate
    }
    timeGrain: timeGrain
    amount: amount
    category: 'Cost'
    notifications: {
      NotificationForForecastedOverAmount: {
        enabled: true
        operator: 'GreaterThan'
        threshold: Threshold
        thresholdType: 'Forecasted'
        contactEmails: contactEmails
      }
    }
  }
}
