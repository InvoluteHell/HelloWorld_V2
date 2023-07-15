# Wheel Implementation

## Introduction

**Wheel (WHolly ElEgant Language)** was created by [User:PixelatedStarfish](https://esolangs.org/wiki/User:PixelatedStarfish) in 2021. The syntax of the language is designed to be terse, with single character operations.



## Operations

Note that some operations take parameters as decimal values. `C65` prints `A`.

|        Op         |                        Desc                        |
| :---------------: | :------------------------------------------------: |
|       **+**       |                     Add to val                     |
|       **-**       |                    Sub from val                    |
|       **<**       |                Rotate Anticlockwise                |
|       **>**       |                  Rotate Clockwise                  |
|       **L**       |                       Label                        |
|       **G**       |                        Goto                        |
|       **Z**       |                     Goto if 0                      |
|       **Y**       |                   Goto if not 0                    |
|       **D**       | Decrease size of wheel (Removes value at pointer.) |
|       **I**       |  Increase size of wheel (Adds a value to wheel.)   |
|       **V**       |                   Print as Value                   |
|       **C**       |                   Print as ASCII                   |
|       **#**       |                   Set index to 0                   |
|       *****       |            Take Input and Store at Cell            |
|       **%**       |                   Shuffle Wheel                    |
|       **@**       |                    Print Wheel                     |
|       **^**       |                 Print Wheel Index                  |
|       **$**       |                        Halt                        |
| **(**Comment**)** |                     A comment                      |



## Implementation

```wheel
C72C101C108C108C111C87C111C114C108C100
```

72->H

101->e

...

