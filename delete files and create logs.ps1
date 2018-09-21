#script for deltiting old files and creating logs
#created by michaels simonovsky 11/09/17 v1

$dump_path = "C:\Temp"

$max_days = "0"

$curr_date = Get-Date

$del_date = $curr_date.AddDays($max_days)

$DateTime = Get-Date -Format "DMM-dd-yyyy_THH-mm-ss"
$Error.Clear()

#-----------------------deleting files-------------------------------------------------------------

Get-ChildItem $dump_path -Recurse | Where-Object { $_.LastWriteTime -lt $del_date }|tee -FilePath "C:\Deleted Files-$DateTime.txt"| Remove-Item  -ErrorAction  Continue  2>> C:\errors.txt 








