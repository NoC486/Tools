@ECHO OFF
reg.exe add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config /f /t REG_DWORD /v MinPollInterval /d 6
reg.exe add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config /f /t REG_DWORD /v MaxPollInterval /d 6
reg.exe add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config /f /t REG_DWORD /v UpdateInterval /d 100
reg.exe add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient /f /t REG_DWORD /v SpecialPollInterval /d 64
sc.exe config w32time start=auto
sc.exe stop w32time
sc.exe start w32time
w32tm.exe /config /manualpeerlist:"time.apple.com time.windows.com time.cloudflare.com" /syncfromflags:manual /update
