;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PREMIERE START
; Numeric control drag hack/fix for Premiere using AutoHotKey. Works by manipulating windows pointer speed (SPI_SETMOUSESPEED) during dragging with Left Mouse Button. Resets to default 6 ticks when not. 

#IfWinExist ahk_exe Adobe Premiere Pro.exe

~LButton::
If WinActive("ahk_exe Adobe Premiere Pro.exe")
	DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 11, UInt, 0) ; Slightly Faster then Windows default
Return

~LButton Up::
DllCall("SystemParametersInfo", UInt, 0x70, UInt, 0, UInt, MOUSE_NOW, UInt, 0)
If MOUSE_NOW != 10 ; Check if the speed is not default, adjust this as needed.
	DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 10, UInt, 0) ; Default Windows 6 Ticks [10], adjust this as needed. 
Return

#IfWinExist

; PREMIERE END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;