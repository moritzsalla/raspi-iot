""" sending OSC with pyOSC
https://trac.v2.nl/wiki/pyOSC
example by www.ixi-audio.net based on pyOSC documentation
"""
# Modified for Wekinator by Rebecca Fiebrink

"""
note that if there is nobody listening in the other end we get an error like this
    OSC.OSCClientError: while sending: [Errno 111] Connection refused
so we need to have an app listening in the receiving port for this to work properly

this is a very basic example, for detailed info on pyOSC functionality check the OSC.py file 
or run pydoc pyOSC.py. you can also get the docs by opening a python shell and doing
>>> import OSC
>>> help(OSC)
"""

import OSC
import time, random
from api import fetch

print "*******"
print "This program sends 3 random inputs to Wekinator every second."
print "Default is port 6448, message name /wek/inputs"
print "If Wekinator is not already listening for OSC, we will get an error."
print "*******"

send_address = '127.0.0.1', 6448

# OSC basic client
c = OSC.OSCClient()
c.connect( send_address ) # set the address for all following messages

# lets try sending a different random number every frame in a loop
try :    
    while 1: # endless loop
        rNum = OSC.OSCMessage()
        rNum.setAddress("/wek/inputs")

        val = fetch()
        rNum.append(val)
        c.send(rNum)

        print "Sent value: "
        print val
        time.sleep(3600) # wait one hour

except KeyboardInterrupt:
    print "Closing OSCClient"
    c.close()
    print "Done"