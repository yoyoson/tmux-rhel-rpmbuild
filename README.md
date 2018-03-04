# tmux-rhel-rpmbuild
Makefiles to build tmux RPMs for Redhat/Centos 6, with FPM

# Requirements

Ruby 1.9.3 (installed via RVM, https://gist.github.com/slouma2000/8619039)

FPM (https://github.com/jordansissel/fpm)

# Tested on 

RHEL 6.9

# Usage
./buildrpm.sh libevent

yum install libevent 

./buildrpm.sh tmux

./buildrpm.sh tmux-resurrect

find . -iname '*.rpm'
