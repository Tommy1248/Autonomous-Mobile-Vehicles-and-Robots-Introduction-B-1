Integer TaskIO_Blocks
Integer TaskIO_Tokens
Integer TaskIO_Blocks_number
Integer TaskIO_Tokens_number

Double TaskIO_TokenHeight
Double TaskIO_BlockHeight



Function I_O
    Motor On
    Power High
    Speed 100
    Accel 100, 100
    SpeedS 800
    AccelS 8000
    Tool 1
    
    TaskIO_Blocks = 5
    TaskIO_BlockHeight = 6.0
    TaskIO_Tokens = 5
    TaskIO_TokenHeight = 6.0
    Integer TaskIO_TokenID
    Integer TaskIO_BlockID
    
    
    Do
        If Sw(3) = 1 Then
            
            Off 12
            Go Retract_Safe
            TaskIO_Pick_Infeed_Token_Number()
            Go Retract_Safe
        EndIf
        
        If Sw(4) = 1 Then
            
            Off 12
            Go Retract_Safe
            TaskIO_Pick_Infeed_Block_Number()
            Go Retract_Safe
        EndIf
        
        If Sw(0) = 1 Then
        	TaskIO_Blocks_number = TaskIO_Blocks
        	TaskIO_Tokens_number = TaskIO_Tokens
        	Print("Blocks")
            Print (TaskIO_Blocks + 1)
            Print("Tokens")
            Print (TaskIO_Tokens + 1)
        EndIf
        
        If Sw(1) = 1 Then
        	For TaskIO_BlockID = TaskIO_Blocks To 0 Step -1
     	    TaskIO_Pick_Infeed_Block()
     	    TaskIO_put_Block()
     	    Next TaskIO_BlockID
        	
     	    For TaskIO_TokenID = TaskIO_Tokens To 0 Step -1
     	    TaskIO_Pick_Infeed_Token()
    	    TaskIO_put_Token()
    	    Next TaskIO_TokenID
     	    Go Retract_Safe
        EndIf
        
        If Sw(2) = 1 Then
        	Power High
        	Print("Power HIGH")
        Else
        	Power Low
        	Print("Power Low")
        EndIf
        
        Wait 2
    Loop
Fend

Function TaskIO_Pick_Infeed_Block_Number
    'Pick Block from Infeed
    Print "Picking Block from Infeed. Block ID = ", TaskIO_Blocks
    Go XY(19, 41, -5, 0, 0, 0) -Z(80) /3 CP
    Move XY(19, 41, -5, 0, 0, 0) -Z((TaskIO_Blocks * TaskIO_BlockHeight)) /3 CP
    On 12
    Wait .5
    Do While Sw(16) = 1
        TaskIO_Blocks = TaskIO_Blocks - 1
        Move XY(19, 41, -5, 0, 0, 0) -Z((TaskIO_Blocks * TaskIO_BlockHeight)) /3 CP
        Print (TaskIO_Blocks)
        Wait .5
    Loop
	On 14
    Off 12
    Wait .5
    Off 14
Fend

Function TaskIO_Pick_Infeed_Token_Number
    'Pick Token from Infeed
    Print "Picking Token from Infeed. Token ID = ", TaskIO_Tokens
    Go XY(16.5, 15, -3.5, 0, 0, 0) -Z(80) /3 CP
    Move XY(16.5, 15, -3.5, 0, 0, 0) -Z(1 + (TaskIO_Tokens * TaskIO_TokenHeight)) /3 CP
    On 12
    Wait .25
    Do While Sw(16) = 1
    	
        TaskIO_Tokens = TaskIO_Tokens - 1
        Move XY(16.5, 15, -3.5, 0, 0, 0) -Z(1 + (TaskIO_Tokens * TaskIO_TokenHeight)) /3 CP
        Print (TaskIO_Tokens)
        Wait .5
    Loop
    On 14
    Off 12
    Wait .5
    Off 14
    
Fend

Function TaskIO_Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", TaskIO_Blocks
    Go XY(19, 41, -5, 0, 0, 0) -Z(80) /3 CP
    Move XY(19, 41, -5, 0, 0, 0) -Z((TaskIO_Blocks * TaskIO_BlockHeight)) /3 CP
    On 12
	Wait .5
	Go XY(19, 41, -5, 0, 0, 0) +X(-10) -Z(80 + (TaskIO_Blocks * TaskIO_BlockHeight)) /3 CP

Fend

Function TaskIO_put_Block
    'Put Block
	Print "Put Block. Block ID = ", TaskIO_Blocks
    
        Go XY(20.5, 38, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(7 + (TaskIO_Blocks_number - TaskIO_Blocks) * TaskIO_BlockHeight) /2
	    Wait .25
	    Off 12
	    Wait .25
	    Move XY(20.5, 38, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(21 + (TaskIO_Blocks_number - TaskIO_Blocks) * TaskIO_BlockHeight) /2 CP

	TaskIO_Blocks = TaskIO_Blocks - 1
	
Fend

Function TaskIO_Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", TaskIO_Tokens
    Go XY(16.5, 15, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(16.5, 15, -3, 0, 0, 0) -Z(1 + (TaskIO_Tokens * TaskIO_TokenHeight)) /3 CP
    On 12
	Wait .25
	Go XY(16.5, 15, -3, 0, 0, 0) +X(-3) -Z(80 + (TaskIO_Tokens * TaskIO_TokenHeight)) /3 CP

Fend
	
Function TaskIO_put_Token
	'Put Token
	Print "Put Token. Token ID = ", TaskIO_Tokens
    Go XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(9 + (TaskIO_Blocks_number - TaskIO_Blocks) * TaskIO_BlockHeight + (TaskIO_Tokens_number - TaskIO_Tokens) * TaskIO_TokenHeight) /2
	Wait .25
	Off 12
	Wait .25
	Move XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(30 + (TaskIO_Blocks_number - TaskIO_Blocks) * TaskIO_BlockHeight + (TaskIO_Tokens_number - TaskIO_Tokens) * TaskIO_TokenHeight) /2 CP
	TaskIO_Tokens = TaskIO_Tokens - 1

Fend


