. .\Get-Rest-URL.ps1;
. .\Get-Rest-Response.ps1;
#Write-Output ("{0}: {1}" -f $oc.Name, $response);
$results = Get-Rest-Response;
foreach($result in $results.GetEnumerator()){
	Start-Sleep -s 2;
	if($result.Value -ne "200"){
		Write-Host  ("{0}" -f $result.Name) -NoNewline; 
		Write-Host  (": {0}" -f $result.Value) -ForegroundColor Red;
	}else{
		Write-Host  ("{0}" -f $result.Name) -NoNewline; 
		Write-Host  (": {0}" -f $result.Value) -ForegroundColor Green;
	}
}