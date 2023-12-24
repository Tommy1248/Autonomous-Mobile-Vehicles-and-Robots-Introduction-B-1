# Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1

# 成員
M11203607 曾韋智
<br>
M11251003 黃楷棠
<br>
M11251004 賴威霖




# Task Video
## Task 1
https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/fad4392b-9ca2-4cf3-87cf-afa4ea379163
### Task 1 simulation
https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/1dc7eb08-7911-4bb6-b61f-a34f76f6f7af

<details>
<summary>Task 1的程式碼</summary>


  
```
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

```


</details>

## Task 2
https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/d203ac06-f770-49d9-8443-e2eb3a38e1d1
### Task 2 simulation
https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/bb0e7e85-1007-42db-a273-bac60f3c2290
<details>
<summary>Task 2的程式碼</summary>
  
```
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
	    Go XY(21, 40, -6, 0, 0, 0) -Z(20) /2
        Move XY(21, 40, -6, 0, 0, 0) /2
	    Move XY(21, 40, -6, 0, 0, 0) +X(6.5) /2
	    Move XY(21, 40, -6, 0, 0, 0) +X(6.5) +Y(7.5) /2
	    Off 12
	    Wait .25
	    Move XY(21, 40, -6, 0, 0, 0) +X(6.5) +Y(7.5) -Z(8) /2 CP
	    
    ElseIf TaskII_Blocks <> 5 Then
        Go XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(5 + (5 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2
	    Off 12
	    Wait .25
	    Move XY(25, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(20 + (5 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2 CP
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
    Go XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(8 + (4 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2
	Off 12
	Wait .25
	Move XY(21, 40, -6.5, 0, 0, 0) +X(2.5) +Y(1.5) -Z(30 + (4 - TaskII_Blocks) * TaskII_BlockHeight + (5 - TaskII_Tokens) * TaskII_TokenHeight) /2 CP
	TaskII_Tokens = TaskII_Tokens - 1

Fend

```


</details>


## Task 3


https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/f4a38ee4-328a-44f9-8462-a387a614ed56


https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/b9655d3d-4cb6-4e30-a914-e9cda3e440ee



### Task 3 simulation


<details>
<summary>Task 3.1的程式碼</summary>

</details>

<details>
<summary>Task 3.2的程式碼</summary>

</details>

<details>
<summary>Task 3.3的程式碼</summary>

</details>

### CAD
<div align = center>
<img src ="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/%E8%A3%BD%E5%85%B7/CAD.jpg">
</div>

<div align = center>
<img src ="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/%E8%A3%BD%E5%85%B7/gripper.jpg">
</div>

<div align = center>
<img src ="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/%E8%A3%BD%E5%85%B7/platform.jpg">
</div>
