. .\Get-Rest-URL.ps1;
. .\Get-Rest-Response.ps1;
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition;
$results = @{};	
$ocs = @{};
$ocs = Import-Csv -Path ("{0}{1}" -f $scriptPath,"\data\restCheckerData.CSV");
Write-Host  ("Got {0} OCs from file" -f $ocs.length) -ForegroundColor Yellow;
Write-Host  ("Getting results from the service") -ForegroundColor Yellow;
$results = Get-Rest-Response($ocs);
foreach($result in $results.GetEnumerator()){	
	if($result.Value -ne "200"){
		Write-Host  ("{0}:" -f $result.Name) -NoNewline; 
		Write-Host  (" {0}" -f $result.Value) -ForegroundColor Red;
	}else{
		Write-Host  ("{0}:" -f $result.Name) -NoNewline; 
		Write-Host  (" {0}" -f $result.Value) -ForegroundColor Green;
	}
}