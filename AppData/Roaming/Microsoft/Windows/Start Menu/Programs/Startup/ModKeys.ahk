#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay, 100, 100

;This is fix for a bug in the logic below where sometimes the up event doesnt happen
SendInput, {LWin Up}{LCtrl Up}{LShift Up}{RSHIFT Up}

$RControl::
    ; Set a variable to indicate that the key is being held down
    RCtrlHeld := True

    ; Loop until the key is released
    while (RCtrlHeld)
    {
        ; Check whether the Right Control key is still being held down
        if (GetKeyState("RControl", "P"))
        {
            ; Send the Left Win key, Left Ctrl key, and Left Shift key
            SendInput, {LWin Down}{LCtrl Down}{LShift Down}

            ; Wait for a short delay to ensure the key press is registered
            Sleep, 10
        }
        else
        {
            ; Release the Left Win key, Left Ctrl key, and Left Shift key
            SendInput, {LWin Up}{LCtrl Up}{LShift Up}

            ; Clear the variable to indicate that the key is no longer being held down
            RCtrlHeld := False
        }
    }
return


/*
$LControl::
    ; Set a variable to indicate that the key is being held down
    LCtrlHeld := True

    ; Loop until the key is released
    while (LCtrlHeld)
    {
        ; Check whether the Right Control key is still being held down
        if (GetKeyState("LControl", "P"))
        {
            ; Send the Left Ctrl key
            SendInput, {LCtrl Down}

            ; Wait for a short delay to ensure the key press is registered
            Sleep, 10
        }
        else
        {
            ; Release the Left Win key, Left Ctrl key, and Left Shift key
            SendInput, {LCtrl Up}

            ; Clear the variable to indicate that the key is no longer being held down
            LCtrlHeld := False
        }
    }
return
*/


$RSHIFT::
    ;Sleep, 100
    ; Set a variable to indicate that the key is being held down
    RSHIFTHeld := True

    ; Loop until the key is released
    while (RSHIFTHeld)
    {
        ; Check whether the Right Control key is still being held down
        if (GetKeyState("RSHIFT", "P"))
        {
            ; Send the Left Ctrl keys
            SendInput, {LWin Down}{RSHIFT Down}

            ; Wait for a short delay to ensure the key press is registered
            ;Sleep, 5
        }
        else
        {
            ; Release the Left Win key, Left Ctrl key, and Left Shift key
            SendInput, {LWin Up}{RSHIFT Up}

            ; Clear the variable to indicate that the key is no longer being held down
            RSHIFTHeld := False
        }
    }
return

;Weirdness fix for power run
$F1::
     ; Send the Left Ctrl keys
     SendInput, {RALT Down}{Space Down}
     ; Release the Left Win key, Left Ctrl key, and Left Shift key
     SendInput, {RALT Up}{Space Up}
return