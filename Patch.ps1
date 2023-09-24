if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $Command = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb RunAs -ArgumentList $Command
        Exit
 }
}

try {
    $rblxPath = Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\ROBLOX Corporation\Environments\roblox-player' -Name '(Default)'
    $rblxPath = $rblxpath -replace 'RobloxPlayerLauncher.exe'
    echo $rblxPath
    iwr -uri 'https://raw.githubusercontent.com/rbxflags/Flags/main/ClientAppSettings.json' -OutFile(New-Item -Path $rblxPath/ClientSettings/ClientAppSettings.json -Force)
    echo 'Installed Successfully'
}
catch {
    $rblxAltPath = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\roblox-player-admin' -Name 'InstallLocation'
    echo $rblxAltPath
    iwr -uri 'https://raw.githubusercontent.com/rbxflags/Flags/main/ClientAppSettings.json' -OutFile(New-Item -Path $rblxAltPath/ClientSettings/ClientAppSettings.json -Force)
    echo 'Installed Successfully'
}