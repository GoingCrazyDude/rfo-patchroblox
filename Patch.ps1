$rblxPath = Get-ItemPropertyValue -Path 'Registry::HKEY_CURRENT_USER\Software\ROBLOX Corporation\Environments\roblox-player' -Name '(Default)'
$rblxPath = $rblxpath -replace 'RobloxPlayerLauncher.exe'
$rblxAltPath = Get-ItemPropertyValue -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\roblox-player-admin' -Name 'InstallLocation'
iwr -uri 'https://raw.githubusercontent.com/rbxflags/Flags/main/ClientAppSettings.json' -OutFile(New-Item -Path $rblxPath/ClientSettings/ClientAppSettings.json -Force)
iwr -uri 'https://raw.githubusercontent.com/rbxflags/Flags/main/ClientAppSettings.json' -OutFile(New-Item -Path $rblxAltPath/ClientSettings/ClientAppSettings.json -Force)