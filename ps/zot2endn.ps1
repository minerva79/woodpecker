$location = "c:\new\ris_ecology\library.ris"
$change = Get-Content $location

$change|foreach {
	$line=$_
	If ($_.StartsWith("L1")) {
		$line -replace "files/", "internal-pdf://files/"
		}
	Else{
		$line
		}
	 }| Set-Content $location