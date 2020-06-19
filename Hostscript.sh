#!bin/bash
URLs=("https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/hosts/hosts0" "https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/hosts/hosts1" "https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/hosts/hosts2" "https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/hosts.deny/hosts0.deny" "https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/superhosts.deny/superhosts0.deny" "https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/superhosts.deny/superhosts1.deny" "https://raw.githubusercontent.com/mitchellkrogza/Ultimate.Hosts.Blacklist/master/superhosts.deny/superhosts2.deny")
if [[ $(whoami) != "root" ]]; then
	echo "Re-run this as root!"
	exit
fi

if [[ -e /usr/bin/wget ]]; then
	if [[ -d /tmp/tmpWorkDir ]]; then
		rm -r /tmp/tmpWorkDir/
	fi
	mkdir /tmp/tmpWorkDir && cd /tmp/tmpWorkDir
	wget ${URLs[*]}
	mv /etc/hosts /etc/hosts.bak
	mv /etc/hosts.deny /etc/hosts.deny.bak
	mv /etc/superhosts.deny /etc/superhosts.deny.bak
	cat hosts[0..2] >> /etc/hosts
	cat hosts0.deny >> /etc/hosts.deny
	cat superhosts[0..2].deny >> /etc/superhosts.deny
	echo -e "\e[32mSuccessfull installation of hosts files!"
	rm -r /tmp/tmpWorkDir
	else
		echo -e "\033[0;31mInstall Wget on your system or choose curl as your trasnfer option"
fi
