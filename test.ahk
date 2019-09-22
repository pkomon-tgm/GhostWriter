#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; comment out for "typed" output, leave it for debugging
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include ./lib.ahk

SetKeyDelay, 10, 10
SetTitleMatchMode, 1
SetBatchLines -1

pars := new Parser()
res := pars.Parse("Test.java")

+F12::
	res.generic_astar_stub.SendLines()
	Send, {Enter 2}
	res.astar_est.SendLines()
	Send, {Left 2}{Up 4}{Enter}{Up}
	res.generic_astar_init.SendLines()
	res.generic_astar_loop.SendLines()
	res.generic_astar_backtacking.SendLines()
	Send, {Up 27}{Enter 2}{Up 2}
	res.astar_def.SendLines()
	Send, {Enter}
	res.dijkstra_def.SendLines()
return