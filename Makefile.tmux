NAME=tmux
VERSION=2.6
#RELEASE=stable

TARFILE=$(NAME)-$(VERSION).tar.gz
SRCDIR=$(NAME)-$(VERSION)
TMPDIR=$(SRCDIR)-tempinst
PKGNAME=$(NAME)
RPMUSER=root



.PHONY: tmux
tmux:
	rm -f $(TARFILE)
	rm -Rf $(SRCDIR) $(TMPDIR)
	wget https://github.com/$(NAME)/$(NAME)/releases/download/$(VERSION)/$(NAME)-$(VERSION).tar.gz
	tar xzf $(TARFILE)
	cd $(SRCDIR); LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure  --prefix=/usr/local
	$(MAKE) -C $(SRCDIR) 
	mkdir $(TMPDIR)
	$(MAKE) -C $(SRCDIR) install DESTDIR=`pwd`/$(TMPDIR)
	rm -f $(NAME)*$(VERSION)*.rpm
	fpm -s dir -t rpm --rpm-user=$(RPMUSER) -n $(PKGNAME) -v $(VERSION) -d 'libevent > 2.1' -d ncurses -C $(TMPDIR) .

