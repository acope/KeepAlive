#Keeps the computer from falling asleep
#Open notepad and writes a "." at specified interval and run at until specified time runs out

Start-Process 'C:\windows\system32\notepad.exe' #opens notepad

param($minutes = 240) #Number of minutes to keep the system alive
$keypressDelay = 240 #keypress delay in seconds
..
$myshell = New-Object -com "Wscript.Shell"

for ($i = 0; $i -lt $minutes; $i++) {
  Start-Sleep -Seconds $keypressDelay
  $myshell.sendkeys(".")
}