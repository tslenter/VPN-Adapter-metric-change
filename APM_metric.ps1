#MAX retry + wait timer can be useed to set the agression. Timers are used in seconds.

$count = 0
$status = 'False'
$adapter_name = 'APM Network Access'
$max_retry = 10
$wait_timer_for_retry = 2

while ($status -eq 'False')
{
	$adapter_up = (Get-NetAdapter -Name $adapter_name -ErrorAction SilentlyContinue | select-object -ExpandProperty Name)
	$status = ([string]::IsNullOrEmpty($adapter_up))
	Write-Host "Checking VPN status! Retry $count ..."
	sleep $wait_timer_for_retry
	$count++
	if ($count -eq $max_retry)
	{
		exit
	}
}

Write-Host "VPN adapter found! Set new metric ..."
Set-NetIPInterface -InterfaceAlias $adapter_name -InterfaceMetric 10
ipconfig /flushdns