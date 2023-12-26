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

https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/92566662/8ecfd889-32bf-4975-a11d-9e533ae255db



https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/141569321/b9655d3d-4cb6-4e30-a914-e9cda3e440ee

https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/92566662/129f9df8-2e65-4379-be54-fdc1a9cc93e4



https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/92566662/929f3d45-4cb1-4367-95f2-f719a8c15459



### Task 3 simulation

<details>
<summary>Task 3.1的程式碼</summary>
  
```
	
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

```

</details>


<details>
<summary>Task 3.2的程式碼</summary>
  
```
Integer TaskIII_II_Tokens
Integer TaskIII_II_Blocks
Double TaskIII_II_TokenHeight
Double TaskIII_II_BlockHeight
Double TaskIII_II_Tray_interval

Function TaskIII_II
	
    Motor On
    Power High
    Speed 100
    Accel 100, 100
    SpeedS 500
    AccelS 5000
    Tool 1

    TaskIII_II_Tokens = 2
    TaskIII_II_Blocks = 2
    TaskIII_II_TokenHeight = 6.0
    TaskIII_II_BlockHeight = 6.0
    TaskIII_II_Tray_interval = 30.0
    Integer TaskIII_II_TokenID
    Integer TaskIII_II_BlockID
    
    Off 12
    Go Retract_Safe
    
    For TaskIII_II_TokenID = TaskIII_II_Tokens To 0 Step -1
    	TaskIII_II_Pick_Infeed_Token()
    	TaskIII_II_Alignment_Token()
    	TaskIII_II_Place_Tray_Token()

    Next TaskIII_II_TokenID
    
    For TaskIII_II_BlockID = TaskIII_II_Blocks To 0 Step -1
     	TaskIII_II_Pick_Infeed_Block()
     	TaskIII_II_Alignment_Block()
     	TaskIII_II_Place_Tray_Block()

    Next TaskIII_II_BlockID

    Go Retract_Safe
    
Fend

Function TaskIII_II_Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", TaskIII_II_Tokens
    Go XY(16, 16, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(16, 16, -3, 0, 0, 0) -Z((TaskIII_II_Tokens * TaskIII_II_TokenHeight)) /3 CP
    On 12
	Wait .25
	Go XY(16, 16, -3, 0, 0, 0) +X(-10) -Z(80 + (TaskIII_II_Tokens * TaskIII_II_TokenHeight)) /3 CP

Fend
	
Function TaskIII_II_Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", TaskIII_II_Tokens
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
	
Function TaskIII_II_Place_Tray_Token
	'Tray Token
	Print "Placing Token in Tray. Tray Position ID = ", TaskIII_II_Tokens
	
    If TaskIII_II_Tokens = 2 Then
    	Go XY(23, 28, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskIII_II_Tray_interval * TaskIII_II_Tokens) -Z(20) /5 CP
        Move XY(23, 28, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskIII_II_Tray_interval * TaskIII_II_Tokens) /5
        Off 12
        Wait .5
        Go XY(23, 28, -1, 0, 0, 0) +X(-0.5) +Y(-0.7 + TaskIII_II_Tray_interval * TaskIII_II_Tokens) -Z(80) /5 CP

    ElseIf TaskIII_II_Tokens = 1 Then
        Go XY(23, 28, -1, 0, 0, 0) +X(-0.25) +Y(TaskIII_II_Tray_interval * TaskIII_II_Tokens - 1.55) -Z(20) /5 CP
        Move XY(23, 28, -1, 0, 0, 0) +X(-0.25) +Y(TaskIII_II_Tray_interval * TaskIII_II_Tokens - 1.55) /5
        Off 12
        Wait .5
        Go XY(23, 28, -1, 0, 0, 0) +X(-0.25) +Y(TaskIII_II_Tray_interval * TaskIII_II_Tokens - 1.55) -Z(80) /5 CP

    ElseIf TaskIII_II_Tokens = 0 Then
        Go XY(23, 28, -1, 0, 0, 00) +X(-0.05) +Y(-2.3) -Z(20) /5 CP
        Move XY(23, 28, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) /5
        Off 12
        Wait .5
        Go XY(23, 28, -1, 0, 0, 0) +X(-0.05) +Y(-2.3) -Z(80) /5 CP

    EndIf
    TaskIII_II_Tokens = TaskIII_II_Tokens - 1
	
Fend

Function TaskIII_II_Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", TaskIII_II_Blocks
    Go XY(19, 42, -3, 0, 0, 0) -Z(80) /3 CP
    Move XY(19, 42, -3, 0, 0, 0) -Z(1 + (TaskIII_II_Blocks * TaskIII_II_BlockHeight)) /3 CP
    On 12
	Wait .5
	Go XY(19, 42, -3, 0, 0, 0) +X(-10) -Z(80 + (TaskIII_II_Blocks * TaskIII_II_BlockHeight)) /3 CP

Fend

Function TaskIII_II_Alignment_Block
    'Alignment Block
	Print "Aligning Block. Block ID = ", TaskIII_II_Blocks
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
Function TaskIII_II_Place_Tray_Block
	'Tray Token
	Print "Placing Block in Tray. Tray Position ID = ", TaskIII_II_Blocks
	
    If TaskIII_II_Blocks = 2 Then
    	Go XY(39, 27, 0, 91, 0, 0) +X(11.7) +Y(-1 + TaskIII_II_Tray_interval * TaskIII_II_Blocks) -Z(20) /5 CP
        Move XY(39, 27, 0, 91, 0, 0) +X(11.7) +Y(-1 + TaskIII_II_Tray_interval * TaskIII_II_Blocks) /5
        Off 12
        Wait .5
        Go XY(39, 27, 0, 91, 0, 0) +X(11.7) +Y(-1 + TaskIII_II_Tray_interval * TaskIII_II_Blocks) -Z(80) /5 CP

    ElseIf TaskIII_II_Blocks = 1 Then
        Go XY(39, 27, 0, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskIII_II_Tray_interval * TaskIII_II_Blocks) -Z(20) /5 CP
        Move XY(39, 27, 0, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskIII_II_Tray_interval * TaskIII_II_Blocks) /5
        Off 12
        Wait .5
        Go XY(39, 27, 0, 91, 0, 0) +X(12.2) +Y(-1.5 + TaskIII_II_Tray_interval * TaskIII_II_Blocks) -Z(80) /5 CP

    ElseIf TaskIII_II_Blocks = 0 Then
        Go XY(39, 27, 0, 91, 0, 0) +X(12.5) +Y(-2) -Z(20) /5 CP
        Move XY(39, 27, 0, 91, 0, 0) +X(12.5) +Y(-2) /5
        Off 12
        Wait .5
        Go XY(39, 27, 0, 91, 0, 0) +X(12.5) +Y(-2) -Z(80) /5 CP

    EndIf
    TaskIII_II_Blocks = TaskIII_II_Blocks - 1
	
Fend

```

</details>


<details>
<summary>Task 3.3(I/O)的程式碼</summary>
  
```
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
	
```

</details>

### CAD
#### 推料盤
<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/Picture%20file/CAD.jpg" width="800" height="600">
</div>

#### 夾爪
<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/Picture%20file/gripper.jpg" width="800" height="600">
</div>

#### 放料斜面
<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/Picture%20file/platform.jpg" width="800" height="600">
</div>


### GUI

<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/92566662/7b1c882b-acb3-4d2a-bacf-9ecc802ff59d" width="600" height="400">
</div>



https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/assets/92566662/6d45e7b8-2d05-42d5-a82d-1839a6908cd9

<details>
<summary>GUI的程式碼</summary>
	
```

Function GUI_Motoron_Click(Sender$ As String)
    Motor On
Fend
Function GUI_Motoroff_Click(Sender$ As String)
    Motor Off
Fend
Function GUI_PowerHigh_Click(Sender$ As String)
    Power High
Fend
Function GUI_PowerLow_Click(Sender$ As String)
    Power Low
Fend
Function GUI_Home_Click(Sender$ As String)
    Home
Fend

Function GUI_RetractSafe_Click(Sender$ As String)
    Go Retract_Safe
Fend
Function GUI_TaskI_Click(Sender$ As String)
    TaskI
Fend
Function GUI_TaskII_Click(Sender$ As String)
    TaskII
Fend

Function GUI_TaskIII_I_Click(Sender$ As String)
    TaskIII_I
Fend
Function GUI_TaskIII_II_Click(Sender$ As String)
    TaskIII_II
Fend
Function GUI_IO_Click(Sender$ As String)
    I_O
Fend
	
```

</details>


### I/O(皆由本組人員自行完成)

#### I/O按鈕介紹
<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/Picture%20file/IO%E4%BB%8B%E7%B4%B9.jpg" width="1000" height="500">
</div>

#### I/O焊接圖
<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/Picture%20file/%E7%84%8A%E6%8E%A5%E5%9C%96.jpg" width="1000" height="500">
</div>

#### I/O完成屠圖
<div align="center">
    <img src="https://github.com/Tommy1248/Autonomous-Mobile-Vehicles-and-Robots-Introduction-B-1/blob/main/Picture%20file/IO%E5%AE%8C%E6%88%90%E5%9C%96.jpg" width="1000" height="500">
</div>


