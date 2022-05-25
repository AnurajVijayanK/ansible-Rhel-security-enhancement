# ansible-security-enhancement
security enhancement for RHEL servers 
+++++++++++++++++++++++++++++++++++++++
####****Password
#minimum password length        14 Character
#The minimum number of character types that must be used        4
#The maximum number of times a single character may be repeated          3
#The maximum number of characters in a row that can be in the same class         3
#PASS_MAX_DAYS  42 days [ now changing 180  to 42 ] Password age
#PermitRootLogin        No [ only through console root login allowed ]
#incorrect  MaxAuthTries        Number of incorrect tries allowed  5
#password required pam_pwquality.so     Optional check whether the password contains the user name in some form & dictionary words
#PASS_MIN_DAYS  Password age minimum 1 day
#PermitEmptyPasswords   Not allowed to create any user with empty password
#####***Terminal timeout
#Txport TMOUT   Terminal timeout after 1800 seconds, if it’s not in use
#ClientAliveCountMax    Max 3 terminal possible at a time.
#ClientAliveInterval    1800 seconds, Terminal timeout
#X11 / GUI login        X11Forwarding   X11 forwarding disabled
#multi-user. Target     server booting stage change to multi-user. Target, it’s should boot without GUI.
#at     Service job / script scheduler  only can possible to do root
#cron   Service  job/ script scheduler  only can possible to do root
