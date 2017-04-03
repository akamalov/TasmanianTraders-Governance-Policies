<#
    .DESCRIPTION
        Script to apply policy scripts (in bulk) to the current subscription on 
    
    .NOTES
        AUTHOR: Karim Vaes
        LASTEDIT: April 3, 2017
#>

$ctx = Get-AzureRmContext
$subId = $ctx.Subscription.SubscriptionId
$subScope = "/subscriptions/" + $subId
$subName = $ctx.Subscription.SubscriptionName
$polPrefix = "Policy-Sub-Scope-"
$polSuffix = "-TasmanianTraders"

# List of policies
$polList=@()
$polList += ,@("ES-Approved-Regions","Only allow approved regions", "$PSScriptRoot\..\policydef\ES-Approved-Regions.json")
$polList += ,@("ES-Approved-Storage-SKUs","Only allow approved storage SKUs", "$PSScriptRoot\..\policydef\ES-Approved-Storage-SKUs.json")
$polList += ,@("ES-Require-Storage-Encryption","Require Storage Encryption", "$PSScriptRoot\..\policydef\ES-Require-Storage-Encryption.json")

Write-Output "*** Applying policies to subscription : $subName ($subId)"
foreach ($polItem in $polList.GetEnumerator()) {
    $polName = $polItem[0]
    $polDescription = $polItem[1]
    $polFileLocal = $polItem[2]
    Write-Output "*** Applying : $polName"
    $polDefinition = New-AzureRmPolicyDefinition -Name $polName -Description $polDescription -Policy $polFileLocal
    Write-Output "*** Defined Policy : " $polDefinition
    $polAssignment = New-AzureRmPolicyAssignment -Name "$polPrefix$polName$polSuffix" -PolicyDefinition $polDefinition -Scope $subScope
    Write-Output "*** Assigned Policy : " $polAssignment
}