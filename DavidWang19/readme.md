# Whitespace Language

## Introduction

The language contains 3 different characters to represent the code: Space, Tab(\t), LF(\n).

Different combinations of characters form a series of operands that let this language be Turing-complete.

## Code

```whitespace
   	  	   
	
     		  	 	
	
     		 		  
 
  
 	
  	
     		 				
 
 	
     	 	 			
	
  	
     			  	 
	
  	
     		  	  
	
  



```

## Annotation

```text
!S, T, L corresponds to space, tab and LF respectively

S S STSSTSSSL        !push number +1001000('H') to stack
TL SS                !print the character at the top of stack: 'H'
S S STTSSTSTL        !push 'e'
TL SS                !print 'e'
S S STTSTTSSL        !push 'l'
S LS                 !duplicate the top element of the stack
S LS                 !stack: ['l','l','l']
TL SS                !print 'l'
TL SS                !print 'l'
S S STTSTTTTL        !push 'o'
S LS                 !stack: ['o','o','l']
TL SS                !print 'o'
S S STSTSTTTL        !push 'W', stack: ['W','o','l']
TL SS                !print 'W'
TL SS                !print 'o'
S S STTTSSTSL        !push 'r', stack: ['r','l']
TL SS                !print 'r'
TL SS                !print 'l'
S S STTSSTSSL        !push 'd'
TL SS                !print 'd'
LLL                  !program ends
```
