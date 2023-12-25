Integer TaskIII_I_Tokens
Integer TaskIII_I_Blocks
Double TaskIII_I_TokenHeight
Double TaskIII_I_BlockHeight
Double TaskIII_I_Tray_interval

Function TaskIII_I
	
    Motor On
    Power High
    Speed 100
    Accel 100, 100
    SpeedS 500
    AccelS 5000
    Tool 1

    TaskIII_I_Tokens = 2
    TaskIII_I_Blocks = 2
    TaskIII_I_TokenHeight = 6.0
    TaskIII_I_BlockHeight = 6.0
    TaskIII_I_Tray_interval = 30.0
    Integer TaskIII_I_TokenID
    Integer TaskIII_I_BlockID
    
    Off 12
    Go Retract_Safe
    
    For TaskIII_I_TokenID = TaskIII_I_Tokens To 0 Step -1
    	TaskIII_I_Pick_Infeed_Token()
    	TaskIII_I_Alignment_Token()
    	TaskIII_I_Place_Tray_Token()

    Next TaskIII_I_TokenID
    
    For TaskIII_I_BlockID = TaskIII_I_Blocks To 0 Step -1
     	TaskIII_I_Pick_Infeed_Block()
     	TaskIII_I_Alignment_Block()
     	TaskIII_I_Place_Tray_Block()

    Next TaskIII_I_BlockID

    Go Retract_Safe
    
Fend

Function TaskIII_I_Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", TaskIII_I_Tokens
    Go XY(16, 16, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(16, 16, -3, 0, 0, 0) -Z((TaskIII_I_Tokens * TaskIII_I_TokenHeight)) /3 CP
    On 12
	Wait .25
	Go XY(16, 16, -3, 0, 0, 0) +X(-10) -Z(80 + (TaskIII_I_Tokens * TaskIII_I_TokenHeight)) /3 CP

Fend
	
Function TaskIII_I_Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", TaskIII_I_Tokens
    Go XY(19, 15, -7, 0, 0, 0) -Z(20) /2
    Move XY(19, 15, -7, 0, 0, 0) /2
	Off 12
	Wait .25
	Go XY(19, 15, -7, 0, 0, 0) +Y(-1) +X(1.5) -Z(5) /2
    On 13
    Wait .25
    Off 13
    Go XY(19, 15, -7, 0, 0, 0) +Y(-1) +X(1.5) +Z(1) /2
    Wait .25
	On 12
	Wait .25
	Move XY(19, 15, -7, 0, 0, 0) +Y(-1) +X(1.5) -Z(20) /2

Fend
	
Function TaskIII_I_Place_Tray_Token
	'Tray Token
	Print "Placing Token in Tray. Tray Position ID = ", TaskIII_I_Tokens
	
    If TaskIII_I_Tokens = 2 Then
    	Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskIII_I_Tray_interval * TaskIII_I_Tokens) -Z(20) /4 CP
        Move XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskIII_I_Tray_interval * TaskIII_I_Tokens) /4
        Off 12
        Wait .5
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskIII_I_Tray_interval * TaskIII_I_Tokens) -Z(80) /4 CP

    ElseIf TaskIII_I_Tokens = 1 Then
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.25) +Y(TaskIII_I_Tray_interval * TaskIII_I_Tokens - 1.55) -Z(20) /4 CP
        Move XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.25) +Y(TaskIII_I_Tray_interval * TaskIII_I_Tokens - 1.55) /4
        Off 12
        Wait .5
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.25) +Y(TaskIII_I_Tray_interval * TaskIII_I_Tokens - 1.55) -Z(80) /4 CP

    ElseIf TaskIII_I_Tokens = 0 Then
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) -Z(20) /4 CP
        Move XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) /4
        Off 12
        Wait .5
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) -Z(80) /4 CP

    EndIf
    TaskIII_I_Tokens = TaskIII_I_Tokens - 1
	
Fend

Function TaskIII_I_Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", TaskIII_I_Blocks
    Go XY(19, 42, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(19, 42, -3, 0, 0, 0) -Z(1 + (TaskIII_I_Blocks * TaskIII_I_BlockHeight)) /3 CP
    On 12
	Wait .5
	Go XY(19, 42, -3, 0, 0, 0) +X(-10) -Z(80 + (TaskIII_I_Blocks * TaskIII_I_BlockHeight)) /3 CP

Fend

Function TaskIII_I_Alignment_Block
    'Alignment Block
	Print "Aligning Block. Block ID = ", TaskIII_I_Blocks
    Go XY(21, 40, -6, 0, 0, 0) -Z(20) /2
	Move XY(21, 40, -6, 0, 0, 0) /2
	Off 12
	Wait .25
	Go XY(21, 40, -3.7, 0, 0, 0) +X(2.5) +Y(1.5) -Z(8) /2
	On 13
    Wait .25
    Off 13
    Go XY(21, 40, -3.7, 0, 0, 0) +X(2.5) +Y(1.5) -Z(2) /2
    Wait .25
	On 12
	Wait .25
	Move XY(21, 40, -6, 0, 0, 0) +X(0) -Z(20) /2
	
Fend
Function TaskIII_I_Place_Tray_Block
	'Tray Token
	Print "Placing Block in Tray. Tray Position ID = ", TaskIII_I_Blocks
	
    If TaskIII_I_Blocks = 2 Then
    	Go XY(27.5, 26.5, -1, 91, 0, 0) +X(11.7) +Y(-1 + TaskIII_I_Tray_interval * TaskIII_I_Blocks) -Z(20) /4 CP
        Move XY(27.5, 26.5, -1, 91, 0, 0) +X(11.7) +Y(-1 + TaskIII_I_Tray_interval * TaskIII_I_Blocks) /4
        Off 12
        Wait .5
        Go XY(27.5, 26.5, -1, 91, 0, 0) +X(11.7) +Y(-1 + TaskIII_I_Tray_interval * TaskIII_I_Blocks) -Z(80) /4 CP

    ElseIf TaskIII_I_Blocks = 1 Then
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskIII_I_Tray_interval * TaskIII_I_Blocks) -Z(20) /4 CP
        Move XY(27.95, 26.5, -1, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskIII_I_Tray_interval * TaskIII_I_Blocks) /4
        Off 12
        Wait .5
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskIII_I_Tray_interval * TaskIII_I_Blocks) -Z(80) /4 CP

    ElseIf TaskIII_I_Blocks = 0 Then
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.5) +Y(-2) -Z(20) /4 CP
        Move XY(27.95, 26.5, -1, 91, 0, 0) +X(12.5) +Y(-2) /4
        Off 12
        Wait .5
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.5) +Y(-2) -Z(80) /4 CP

    EndIf
    TaskIII_I_Blocks = TaskIII_I_Blocks - 1
	
Fend
