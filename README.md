# tmux-rhel-rpmbuild
Makefiles to build tmux RPMs for Redhat/Centos 6, with FPM

# Requirements

Ruby 1.9.3 (installed via RVM, https://gist.github.com/slouma2000/8619039)

FPM (https://github.com/jordansissel/fpm)

wget

git (for tmux-resurrect plugin)

# Tested on 

RHEL 6.9

# WARNING

The tmux-resurrect RPM might obliterate your /etc/tmux.conf file, if you have one.

# Usage
./buildrpm.sh libevent yourname

yum install ./libevent\*.rpm

./buildrpm.sh tmux yourname

./buildrpm.sh tmux-resurrect yourname

ls fpm-\*/\*.rpm
