# tmux-rhel-rpmbuild
Makefiles to build tmux RPMs for Redhat/Centos 6, with FPM

# Requirements

Ruby 1.9.3 (installed via RVM, https://gist.github.com/slouma2000/8619039)

FPM (https://github.com/jordansissel/fpm)

wget

git (for tmux-resurrect plugin)

# Tested on 

RHEL 6.9

Centos 7.4

# WARNING

The tmux-resurrect RPM might obliterate your /etc/tmux.conf file, if you have one.

# Usage
./buildrpm.sh libevent yourname

Because tmux needs libevent installed in order to build against it: 

yum install fpm-libevent/libevent\*.rpm

./buildrpm.sh tmux yourname

./buildrpm.sh tmux-resurrect yourname

ls fpm-\*/\*.rpm

# Notes

On RHEL6, You might have to first "yum remove libevent" and then 
"yum install \<the new libevent RPM\>" because there are nfs dependencies
that can't immediately use the new libevent.

So hopefully you aren't using NFS. If you are, sorry about that.

# License

This project is licensed under the terms of the MIT license.
