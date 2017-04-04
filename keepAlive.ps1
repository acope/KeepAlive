#Prevents the computer from falling asleep
#Opens a notepad and writes a "." every second and runs until specified time runs out or notepad has been closed

$notepad = Start-Process notepad -PassThru -WindowStyle Normal #opens notepad
$myshell = New-Object -com "Wscript.Shell"

#User inputs amount of minutes they want to go for
#validates user input 0-9
do{
    $input = -1 #inital parameter, input is false(-1)
    $minutes = Read-Host "Please enter number of minutes to stay awake"

    #Check to see if input is correct
    if($minutes -notmatch "[0-9]"){
        Write-Host ""
        Write-Host "Warning: Only use number 0 through 9"
        Write-Host ""
        $input = -1
    }else{
        $input = 1
        $timer = 60 * $minutes #convert seconds to minutes
    }
}while($input -ne 1)

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
