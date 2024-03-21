@echo off
title ipv4LKUP
set /p url=Enter URL: 

for /f "delims=" %%a in ('powershell -command "(Resolve-DnsName -Name '%url%' -Type A).IPAddress"') do (
    set ipv4=%%a
    goto :found_ipv4
)

:found_ipv4
if defined ipv4 (
    echo IPv4 Address: %ipv4%
) else (
    echo Unable to resolve URL to IPv4 address.
)
pause
