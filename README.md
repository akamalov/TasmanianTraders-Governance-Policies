# Microsoft Azure Enterprise Scaffold
This repo is meant to provide sample templates and scripts to jumpstart the implementation of the [Azure Enterprise Scaffold](https://azure.microsoft.com/en-us/documentation/articles/resource-manager-subscription-governance/) governance approach. In real life, scaffolding is used to create the basis of the structure. The scaffold guides the general outline, and provides anchor points for more permanent systems to be mounted. An enterprise scaffold is the same: a set of flexible controls and Azure capabilities that provide structure to the environment, and anchors for services built on the public cloud. It provides the builders (IT and business groups) a foundation to create and attach new services. 

## Automating Azure Resource Manager Policy Management
The PowerShell scripts, automation runbooks and policy json files are focused on automating [Azure Resource Manager Policies](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-policy). The repo folders contain the following:
### [/policydef](https://github.com/karlkuhnhausen/azure-scaffold/tree/master/policydef)
A set of sample json files that define sample policies. [Other examples](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-policy#policy-definition-examples) can be found on azure.microsoft.com. Some of which I have cribbed here.
### [/scripts](https://github.com/karlkuhnhausen/azure-scaffold/tree/master/scripts)
Sample PowerShell scripts adapted to run via deployment tools (like Visual Studio Team Services) which will apply the policy definition and policy assignment cmdlets.
## More Reading
* For a full discussion of the Azure Enterprise Scaffold see [Azure Enterprise Scaffold - Prescriptive Subscription Governance](https://azure.microsoft.com/en-us/documentation/articles/resource-manager-subscription-governance/).
