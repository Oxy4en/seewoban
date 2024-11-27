function BAN {
    param (
        [string]$processName
    )
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$processName"
    New-Item -Path $regPath -Force | Out-Null
    Set-ItemProperty -Path $regPath -Name debugger -Value "/" -Force
    Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
}
$programs = @(
    "SeewoHugoLauncher",
    "proxyLayerService",
    "SeewoAbility",
    "liveClient",
    "resolution",
    "SeewoCore",
    "media_capture",
    "rtcRemoteDesktop",
    "screenCapture",
    "BlueScreenView",
    "CoverShutdown",
    "InjectAdapter",
    "Injector",
    "Installer",
    "ReserveFileUI",
    "SeewoFreezeUI",
    "SeewoFreezeUpdateAssist",
    "SendEmail",
    "split",
    "tracepdb",
    "SeewoServiceAssistant"
)
foreach ($program in $programs) {
    BAN $program
}
