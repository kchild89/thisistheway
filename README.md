# thisistheway

# thisIsTheWay.ps1

A PowerShell script that automates essential Windows maintenance tasks. This script runs system checks, cleans up components, flushes DNS, defrags drives (if available), logs the output, and shuts down your PC when complete.

---

## 🧰 What This Script Does

- ✅ Runs `sfc /scannow` twice
- ✅ Cleans up system components with DISM
- ✅ Restores system image health with DISM
- ✅ Flushes DNS cache
- ✅ Defrags `C:` and `B:` drives if they exist
- ✅ Logs all output to a `.txt` file on your desktop
- ✅ Shuts down the machine 10 seconds after finishing

---

## 💾 Script Code

Save this as `thisIsTheWay.ps1`:

```powershell
# Start logging
$log = "$env:USERPROFILE\Desktop\thisIsTheWay_log.txt"
Start-Transcript -Path $log

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

# Defrag C: if it exists
if (Test-Path C:\) {
    Write-Host "Defragging C:..."
    defrag C: /O
    Start-Sleep -Seconds 3
}

# Defrag B: if it exists
if (Test-Path B:\) {
    Write-Host "Defragging B:..."
    defrag B: /O
    Start-Sleep -Seconds 3
}

Write-Host "All done. Shutting down now. This is the way."

# Stop logging
Stop-Transcript

# Shutdown after 10 seconds
shutdown /s /t 10
▶️ How to Run It
Open PowerShell as Administrator

Navigate to where the script is saved:

powershell
Copy
Edit
cd "C:\path\to\your\script"
Run the script:

powershell
Copy
Edit
.\thisIsTheWay.ps1
ℹ️ Notes
You must run this script as Administrator.

A full log is saved to your desktop:

C:\Users\YourName\Desktop\thisIsTheWay_log.txt

The script will skip any defrag if C: or B: aren't found.

The computer will shut down 10 seconds after finishing.

To reboot instead, change:

powershell
Copy
Edit
shutdown /s /t 10
to:

powershell
Copy
Edit
shutdown /r /t 10
⚠️ Disclaimer
This script performs system-level maintenance. Use it at your own risk. Always run it as an administrator and make sure you understand what each step does. This is meant for responsible users looking to keep their system clean and healthy.

```
