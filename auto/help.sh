source ./auto/srcvar.sh
printf "Hi $USERNAME
AUTOG, version 1.0.0
Type 'h' or 'H' to see this list.
You can visit https://github.com/johnil0/bash,
AUTOG is open for support and colaboration.

Uppercase [] means the value is from 'srcvar.sh'.

Command list:
c | C           'clear'
s | S           'git status'
p | P           'git pull origin [BRANCH]'
r . | R .       'git restore .'
r 0 1...n       'git restore [file/s]'
a . | A .       'git add .'
a 0 1...n       'git add [file/s]'
u . | U .       'git restore --staged .'
u 0 1...n       'git restore --staged [file/s]'

q [text]        'git pull origin [BRANCH]'
                'git commit -m [text]'
                'git push origin [MYBRANCH]'

push            'git pull origin [BRANCH]'
                'git add .'
                'git commit -m [MESSAGE]'
                'git push origin [MYBRANCH]'

run             '[RUN]' optional

d               '[PUTTY]' optional
                '[TXT]' optional

done            after the 'd' command only."