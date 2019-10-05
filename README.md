# Akaal Kaur Switch

![](akita_logo.png)

Raspi based switch used to record and display when our beloved doggy woggy has been fed so she can't dupe us and get fed twice.

## links

- [Pinout](https://pinout.xyz/pinout/i2c)

## TODO

- [ ] led flash sequence
- [ ] wire up button
- [ ] send IFTTT notification to write to gsheet and send mobile notifications
- [ ] pull latest script at boot
- [ ] start script at boot
- [ ] woof sound with pi hat
- [ ] draw wiring diagram
- [ ] solder things up
- [ ] re-install pi and redeploy
- [ ] ensure pi has autoupdates on
- [ ] deploy

## _Stuff

ssh

```bash
ssh pi@192.168.178.45
```

copy code to pi

```bash
inotify scp -r app/ pi@192.168.178.45:/home/pi/
```
