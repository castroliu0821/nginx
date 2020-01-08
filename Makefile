
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/usr/nginx/sbin -t

	kill -USR2 `cat /usr/nginx/var/pid`
	sleep 1
	test -f /usr/nginx/var/pid.oldbin

	kill -QUIT `cat /usr/nginx/var/pid.oldbin`
