Integer TaskI_Tokens
Integer TaskI_Blocks
Double TaskI_TokenHeight
Double TaskI_BlockHeight
Double TaskI_Tray_interval

Function TaskI
	
    Motor On
    Power High
    Speed 100
    Accel 100, 100
    SpeedS 500
    AccelS 5000
    Tool 1

    TaskI_Tokens = 2
    TaskI_Blocks = 2
    TaskI_TokenHeight = 6.0
    TaskI_BlockHeight = 6.0
    TaskI_Tray_interval = 30.0
    Integer TaskI_TokenID
    Integer TaskI_BlockID
    
    Off 12
    Go Retract_Safe
    
    For TaskI_TokenID = TaskI_Tokens To 0 Step -1
    	TaskI_Pick_Infeed_Token()
    	TaskI_Alignment_Token()
    	TaskI_Place_Tray_Token()

    Next TaskI_TokenID
    
    For TaskI_BlockID = TaskI_Blocks To 0 Step -1
     	TaskI_Pick_Infeed_Block()
     	TaskI_Alignment_Block()
     	TaskI_Place_Tray_Block()

    Next TaskI_BlockID

    Go Retract_Safe
    
Fend

Function TaskI_Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", TaskI_Tokens
    Go XY(16, 16, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(16, 16, -3, 0, 0, 0) -Z((TaskI_Tokens * TaskI_TokenHeight)) /3 CP
    On 12
	Wait .25
	Go XY(16, 16, -3, 0, 0, 0) +X(-10) -Z(80 + (TaskI_Tokens * TaskI_TokenHeight)) /3 CP

Fend
	
Function TaskI_Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", TaskI_Tokens
    Go XY(19, 15, -6.3, 0, 0, 0) -Z(20) /2
	Go XY(19, 15, -6.3, 0, 0, 0) /2
	Move XY(19, 15, -6.3, 0, 0, 0) +X(5) /2
	Off 12
	Wait .25
	Move XY(19, 15, -6.3, 0, 0, 0) +Y(-1) +X(5) -Z(5) /2 CP
	Go XY(19, 15, -6.3, 0, 0, 0) +Y(-1) +X(1.5) -Z(5) /2
	Move XY(19, 15, -6.3, 0, 0, 0) +Y(-1) +X(1.5) +Z(1) /2
	On 12
	Wait .25
	Move XY(19, 15, -6.3, 0, 0, 0) +Y(-1) +X(1.5) -Z(20) /2

Fend
	
Function TaskI_Place_Tray_Token
	'Tray Token
	Print "Placing Token in Tray. Tray Position ID = ", TaskI_Tokens
	
    If TaskI_Tokens = 2 Then
    	Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskI_Tray_interval * TaskI_Tokens) -Z(20) /4 CP
        Move XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskI_Tray_interval * TaskI_Tokens) /4
        Off 12
        Wait .5
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskI_Tray_interval * TaskI_Tokens) -Z(80) /4 CP

    ElseIf TaskI_Tokens = 1 Then
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.25) +Y(TaskI_Tray_interval * TaskI_Tokens - 1.55) -Z(20) /4 CP
        Move XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.25) +Y(TaskI_Tray_interval * TaskI_Tokens - 1.55) /4
        Off 12
        Wait .5
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.25) +Y(TaskI_Tray_interval * TaskI_Tokens - 1.55) -Z(80) /4 CP

    ElseIf TaskI_Tokens = 0 Then
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) -Z(20) /4 CP
        Move XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) /4
        Off 12
        Wait .5
        Go XY(11.95, 26.5, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) -Z(80) /4 CP

    EndIf
    TaskI_Tokens = TaskI_Tokens - 1
	
Fend

Function TaskI_Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", TaskI_Blocks
    Go XY(19, 42, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(19, 42, -3, 0, 0, 0) -Z(1 + (TaskI_Blocks * TaskI_BlockHeight)) /3 CP
    On 12
	Wait .5
	Go XY(19, 42, -3, 0, 0, 0) +X(-10) -Z(80 + (TaskI_Blocks * TaskI_BlockHeight)) /3 CP

Fend

Function TaskI_Alignment_Block
    'Alignment Block
	Print "Aligning Block. Block ID = ", TaskI_Blocks
    Go XY(21, 40, -5.7, 0, 0, 0) -Z(20) /2
	Move XY(21, 40, -5.7, 0, 0, 0) /2
	Move XY(21, 40, -5.7, 0, 0, 0) +X(6.5) /2 CP
	Move XY(21, 40, -5.7, 0, 0, 0) +X(6.5) +Y(7.5) /2 CP
	Off 12
	Wait .25
    Move XY(21, 40, -3.7, 0, 0, 0) +X(6.5) +Y(7.5) -Z(8) /2 CP
	Move XY(21, 40, -3.7, 0, 0, 0) +X(2.5) +Y(1.5) -Z(8) /2 CP
	Go XY(21, 40, -3.7, 0, 0, 0) +X(2.5) +Y(1.5) -Z(2) /2
	On 12
	Wait .5
	Move XY(21, 40, -5.7, 0, 0, 0) +X(0) -Z(20) /2
	
Fend
Function TaskI_Place_Tray_Block
	'Tray Token
	Print "Placing Block in Tray. Tray Position ID = ", TaskI_Blocks
	
    If TaskI_Blocks = 2 Then
    	Go XY(27.95, 26.5, -1, 91, 0, 0) +X(11.7) +Y(-1 + TaskI_Tray_interval * TaskI_Blocks) -Z(20) /4 CP
        Move XY(27.95, 26.5, -1, 91, 0, 0) +X(11.7) +Y(-1 + TaskI_Tray_interval * TaskI_Blocks) /4
        Off 12
        Wait .5
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(11.7) +Y(-1 + TaskI_Tray_interval * TaskI_Blocks) -Z(80) /4 CP

    ElseIf TaskI_Blocks = 1 Then
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskI_Tray_interval * TaskI_Blocks) -Z(20) /4 CP
        Move XY(27.95, 26.5, -1, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskI_Tray_interval * TaskI_Blocks) /4
        Off 12
        Wait .5
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskI_Tray_interval * TaskI_Blocks) -Z(80) /4 CP

    ElseIf TaskI_Blocks = 0 Then
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.5) +Y(-2) -Z(20) /4 CP
        Move XY(27.95, 26.5, -1, 91, 0, 0) +X(12.5) +Y(-2) /4
        Off 12
        Wait .5
        Go XY(27.95, 26.5, -1, 91, 0, 0) +X(12.5) +Y(-2) -Z(80) /4 CP

    EndIf
    TaskI_Blocks = TaskI_Blocks - 1
	
Fend
