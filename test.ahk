#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include ./lib.ahk

SetKeyDelay, 10, 10
SetTitleMatchMode, 1
SetBatchLines -1

pars := new Parser()
res := pars.Parse("Test.java")

+F12::
	res.main1.SendLines()
	res.main2.SendLines()
	res.main3.SendLines()
return