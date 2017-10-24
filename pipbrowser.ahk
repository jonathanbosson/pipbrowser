; -------- User ONLY change these parameters --------
path := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
resolution := {"w": 2560, "h": 1440}
defaultWindow := {"x": 1792, "y": 0, "w": 768, "h": 432}
defaultPos := "TopRight"
commonPages := ["https://www.google.com", "https://gw2efficiency.com/"] 
; ---------------------------------

currWin := {"x": 0, "y": 0, "w": 0, "h": 0}
For i, v in defaultWindow
	currWin[i] := v
origin := ["TopLeft", "TopCenter", "TopRight", "CenterLeft", "CenterRight", "BottomLeft", "BottomCenter", "BottomRight"]

; help
^!h::
MsgBox ,, How to use the script, 
(LTrim
	Open copied URL: `t ctrl+alt+f
	Go to URL: `t ctrl+alt+g
	Toggle PiP mode: `t ctrl+alt+z
	Reset window: `t ctrl+alt+r
	Bigger window: `t ctrl+alt+l
	Smaller window: `t ctrl+alt+k
),
Return

; Go to URL
^!g::
InputBox, newUrl, Go to URL,,, 400, 100
if !ErrorLevel {
	WinClose, ahk_id %wid%
	wid := openBrowser(path, newUrl, currWin)
}
Return

; Open copied URL
^!f::
;Send, {ctrl down}v{ctrl up}
clip := Clipboard
wid := openBrowser(path, clip, currWin)
Return

; PiP mode
^!z::
WinSet, AlwaysOntop, Toggle, ahk_id %wid% ; change A to if Win active
WinSet, Style, ^0xC00000, ahk_id %wid%
WinSet, Style, ^0x40000, ahk_id %wid%
Return

; Reset window size/location
^!r::
currWin["w"] := defaultWindow["w"]
currWin["h"] := defaultWindow["h"]
currWin["x"] := defaultWindow["x"]
moveWindow(wid, currWin)
Return

; Bigger
^!l::
currWin["w"] := Ceil(currWin["w"]*1.1)
currWin["h"] := Ceil(currWin["h"]*1.1)
currWin["x"] := resolution["w"] - currWin["w"]
moveWindow(wid, currWin)
Return

; Smaller
^!k::
currWin["w"] := Ceil(currWin["w"]*0.9)
currWin["h"] := Ceil(currWin["h"]*0.9)
currWin["x"] := resolution["w"] - currWin["w"]
moveWindow(wid, currWin)
Return



; Functions
openBrowser(path, s, window)
{
	address := parseString(s)
	Run, %path% --app="%address%"
	return windowSetup(window)
}

parseString(s) 
{
	if InStr(s, ".") != 0 { ; clipboard okay
		if InStr(s, "://") != 0 {
			reply := s
		}
		else {
			reply := "https://" s
		}
	}
	else if (StrLen(s) == 11) { ; emped youtube video
		reply := "https://www.youtube.com/embed/" s
	}
	else { ; default address
		reply := "https://www.google.com"
	}
	Return reply
}

windowSetup(window)
{
	WinGetClass, c, A
	if (c == "Chrome_WidgetWin_1") {
		Sleep, 500
	}
	While (c != "Chrome_WidgetWin_1") 
	{
		Sleep 10
		WinGetClass, c, A
	}
	WinGet, active_id, ID, A
	moveWindow(active_id, window)
	WinSet, AlwaysOntop, Toggle, ahk_id %active_id%
	WinSet, Style, ^0xC00000, ahk_id %active_id%
	WinSet, Style, ^0x40000, ahk_id %active_id%
	return active_id
}

moveWindow(wid, window)
{
	WinMove, ahk_id %wid%,, window["x"], window["y"], window["w"], window["h"]
}