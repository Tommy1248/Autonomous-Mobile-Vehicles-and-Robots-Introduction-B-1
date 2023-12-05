Integer test_Tokens
Integer test_Blocks
Double test_TokenHeight
Double test_BlockHeight

Function test
	

    Motor On
    Power High
    Speed 30
    Accel 30, 30
    SpeedS 500
    AccelS 5000
    Tool 1

    test_Tokens = 2
    test_Blocks = 2
    test_TokenHeight = 6.0
    test_BlockHeight = 6.0
    Integer test_TokenID
    Integer test_BlockID
    
    'Off 12
    'Go Retract_Safe
    
    'For test_TokenID = test_Tokens To 0 Step -1
    	'test_Pick_Infeed_Token()
    	'test_Alignment_Token()
    	'test_Place_Tray_Token()

    'Next test_TokenID
    
    For test_BlockID = test_Blocks To 0 Step -1
     	'test_Pick_Infeed_Block()
     	test_Alignment_Block()
     	'test_Place_Tray_Block()

    Next test_BlockID

    Go Retract_Safe
    
Fend

Function test_Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", test_Tokens
    Go XY(19.5, 16, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(19.5, 16, -3, 0, 0, 0) -Z((test_Tokens * test_TokenHeight)) /3 CP
    On 12
	Wait .5
	Go XY(19.5, 16, -3, 0, 0, 0) +X(-3) -Z(80 + (test_Tokens * test_TokenHeight)) /3 CP

Fend
	
Function test_Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", test_Tokens
    Go XY(19, 15, -6.5, 0, 0, 0) -Z(20) /2
	Move XY(19, 15, -6.5, 0, 0, 0) /2
	Off 12
	Move XY(19, 15, -6.5, 0, 0, 0) +X(5) /2
	Move XY(19, 15, -6.5, 0, 0, 0) +X(5) -Z(5) /2 CP
	Go XY(19, 15, -6.5, 0, 0, 0) +X(3) -Z(5) /2
	Move XY(19, 15, -6.5, 0, 0, 0) +X(3) /2
	On 12
	Wait .5
	Move XY(19, 15, -6.5, 0, 0, 0) +X(3) -Z(20) /2

Fend
	
Function test_Place_Tray_Token
	'Tray Token
	Print "Placing Token in Tray. Tray Position ID = ", test_Tokens
	
    If test_Tokens = 2 Then
    	Go XY(12.95, 26.5, -1, 0, 0, 0) +Y(30. * 2) -Z(20) /4 CP
        Move XY(12.95, 26.5, -1, 0, 0, 0) +Y(30. * 2) /4
        Off 12
        Wait .5
        Go XY(12.95, 26.5, -1, 0, 0, 0) +Y(30. * 2) -Z(80) /4 CP

    ElseIf test_Tokens = 1 Then
        Go XY(12.95, 26.5, -1, 0, 0, 0) +X(0.35) +Y(30. * 1 - 0.55) -Z(20) /4 CP
        Move XY(12.95, 26.5, -1, 0, 0, 0) +X(0.35) +Y(30. * 1 - 0.55) /4
        Off 12
        Wait .5
        Go XY(12.95, 26.5, -1, 0, 0, 0) +X(0.35) +Y(30. * 1 - 0.55) -Z(80) /4 CP

    ElseIf test_Tokens = 0 Then
        Go XY(12.95, 26.5, -1, 0, 0, 0) +X(1) +Y(-1.3) -Z(20) /4 CP
        Move XY(12.95, 26.5, -1, 0, 0, 0) +X(1) +Y(-1.3) /4
        Off 12
        Wait .5
        Go XY(12.95, 26.5, -1, 0, 0, 0) +X(1) +Y(-1.3) -Z(80) /4 CP

    EndIf
    test_Tokens = test_Tokens - 1
	
Fend

Function test_Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", test_Blocks
    Go XY(25, 40, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(25, 40, -3, 0, 0, 0) -Z((test_Blocks * test_BlockHeight)) /3 CP
    On 12
	Wait .5
	Go XY(25, 40, -3, 0, 0, 0) +X(-5) -Z(80 + (test_Blocks * test_BlockHeight)) /3 CP

Fend

Function test_Alignment_Block
    'Alignment Block
	Print "Aligning Block. Block ID = ", test_Blocks
    Go XY(25, 40, -3, 0, 0, 0) -Z(20) /2
	Move XY(25, 40, -3, 0, 0, 0) /2
	Off 12
	Move XY(25, 40, -3, 0, 0, 0) +X(5) /2
	Move XY(25, 40, -3, 0, 0, 0) +X(5) +Y(5) -Z(5) /2 CP
	Move XY(25, 40, -3, 0, 0, 0) +X(2) +Y(3) -Z(8) /2
	Go XY(25, 40, -3, 0, 0, 0) +X(2) +Y(-1) -Z(2) /2
	On 12
	Wait .5
	Move XY(25, 40, -3, 0, 0, 0) +X(2) -Z(20) /2
	
Fend

