Start-Transcript C:\transcript.txt -Append

$dump_path = "C:\temp"

$max_days = "-10"

$curr_date = Get-Date

$del_date = $curr_date.AddDays($max_days)

Get-ChildItem $dump_path -Recurse | Where-Object { $_.LastWriteTime -lt $del_date } | Remove-Item -Verbose

Stop-Transcript