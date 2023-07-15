import sys

def shift_backward(s):
    # Convert each character to ASCII, subtract 1, convert back to character
    return ''.join(chr(ord(c) - 1) for c in s)

def shift_forward(s):
    # Convert each character to ASCII, add 1, convert back to character
    return ''.join(chr(ord(c) + 1) for c in s)

def parse_command(input_string):
    output = ''
    current_string = ''
    is_quoted = False
    commands = []
    for c in input_string:
        if c in ['<','>']:
            commands.append(c)
        elif c == "'":
            if is_quoted:
                commands.append(current_string)
                current_string = ''
                is_quoted = False
            else:
                is_quoted = True
        else:
            if is_quoted:
                current_string += c
            else:
                output += c
    commands.reverse()
    string = commands[0]
    del commands[0]
    for command in commands:
        if command == '<':
            string = shift_backward(string)
        elif command == '>':
            string = shift_forward(string)
    return string

try:
    filepath = sys.argv[1]
    with open(filepath,'r') as file:
        line = file.readline()
        while line:
            print(parse_command(line))
            line = file.readline()
except:
    while True:
        print(parse_command(input(">")))
