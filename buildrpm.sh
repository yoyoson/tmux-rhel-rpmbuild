#!/bin/sh -f
name=$1
mkdir -p fpm-$name
cp  Makefile.$name  fpm-$name 
pushd fpm-$name
make -f ./Makefile.$name
popd
