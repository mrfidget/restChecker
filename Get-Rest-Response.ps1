$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition;
function Get-Rest-Response(){
	. .\Get-Rest-URL.ps1;
	$ocs = @{};
	$response = "";
	$uri = "";
	$server = "";
	$server = Get-Rest-URL;
	$results = @{};
	$ocs = Import-Csv -Path ("{0}{1}" -f $scriptPath,"\data\restCheckerData.CSV");
	foreach($oc in $ocs.GetEnumerator()){
		$uri = ("{1}/{0}/GBR" -f $oc.Value,$server); 	
		try
		{
			$response = (Invoke-WebRequest -Uri $uri -DisableKeepAlive).statusCode
		}
		Catch
		{	
			$response = $_.Exception.Response.StatusCode.Value__;
		}		
		$results.Add($oc.Name, $response); 		
	}
	#Write-Output ($results);
	return $results;
}
