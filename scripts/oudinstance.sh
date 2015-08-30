#!/bin/bash

if [ -e ~/Oracle/Middleware/asinst_1 ]; then
	echo "OUD instance already created"
	exit
fi

#PASSWORDFILE=/tmp/$$.password
PASSWORDFILE=~/oudpassword.txt

cd ~/Oracle/Middleware/Oracle_OUD1

echo "ABcd1234" > $PASSWORDFILE
#cat $PASSWORDFILE

# either -a (for the base)
# or     -d 10000 (for the sample data)

if [ "$HOSTNAME" == "oud1.oracleateam.com" ]; then
	echo Running on OUD1
	echo Will generate sample users when creating OUD instance
	
	EXTRAARG="-d 10000"
else
	echo Running on host other than oud1
	echo only creating base entry when creating OUD instance
	
	EXTRAARG="-a"
fi

echo Running oud-setup...
#./oud-setup --cli --no-prompt -Q -p 1389 --adminConnectorPort 4444 \
#	-D "cn=Directory Manager" -j $PASSWORDFILE -b dc=example,dc=com  \
#	-d 10000
./oud-setup --cli --no-prompt -p 1389 --adminConnectorPort 4444      \
	-D "cn=Directory Manager" -j $PASSWORDFILE -b dc=example,dc=com  \
	$EXTRAARG

cd /home/vagrant/Oracle/Middleware/asinst_1/OUD

./bin/status -X -n -D "cn=Directory Manager" -j $PASSWORDFILE

#rm $PASSWORDFILE
