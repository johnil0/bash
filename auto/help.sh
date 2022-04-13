source ./auto/srcvar.sh
printf "Hi $USERNAME
AUTOG, version 1.0.0
Type 'h' or 'H' to see this list.
You can visit https://github.com/johnil0/bash,
AUTOG is open for support and colaboration.

Uppercase [] means the value is from 'srcvar.sh'.

Command list:
c | C                       'clear'
s | S                       'git status'
p | P                       'git pull origin [BRANCH]'
r . | R .                   'git restore .'
r 0 1...n                   'git restore [file/s]'
a . | A .                   'git add .'
a 0 1...n                   'git add [file/s]'
u . | U .                   'git restore --staged .'
u 0 1...n                   'git restore --staged [file/s]'

q [text]                    'git pull origin [BRANCH]'
                            'git commit -m [text]'
                            'git push origin [MYBRANCH]'

push [0 1...n] [message]    'git pull origin [BRANCH]'
                            'git add .'
                            'git commit -m [MESSAGE]'
                            'git push origin [MYBRANCH]'
                            [file index] is optional
                            [message] is optional
                            \033[1;31m!! If using [file index] make sure to execute 's' first!!\033[0m
                            if there are other files that was staged aside
                            from the selected [file index]
                            it will be pushed also.



run                         '[RUN]' optional

d                           '[PUTTY]' optional
                            '[TXT]' optional

done                        After the 'd' command only.

Authors:
John, Engr. Ryan V.M.\n\n"