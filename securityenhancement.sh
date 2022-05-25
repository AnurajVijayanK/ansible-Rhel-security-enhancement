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



sudo cp /etc/pam.d/passwd /etc/pam.d/passwd.bkp


sudo cp /etc/security/pwquality.conf /etc/security/pwquality.conf.bkp

sudo sed -i 's/# minlen = 9/minlen = 14/g' /etc/security/pwquality.conf
sudo sed -i 's/# minclass = 0/minclass = 4/g' /etc/security/pwquality.conf
sudo sed -i 's/# maxclassrepeat = 0/maxclassrepeat = 3/g' /etc/security/pwquality.conf
sudo sed -i 's/# maxrepeat = 0/maxrepeat = 3/g' /etc/security/pwquality.conf

sudo cp  /etc/login.defs /etc/login.defs.bkp
sudo
sudo sed -i 's/^PASS_MAX_DAYS.*99999/PASS_MAX_DAYS 42/g' /etc/login.defs
sudo sed -i 's/^PASS_MIN_DAYS.*0/PASS_MIN_DAYS 1/g' /etc/login.defs
sudo sed -i 's/^PASS_MIN_LEN.*5/PASS_MIN_LEN 14/g' /etc/login.defs

sudo cp  /etc/bashrc /etc/bashrc.bkp


sudo cp  /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp

sudo sed -i 's/X11Forwarding yes/X11Forwarding no/g' /etc/ssh/sshd_config
sudo sed -i 's/#MaxAuthTries 6/MaxAuthTries 5/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 1800/g' /etc/ssh/sshd_config
sudo sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 0/g' /etc/ssh/sshd_config

sudo echo "root" | sudo tee /etc/at.allow
sudo echo "root" | sudo tee /etc/cron.allow

sudo systemctl set-default multi-user.target

sudo ##Adding Zabbix service and port in firewalld

sudo firewall-cmd --zone=public --add-service=zabbix-agent
sudo firewall-cmd --zone=public --permanent --add-port=10050/tcp


## Verify the output.txt file
sudo echo "security enhancement" | sudo tee output.txt
## Verify the output.txt file
echo ================================================================ >> output.txt
sudo grep pam_pwquality.so /etc/pam.d/passwd  >> output.txt
echo ================================================================ >> output.txt

sudo grep -E "minlen|minclass|maxclassrepeat|maxrepeat" /etc/security/pwquality.conf >> output.txt
echo ================================================================  >> output.txt

sudo grep -E "PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE" /etc/login.defs >> output.txt
echo ================================================================  >> output.txt

sudo grep "export TMOUT" /etc/bashrc >> output.txt
echo ================================================================  >> output.txt

sudo grep -E "MaxAuthTries|X11Forwarding|PermitEmptyPasswords|PermitRootLogin|ClientAliveInterval|ClientAliveCountMax" /etc/ssh/sshd_config >> output.txt
echo ================================================================ >> output.txt

sudo grep -E "rotate 18" /etc/logrotate.conf >> output.txt
echo ================================================================ >> output.txt

sudo cat /etc/at.allow >> output.txt
echo ================================================================ >> output.txt

sudo cat /etc/cron.allow >> output.txt
echo ================================================================ >>  output.txt
[ansible@azvlinuxmgt01 playbooks]$
