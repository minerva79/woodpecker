$location = "f:\library.txt"
$change = Get-Content $location

$change|foreach {
	$line=$_
	If ($_.StartsWith("L1")) {
		$line -replace "/", "\"
		}
	Else{
		$line
		}
	 }| Set-Content $location

$change|foreach {
	$line=$_
	If ($_.StartsWith("L1")) {
		$line -replace "internal-pdf://","file:\\location\where\endnote\stores\your\pdfs\"
		}
	Else{
		$line
		}
	 }| Set-Content $location
