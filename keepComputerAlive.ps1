#Keeps the computer from falling asleep
#Open notepad and writes a "." at specified interval and run at until specified time runs out
param($minutes = 240, $keywait = 240) #Number of minutes to keep the system alive and key wait time in seconds

Start-Process 'C:\windows\system32\notepad.exe' #opens notepad

$myshell = New-Object -com "Wscript.Shell"

for ($i = 0; $i -lt $minutes; $i++) {
  Start-Sleep -Seconds $keywait
  $myshell.sendkeys(".")
}
