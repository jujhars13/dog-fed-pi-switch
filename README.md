# Akaal Kaur - Doggy been Fed Switch

Raspberry Pi based switch with LCD used to record and display when our beloved doggy woggy has been fed so she can't dupe us and get fed twice.

Press the button to register when she's been fed:

- Displays date last fed on Display
- Ping IFTTT for mobile notifications etc
- Flashes LCD

![](akita_logo.png)

## links

- [RasPi 48pin Pinout](https://pinout.xyz/pinout/i2c)

## Hardware required

- Raspberry Pi B+,Zero, 3, 4 or any internet enabled Pi
- I2C enabled LCD/OLED [like this](https://www.amazon.co.uk/gp/product/B07PWWTB94/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- Breadboard/circuit board wires/solder
- LED with 330ohm resistor
- Physical push switch

## To Deploy

- copy `provision-pi.sh` and your populated `.env` to a new Raspbian Stretch `/boot` partition
- once Pi has finished booting for the first time and you've configured
  - network(wifi)
  - ssh connection & security
- run `provision-pi.sh` as `root`:

  ```bash
  sudo su -
  bash provision-pi.sh
  ```

  This will:
      - Install all deps
      - checkout code to `/opt/akaal-switch`
      - setup updates, reboots etc...
- Remember to populate and copy `.env` to `/opt/akaal-switch` if you have not already done so
- Wire up RasPi as per diagram
- Reboot and Test!

## TODO

- [x] print message to LCD screen
- [x] led flash sequence
- [x] wire up button
- ~[ ] add speech/woof sound, (need DAC) ~
- [ ] take photo of dev board
- [ ] send IFTTT notification to write to gsheet and send mobile notifications
- [x] start script at boot
- [ ] draw wiring diagram (fritzing)
- [x] pull latest script from github at boot
- [ ] re-install pi and redeploy
- [x] ensure pi has autoupdates on
- [ ] solder things up
- [ ] deploy
- [ ] take photo of final output

### To Run
Ensure you've copied `.env.template` to `.env` and populated the environment variables required.

## _Stuff

ssh

```bash
ssh pi@192.168.1.45
```

auto copy code to pi

```bash
inotify scp -r app/ pi@192.168.1.45:/home/pi/
```

```lua
conn:on("connection", function(conn, payload)
     conn:send("GET IFFT_URL"
      .." HTTP/1.1\r\n"
      .."Host: \r\n"
      .."Accept: */*\r\n"
      .."User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n"
      .."\r\n")
      print("IFTTT request sent. Goodbye")
```

## Licence

[MIT](LICENCE)
