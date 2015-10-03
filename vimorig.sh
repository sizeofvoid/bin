#!/bin/ksh
#  ___(_)_______  ___  / _|_   _____ (_) __| |  ___  _ __ __ _
# / __| |_  / _ \/ _ \| |_\ \ / / _ \| |/ _` | / _ \| '__/ _` |
# \__ \ |/ /  __/ (_) |  _|\ V / (_) | | (_| || (_) | | | (_| |
# |___/_/___\___|\___/|_|   \_/ \___/|_|\__,_(_)___/|_|  \__, |
#                                         $SHELL scripts |___/
#
# Copyright (c) 2012, Rafael Sadowski <rafael |AT| sizeofvoid.org>
# Licensed under the ISC license.
# vimorig - create *.orig copy from file

startvim {

	cp $1 $1.orig
	vim -p $1 $1.orig

	echo ""
	echo -n "DELETE $1.orig (yes):"
	read yes

	if [ "$yes" == "yes" ]; then
		rm -rf $1.orig
		exit 0
	fi
	exit 0

}

if [ -f $1 ]; then
	if [ -f "$1.orig" ]; then
		echo "$1.orig exist!"
		echo -n "DELETE $1.orig and create NEW? (y):"
		read yes

		if [ "$yes" == "y" ]; then
			startvim $1
		else
			exit 0
		fi

	else
		startvim $1
	fi
else
	echo "hey jackass $1 is NOT a file!"
	exit -1
fi
