# Akaal Kaur Switch

![](akita_logo.png)

Raspi based switch used to record and display when our beloved doggy woggy has been fed so she can't dupe us and get fed twice.

## links

- [Pinout](https://pinout.xyz/pinout/i2c)

## TODO

- [x] print message to LCD screen
- [x] led flash sequence
- [x] wire up button
- [ ] woof sound
- [ ] take photo of dev board
- [ ] send IFTTT notification to write to gsheet and send mobile notifications
- [ ] start script at boot
- [ ] draw wiring diagram (fritzing)
- [ ] pull latest script from github at boot
- [ ] re-install pi and redeploy
- [ ] ensure pi has autoupdates on
- [ ] solder things up
- [ ] deploy
- [ ] take photo of final output

## _Stuff

ssh

```bash
ssh pi@192.168.1.45
```

copy code to pi

```bash
inotify scp -r app/ pi@192.168.1.45:/home/pi/
```

1
2
