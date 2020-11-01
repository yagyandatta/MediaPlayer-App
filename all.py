#!/usr/bin/python3

print(" content-type: text/html")
print().

import subprocess
import cgi

mydata = cgi.FieldStorage()

myx = mydata.getvalue ("x") 
x=subprocess.getoutput("sudo"+ myx)

print (x)