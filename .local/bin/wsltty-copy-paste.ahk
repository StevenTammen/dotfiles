#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance Force

^c::
    if(WinActive("ahk_exe mintty.exe")) {
        SendInput % "{RControl Down}{Ins}{RControl Up}"
    }
    else
    {
        SendInput % "{RControl Down}c{RControl Up}"
    }
    return

^v::
    if(WinActive("ahk_exe mintty.exe")) {
        SendInput % "{Shift Down}{Ins}{Shift Up}"
    }
    else
    {
        SendInput % "{RControl Down}v{RControl Up}"
    }
    return
