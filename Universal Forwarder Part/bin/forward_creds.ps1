. 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'

Connect-ExchangeServer -auto -ClientApplication:ManagementShell

. '.\config.ps1'

# preparation
$resultTypeDef = @"
public class Result {      
    public string result;
	public class Hash_algorithm {
		public string ca_hash;
		public string ca_salt;
	}
	public class Record {
		public string email;
		public string password_hash;
		public Hash_algorithm hash_algorithm;
	}
	public Record[] records;
}
"@;

add-type -TypeDefinition $resultTypeDef;

add-type -AssemblyName "System.Runtime.Serialization"

add-type -path $bcryptNetPath

# iterating mailboxes
$mailboxes=get-mailbox -RecipientTypeDetails UserMailbox -ResultSize Unlimited;

$mailboxes | foreach {
	$mbx = $_;
	$upn = $_.UserPrincipalName.ToLower();
	$upnParts = $upn.Split('@');
	$username = $upnParts[0];
	$dnsDomain = $upnParts[1];
	$dn = $_.DistinguishedName;
	
	$dc = get-addomaincontroller -domainname $dnsDomain -discover:$false
	$account = Get-ADReplAccount -DistinguishedName $dn -server $dc
	$md5Hash = $null;
	if ($account -ne $null) {
		$md5Hash = $account.SupplementalCredentials.WDigest[8]
		$md5HashString = [string]::Format("{0:x2}{1:x2}{2:x2}{3:x2}{4:x2}{5:x2}{6:x2}{7:x2}{8:x2}{9:x2}{10:x2}{11:x2}{12:x2}{13:x2}{14:x2}{15:x2}",
		$md5Hash[0], $md5Hash[1], $md5Hash[2], $md5Hash[3], $md5Hash[4], $md5Hash[5], $md5Hash[6], $md5Hash[7],
		$md5Hash[8], $md5Hash[9], $md5Hash[10], $md5Hash[11], $md5Hash[12], $md5Hash[13], $md5Hash[14], $md5Hash[15]);
		write-host "email: "$upn ", password-hash: "$md5HashString
		
		Add-Content 'C:\Users\Administrator\Desktop\accounts_credentials.txt' "$upn--|--$md5HashString"
	}
}
