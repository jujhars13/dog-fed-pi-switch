from src import display
import RPi.GPIO as GPIO
import time
import os
import urllib.request
import http.client

http.client.HTTPConnection.debuglevel = 1

print("Starting Akaal Switch")

# constants
PIN_BUTTON = 36

IFTTT_URL = os.getenv('IFTTT_URL')  # None
if IFTTT_URL is None:
    raise ValueError('IFTTT_URL not specified in env')

# Numbers pins by physical location
GPIO.setmode(GPIO.BOARD)

# GPIO PIN_BUTTON set up as input.
GPIO.setup(PIN_BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

print(f"Waiting for falling edge on port {PIN_BUTTON}")
# now the program will do nothing until the signal on the pin
# starts to fall towards zero. This is why we used the pull-up
# to keep the signal high and prevent a false interrupt
# During this waiting time, your computer is not
# wasting resources by polling for a button press

try:
    while True:
        # interrupt, wait until true
        GPIO.wait_for_edge(PIN_BUTTON, GPIO.RISING)
        # poll once more to prevent edge detection issues with line noise
        if GPIO.input(PIN_BUTTON):
            print(f"\n Button pressed {PIN_BUTTON}")
            display.renderDisplay()
            print(f"Calling {IFTTT_URL}")
            # res = urllib.request.urlopen(IFTTT_URL).read()
            # print(f"IFTTT response: {res}")
except KeyboardInterrupt:
    GPIO.cleanup()       # clean up GPIO on CTRL+C exit

GPIO.cleanup()
print("Stopping Akaal Switch")
