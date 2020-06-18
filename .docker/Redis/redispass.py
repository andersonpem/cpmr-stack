#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys
from os import path
clear = lambda: os.system('clear')
green = "\033[1;32;2m"
greenblink = "\033[1;32;5m"
yellow = "\033[1;33;2m"
yellowblink = "\033[1;33;5m"
redblink = "\033[1;31;5m"
red = "\033[1;31;2m"
white = "\033[1;37;0m"
normal = "\033[0m"
# =============================

if not path.exists("/run/secrets/redis_secret"):
    print (red+" A Redis password is not set in the secrets."+normal)
    print (red+" The server will start with the default password: "+green+"testpass"+normal)
    print (red+" It is highly advisable to change this password for security reasons."+normal)
    print (red+" Please refer to http://link.to.documentation to fix this. "+normal)
    # sys.exit(1)
else:
    print (green+" Setting everything up. It'll only take a second."+normal)
    secret = open('/run/secrets/redis_secret', 'r')
    with open('/usr/local/etc/redis/redis.conf') as f:
        newText=f.read().replace('testpass', secret.read())
    with open('/usr/local/etc/redis/redis.conf', "w") as f:
        f.write(newText)
    secret.close()
    print(green+" Server is ready to start. That's what we will do next :)"+normal)
    print("=========================================================================")