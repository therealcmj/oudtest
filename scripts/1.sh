#!/bin/bash

# This script does its work pretty blindly
cp /vagrant/.bash_profile ~

. .bash_profile

if [ -e ~/jdk1.7.0_80 ]; then
	echo "JDK directory already exists"
else
	tar xvzf /media/software/jdk-7u80-linux-x64.tar.gz
fi

if [ -e ~/jdk ]; then
	echo "JDK symlink already exists"
else
	ln -s ~/jdk1.7.0_80 jdk
fi

# should install WLS
if [ -e ~/Oracle/Middleware/wlserver_10.3 ]; then
	echo "WLS already installed"
else
	echo "Installing WLS"
	java -jar /media/software/wls1036_generic.jar -mode=silent -silent_xml=/vagrant/rsp/wls1036.xml
fi


if [ -e ~/Oracale/Middleware/oracle_common/modules/oracle.jrf_11.1.1 ]; then
	echo "JRF appears to already be installed"
else
	echo "Installing JRF"
	cd /media/software/ofm_appdev_generic_11.1.1.7.0
	./Disk1/runInstaller -jreLoc ~/jdk -silent -invPtrLoc /vagrant/rsp/oraInst.loc -responseFile /vagrant/rsp/jrf_wls.rsp -waitforcompletion -ignoreSysPrereqs
fi

if [ -e ~/Oracle/Middleware/Oracle_OUD1 ]; then
	echo "OUD appears to already be installed"
else
	echo "Installing OUD"
	cd /media/software/ofm_oud_generic_11.1.2.2/Disk1
	./runInstaller -jreLoc ~/jdk -silent -invPtrLoc /vagrant/rsp/oraInst.loc -responseFile /vagrant/rsp/oud.rsp -waitforcompletion -ignoreSysPrereqs
fi

