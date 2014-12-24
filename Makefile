SHELL           = /bin/bash
VERSION         = $(shell grep @VERSION live.php | cut -d" " -f5)
NAME            = livestatus-slave
DISTNAME        = $(NAME)-$(VERSION)
PKG             = $(DISTNAME).tar.gz

all: help

help:
	@echo "make dist     ---> Create an archive for releasing"

clean:
	rm -f $(NAME)-*.rpm $(NAME)-*.tar.gz *~

dist: clean
	rm -rf $(DISTNAME)
	mkdir -p $(DISTNAME)
	tar cf - --exclude=$(DISTNAME) --exclude=Makefile * | tar xf - -C $(DISTNAME)
	tar cvzf $(PKG) --owner=root --group=root $(DISTNAME)
	rm -rf $(DISTNAME)
