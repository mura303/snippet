
$taskPath = "\mytasks\";
$taskName = "My backup task";
$taskAction = New-ScheduledTaskAction -Execute "C:\home\zubora\batchan.m3u8" -WorkingDirectory "C:\home\zubora"
$taskTrigger = New-ScheduledTaskTrigger -DaysInterval 1 -Daily -At "9:33"

Register-ScheduledTask -TaskName $taskName `
  -TaskPath $taskPath `
  -Action $taskAction `
  -Trigger $taskTrigger -Force
