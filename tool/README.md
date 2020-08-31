Before using tools located here please install missing dependencies, as presented in either
- requirements.txt (e.g. with Pip),
- Pipfile (e.g. with pipenv).

Detailed instructions below.

#### Solution one (the fastest, Ubuntu 18.04+ and derivatives):
```bash
sudo apt install python3-cffi python3-usb libudev-dev libudev-dev:i386
```

#### Solution two, using `pipenv` (for develoment, distribution agnostic):
While being in the `nitrokey-start-firmware/tool` directory:
```bash
git pull # to update the repository
# in case Pip is not installed
# sudo apt install python3-pip 
pip3 install pipenv --user
pipenv install --three
```

#### Solution three, using `pip` (classic way):
While being in the `nitrokey-start-firmware/tool` directory:

```bash
git pull # to update the repository
# in case Pip is not installed
# sudo apt install python3-pip 
pip3 install -r requirements.txt --user
```

