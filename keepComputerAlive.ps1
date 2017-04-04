#Keeps the computer from falling asleep
#Open notepad and writes a "." at specified interval and run at until specified time runs out

param($minutes = 60) #Number of minutes to keep the system alive, default is 60 minutes

#$notepad = Start-Process 'C:\windows\system32\notepad.exe' -passthru #opens notepad
$notepad = Start-Process notepad -PassThru #opens notepad
$myshell = New-Object -com "Wscript.Shell"
$timer = 60 * $minutes

#Continue pressing the keypad while Notepad is still open or the timer has not run out.
while(-not $notepad.HasExited -and ($timer -ge 0)){
        Start-Sleep -Seconds 1 
        Write-Host Seconds Remaining: $timer
        $timer--
        #Before keypress check to make sure Notepad has not been closed
        if(-not $notepad.HasExited){
            $myshell.sendkeys(".")
        }
}

#User input is required to close console
$date = Get-Date -Format g
if($notepad.HasExited){
    Stop-Process $notepad
    Write-Host "Script has been terminated early. Script terminated on  " $date
    Read-Host "Press ENTER key to exit..."
    exit
}else{
    Write-Host "Timer has expired on " $date
    Read-Host "Press ENTER key to exit..."
    exit
}
