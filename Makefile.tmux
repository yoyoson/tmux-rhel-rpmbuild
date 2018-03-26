NAME=tmux
VERSION=2.6
PKGRELEASE=1
DIST=el6

TARFILE=$(NAME)-$(VERSION).tar.gz
SRCDIR=$(NAME)-$(VERSION)
TMPDIR=$(SRCDIR)-tempinst
PKGNAME=$(NAME)
RPMUSER=root
PACKAGER=${PACKAGER}
DESC="$$(printf "tmux is a terminal multiplexer.\n\
It lets you switch easily between several programs in one terminal,\n\
detach them (they keep running in the background) and reattach them\n\
to a different terminal. And do a lot more. See the tmux(1) manual\n\
page and the README.")"

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
	#rm -f $(NAME)*$(VERSION)*.rpm
	fpm -s dir -t rpm \
		--force \
		--rpm-user=$(RPMUSER) \
		--maintainer=$(PACKAGER) \
		--description=$(DESC) \
		-n $(PKGNAME) \
		-v $(VERSION) \
		--iteration $(PKGRELEASE) \
		--rpm-dist $(DIST) \
		-d 'libevent >= 2.0' \
		-d ncurses \
		-C $(TMPDIR) .

