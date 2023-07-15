```brainfuck
[
    This program uses total 5 memory cells to give the output 'HelloWorld'
]

++++++++                Set cell 0 to 8
[
    >++++               Set cell 1 to 4
    [
        >++             Add 2 to cell 2
        >++             Add 2 to cell 3
        >+++            Add 3 to cell 4
        <<<-            Decrement cell 1
    ]
    >+                  Add 1 to cell 2
    >+++                Add 3 to cell 3
    >+                  Add 1 to cell 4
    [<]
    <-                  Decrement cell 0
]

[
    Below is the output part
    Currently cells are like this
    Cell 0 = 0
    Cell 1 = 0
    Cell 2 = 72
    Cell 3 = 88
    Cell 4 = 104
    Pointer is at cell 0
]

>>.                     Print cell 2 H=72
>>---.                  Print cell 4 e=101
+++++++..               Print cell 4 l=108
+++.                    Print cell 4 o=111
<-.                     Print cell 3 W=87
>.                      Print cell 4 o=111
+++.                    Print cell 4 r=114
------.                 Print cell 4 l=108
--------.               Print cell 4 d=100
```