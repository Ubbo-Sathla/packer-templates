

rem basic config for winrm
winrm quickconfig -q

rem allow unencrypted traffic, and configure auth to use basic username/password auth
winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/service/auth @{Basic="true"}

rem update firewall rules to open the right port and to allow remote administration
netsh advfirewall firewall set rule group="remote administration" new enable=yes

rem restart winrm
net stop winrm
net start winrm

