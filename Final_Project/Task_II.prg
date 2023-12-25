Integer TaskII_Tokens
Integer TaskII_Blocks
Double TaskII_TokenHeight
Double TaskII_BlockHeight

Function TaskII
	
    Motor On
    Power High
    Speed 100
    Accel 100, 100
    SpeedS 800
    AccelS 8000
    Tool 1

    TaskII_Tokens = 5
    TaskII_Blocks = 5
    TaskII_TokenHeight = 6.0
    TaskII_BlockHeight = 6.0
    Integer TaskII_TokenID
    Integer TaskII_BlockID
    
    Off 12
    Go Retract_Safe
    
    For TaskII_BlockID = TaskII_Blocks To 0 Step -1
     	TaskII_Pick_Infeed_Block()
     	TaskII_put_Block()
     	TaskII_Pick_Infeed_Token()
    	TaskII_put_Token()

    Next TaskII_BlockID

    Go Retract_Safe
    
Fend

Function TaskII_Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", TaskII_Blocks
    Go XY(19, 41, -5, 0, 0, 0) -Z(80) /3 CP
    Move XY(19, 41, -5, 0, 0, 0) -Z((TaskII_Blocks * TaskII_BlockHeight)) /3 CP
    On 12
	Wait .5
	Go XY(19, 41, -5, 0, 0, 0) +X(-10) -Z(80 + (TaskII_Blocks * TaskII_BlockHeight)) /3 CP

Fend

Function TaskII_put_Block
    'Put Block
	Print "Put Block. Block ID = ", TaskII_Blocks
    
    If TaskII_Blocks = 5 Then
	    Go XY(20.5, 39, -6, 0, 0, 0) -Z(20) /2
        Move XY(20.5, 39, -6, 0, 0, 0) /2
	    'Move XY(20.5, 39, -6, 0, 0, 0) +X(6.5) /2
	    'Move XY(20.5, 39, -6, 0, 0, 0) +X(6.5) +Y(7.5) /2
	    Off 12
	    Wait .25
	    'Move XY(20.5, 39, -6, 0, 0, 0) +X(6.5) +Y(7.5) -Z(8) /2 CP
	    Move XY(20.5, 39, -6, 0, 0, 0) -Z(8) /2 CP
	    
    ElseIf TaskII_Blocks <> 5 Then
        Go XY(20.5, 39, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(6 + (5 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2
	    Off 12
	    Wait .25
	    Move XY(20.5, 39, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(21 + (5 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2 CP
    EndIf
	TaskII_Blocks = TaskII_Blocks - 1
	
Fend

Function TaskII_Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", TaskII_Tokens
    Go XY(16.5, 15, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(16.5, 15, -3, 0, 0, 0) -Z(1 + (TaskII_Tokens * TaskII_TokenHeight)) /3 CP
    On 12
	Wait .25
	Go XY(16.5, 15, -3, 0, 0, 0) +X(-3) -Z(80 + (TaskII_Tokens * TaskII_TokenHeight)) /3 CP

Fend
	
Function TaskII_put_Token
	'Put Token
	Print "Put Token. Token ID = ", TaskII_Tokens
    Go XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(9 + (4 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2
	Off 12
	Wait .25
	Move XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(30 + (4 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2 CP
	TaskII_Tokens = TaskII_Tokens - 1

Fend


