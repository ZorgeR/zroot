#!/bin/sh

# zroot - is simply script to access root directory directly from file manager.
# Please don't modify code.

mypath=${0%/*}

$mypath/showRadio "zroot" "by Zorge.R" "Open root access" "Close root access" "Add / Remove scripts to autorun" "About / Help"
ret=$?
[ $ret -eq 0 ] && exit

case $ret in
	1)
		if [ -f "/ezxlocal/download/mystuff/ROOT" ]
			then
				mount -o bind / /ezxlocal/download/mystuff/ROOT
				$mypath/showNotify "Complete" "root access granted. Just open ROOT directory in phone memory" 1 5
			else
				mkdir -p /ezxlocal/download/mystuff/ROOT
				mount -o bind / /ezxlocal/download/mystuff/ROOT
				$mypath/showNotify "Complete" "root access granted. Just open ROOT directory in phone memory" 1 5
		fi
		;;
	2)
		umount /ezxlocal/download/mystuff/ROOT
		rm -r /mmc/movinand1/ROOT
		$mypath/showNotify "Complete" "Root access closed" 1 5
		;;
	3)
		if [ ! -f /ezxlocal/download/mystuff/unKnown/S01root.txt ]
		then
			cp $mypath/S01root.txt /ezxlocal/download/mystuff/unKnown/S01root.txt
			$mypath/showNotify "Complete" "Script is added to autorun" 1 5
		else
			rm -f /ezxlocal/download/mystuff/unKnown/S01swapest.txt
			$mypath/showNotify "Complete" "Script is removed from autorun." 1 5
		fi
		;;
	4)
		$mypath/showQ "zroot tool" "This simply script writed by the Zorge.R, from www.motofan.ru. Please be carefull, never delete ROOT folder directly from file manager. Use the Close root options to do it, or you may delete system file" 2
		;;
	*)
		;;
esac
