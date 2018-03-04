#!/bin/sh -f

if [[ $# -ne 2 ]] ; then
	echo "	usage: $0 <package name> <packager name (you)>"
	echo "	e.g.: $0 libevent bobsysadmin"
	echo "	      $0 tmux bobsysadmin"
	echo "	      $0 tmux-resurrect bobsysadmin"
	exit -1
fi

name=$1
packager=$2
mkdir -p fpm-$name
cp  Makefile.$name  fpm-$name 
pushd fpm-$name
make -f ./Makefile.$name PACKAGER="${packager}"
popd
