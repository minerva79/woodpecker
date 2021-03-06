## Function ExcelCSV
##       - Function to convert named excel file (with .xlsx ext) to comma separated values (.csv) 
## Source: https://zeleskitech.com/2014/10/26/convert-xlsx-csv-powershell/

Function ExcelCSV ($File)
{
 
    $excelFile = "$pwd\" + $File + ".xlsx"
    $Excel = New-Object -ComObject Excel.Application
    $Excel.Visible = $false
    $Excel.DisplayAlerts = $false
    $wb = $Excel.Workbooks.Open($excelFile)
    foreach ($ws in $wb.Worksheets)
    {
        $ws.SaveAs("$pwd\" + $File + ".csv", 6)
    }
    $Excel.Quit()
}

$path = "C:\tmsqrf\instream\input\exo"

Get-ChildItem $path -Filter *.xlsx | 
Foreach-Object {
    $FileName = (Split-Path -Path $_ -Leaf).Split(".")[0]
    ExcelCSV -File "$FileName"
    }
