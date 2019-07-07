Const $KEY_UP = 'w'
Const $KEY_DOWN = 's'
Const $KEY_LEFT = 'a'
Const $KEY_RIGHT = 'd'

Const $DIR_UP = -35
Const $DIR_DOWN = 35
Const $DIR_LEFT = -35
Const $DIR_RIGHT = 35

Global $hWnd

_Main()

Func _Main()
	_Init()
	_Run()
EndFunc

Func _Init()
	AutoItSetOption('MouseCoordMode', 2)
	HotKeySet('{END}', '_Exit')

	Display_Attach('Old School RuneScape')
EndFunc

Func _Run()
	HotKeySet($KEY_UP, 'Walk_Up')
	HotKeySet($KEY_DOWN, 'Walk_Down')
	HotKeySet($KEY_LEFT, 'Walk_Left')
	HotKeySet($KEY_RIGHT, 'Walk_Right')

	While True
		Sleep(5000)
	WEnd
EndFunc

Func Walk_Up()
	Walk(Default, $DIR_UP)
EndFunc

Func Walk_Down()
	Walk(Default, $DIR_DOWN)
EndFunc

Func Walk_Left()
	Walk($DIR_LEFT, Default)
EndFunc

Func Walk_Right()
	Walk($DIR_RIGHT, Default)
EndFunc

Func Walk($dirX = Default, $dirY = Default)
	If $dirX = Default Then $dirX = 0
	If $dirY = Default Then $dirY = 0

	Local $aPos = WinGetPos($hWnd)

	MouseMove($aPos[2] / 2  - 169 + $dirX, $aPos[3] / 2 - 270 + $dirY, 0)
EndFunc

Func Display_Attach($title)
	$hWnd = WinWait($title, '', 10)

	WinActivate($hWnd)

	If Not WinWaitActive($hWnd, '', 10) Then
		MsgBox(0, 'ERROR', 'Unable to activate window')

		_Exit()
	EndIf
EndFunc

Func _Exit()
	Exit
EndFunc
