source ./auto/srcvar.sh
printf "Hi \033[1;33m$USERNAME\033[0m
AUTOG, version 1.0.1
Type 'h' or 'H' to see this list.
You can visit https://github.com/johnil0/bash,
AUTOG is open for support and colaboration.

Uppercase [] means the value is from 'srcvar.sh'.
\033[1;31m!! MAKE SURE TO EDIT srcvar.sh FIRST!!\033[0m
After that save the file and restart the GitBash.

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
                            'git add .'
                            'git commit -m [text]'

b [branch_name]             'git checkout [branch_name]'

ps                          'git push [current branch]
pl                          'git pull [BRANCH] (default)
pl [branch]                 'git pull [branch] (optional)

g                           enable GIT COMMANDS
x                           exit from GIT COMMANDS (after the 'g' only)

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

d                           'ssh [SSH]' (recommended with ssh-key)

(depreciated)               '[PUTTY]' optional
                            '[TXT]' optional

(depreciated)                After the 'd' command only.

\n\n"