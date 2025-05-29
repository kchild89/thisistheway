Write-Host "Running first SFC scan..."
sfc /scannow
Start-Sleep -Seconds 3

Write-Host "Running component cleanup..."
dism /online /cleanup-image /startcomponentcleanup
Start-Sleep -Seconds 3

Write-Host "Running DISM restorehealth..."
dism /online /cleanup-image /restorehealth
Start-Sleep -Seconds 3

Write-Host "Running second SFC scan..."
sfc /scannow
Start-Sleep -Seconds 3

Write-Host "Flushing DNS..."
ipconfig /flushdns
Start-Sleep -Seconds 3

if (Test-Path C:\) {
    Write-Host "Defragging C:..."
    defrag C: /O
    Start-Sleep -Seconds 3
}

if (Test-Path B:\) {
    Write-Host "Defragging B:..."
    defrag B: /O
    Start-Sleep -Seconds 3
}

Write-Host "All done. Shutting down now. This is the way."

# Stop logging
Stop-Transcript

# Shutdown
shutdown /s /t 10
