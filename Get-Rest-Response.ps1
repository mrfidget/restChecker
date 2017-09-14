function Get-Rest-Response($ocs){
	. .\Get-Rest-URL.ps1;	
	$response = "";
	$uri = "";
	$server = "";
	$server = Get-Rest-URL;
	$results = @{};	
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
	Start-Sleep -s 2;
	return $results;
}
