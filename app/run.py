import RPi.GPIO as GPIO
from src import display

# constants
PIN_BUTTON = 36

GPIO.setmode(GPIO.BOARD)

# GPIO PIN_BUTTON set up as input.
GPIO.setup(PIN_BUTTON, GPIO.IN,pull_up_down=GPIO.PUD_UP)

print(f"Waiting for falling edge on port {PIN_BUTTON}")
# now the program will do nothing until the signal on port 23
# starts to fall towards zero. This is why we used the pullup
# to keep the signal high and prevent a false interrupt
# "During this waiting time, your computer is not"
# "wasting resources by polling for a button press.\n"

try:
  while True:
    GPIO.wait_for_edge(PIN_BUTTON, GPIO.FALLING)
    print(f"\n Button pressed {PIN_BUTTON}")
    display.renderDisplay()
except KeyboardInterrupt:
  GPIO.cleanup()       # clean up GPIO on CTRL+C exit
GPIO.cleanup()
