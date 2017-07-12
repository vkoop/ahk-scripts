#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SysGet, MonitorCount, MonitorCount

SendToScreenFull(Screen)
{
	SysGet, Mon, MonitorWorkArea, %Screen%
	WinGetPos,X,Y,W,H,A
	NewW :=  MonRight - MonLeft
	WinMove,A,,%MonLeft%,%MonTop%,%NewW%,%MonBottom%
}

SendToColum(Column)
{
	SysGet, Mon, MonitorWorkArea
	WinGetPos,X,Y,W,H,A
	NewW :=  (MonRight - MonLeft) / 3
	NewX := 0 + ((Column - 1) * NewW)
	WinMove,A,,%NewX%,%MonTop%,%NewW%,%MonBottom%
}

SendToCenter()
{
	SysGet, Mon, MonitorWorkArea
	WinGetPos,X,Y,W,H,A
	NewW :=  (MonRight - MonLeft) / 2
	NewX := (MonRight - MonLeft) / 4
	WinMove,A,,%NewX%,%MonTop%,%NewW%,%MonBottom%
}

^#c::
	SendToCenter()
return

^!1::
	SendToScreenFull(1)
return

^!2::
	SendToScreenFull(2)
return

^#1::
	SendToColum(1)
return

^#2::
	SendToColum(2)
return

^#3::
	SendToColum(3)
return

^#Left::
	SysGet, Mon, MonitorWorkArea
	WinGetPos,X,Y,W,H,A
	NewW :=  (MonRight - MonLeft) / 2
	WinMove,A,,%MonLeft%,%MonTop%,%NewW%,%MonBottom%
return

^#Right::
	SysGet, Mon, MonitorWorkArea
	WinGetPos,X,Y,W,H,A
	NewW :=  (MonRight - MonLeft) / 2
	NewL := (MonRight - MonLeft) / 2
	WinMove,A,,%NewL%,%MonTop%,%NewW%,%MonBottom%
return

^#Up::
	SysGet, Mon, MonitorWorkArea
	WinGetPos,X,Y,W,H,A
	NewH :=  (MonBottom - MonTop) / 2
	WinMove,A,,%MonLeft%,%MonTop%,%MonRight%,%NewH%
return

^#Down::
	SysGet, Mon, MonitorWorkArea
	WinGetPos,X,Y,W,H,A
	NewH :=  (MonBottom - MonTop) / 2
	NewT := NewH + MonTop
	WinMove,A,,%MonLeft%,%NewT%,%MonRight%,%NewH%
return