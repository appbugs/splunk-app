# configuration for the passwordcheck.ps1

## This is the administrator mailbox that running the script and it will also be used to send email messages
$adminMailbox = "administrator@itpro.local"

## Bcrypt.Net install path
$bcryptNetPath = ".\bcryptnet\BCrypt.Net.dll"

## Password check service url template
$passwordCheckServiceUrlTemplate = "https://www.vericlouds.com/private_search/api.php?mode=privacy_preserving_account_query&token=jjd6Edwjs6&email="

## User attribute to set when a matching leaked password is found
$attributeToSet = "CustomAttribute13"

## Value of the user attribute to set when a matching leaked password is found
$valueOfAttribute = "Password leaked!"

## Safe IP address mask white list
$safeIpMaskTable=@("10.255.255.255", "192.168.255.255", "172.31.255.255")

## Default maximum logon history count
$defaultMaxLogonHistoryCount = 10