import time
from datetime import datetime

# our libs
from src import lcd


def renderDisplay():

    # Initialise display
    lcd.lcd_init()

    now = datetime.now()

    # dd/mm/YY H:M:S
    date_time = now.strftime("%d/%m/%Y %H:%M:%S")

    # Send some more text
    lcd.lcd_string("Akaal last fed:", lcd.LCD_LINE_1)
    lcd.lcd_string("", lcd.LCD_LINE_2)
    lcd.lcd_string(f"{date_time}", lcd.LCD_LINE_3)
    lcd.lcd_string("nom nom nom", lcd.LCD_LINE_4)
