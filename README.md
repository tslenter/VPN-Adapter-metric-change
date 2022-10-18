Problem: wrong DNS server is selected for VPN split tunnel. Lowering the metric on the VPN adapter solves this problem.

# VPN-Adapter-metric-change
Change VPN adapter metric using PowerShell

To use APM_metric.ps1 change the following variables to the correct values:

```
$adapter_name = 'my_adapter'
$max_retry = seconds
$wait_timer_for_retry = max retry's
```

Culculation for agression: $max_retry * $wait_timer_for_retry = maximum seconds before exit

Example:

```
$adapter_name = 'APM Network Access'
$max_retry = 10
$wait_timer_for_retry = 2
```

The next step is to schedule the APM_metric.ps1 script for login.
