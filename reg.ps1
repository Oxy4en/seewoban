function BAN {
    param (
        [string]$processName
    )
    
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$processName"

    try {
        New-Item -Path $regPath -Force -ErrorAction Stop | Out-Null
        Write-Host "[$processName] Registry is created :) : $regPath" -ForegroundColor Green
    } catch {
        Write-Host "[$processName] Registry creation failed :( : $regPath" -ForegroundColor Red
        return
    }

    try {
        Set-ItemProperty -Path $regPath -Name debugger -Value "/" -Force -ErrorAction Stop
        Write-Host "[$processName] Hijack succeeded¡£" -ForegroundColor Green
    } catch {
        Write-Host "[$processName] Hijack failed" -ForegroundColor Red
        return
    }

    try {
        Stop-Process -Name $processName -Force -ErrorAction Stop
        Write-Host "[$processName] KILL succeeded" -ForegroundColor Yellow
    } catch {
        Write-Host "[$processName] KILL failed" -ForegroundColor Yellow
    }
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
    Write-Host "[$program]..." -ForegroundColor Cyan
    BAN $program
    Write-Host "----------------------------------------"
}
