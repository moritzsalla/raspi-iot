from sense_hat import SenseHat
import time
import math

sense = SenseHat()

def calcVal(speed, seed):
    val = math.floor((math.sin(time.time() * speed + seed) * 100) + 127.5)
    print(val)
    return val

x = 1
while(x == 1):
    sense.clear(calcVal(1, 1), calcVal(1, 10), calcVal(1, 80))
    time.sleep(0.1)
