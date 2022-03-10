## Requirements
1. Raspberry Pi (from model 1B up to 4B, 3A+, 3B+ or Zero including Zero W)
2. SD card with at least 1GB, or at least 128MB for USB root install (without customization)
3. Ethernet or wireless LAN with a working internet connection


# Steps
Create the bootable SD card with a minimal install of Ubuntu Server 20.04 x64, which is a free and open source operating system based on Debian.

## Step 1: Download SD card imaging
- Format SD card or [Restore USB Drive if it has been used before](https://github.com/daljitdokal/raspberry-pi-ubuntu-server-k3s-awx-ansible-automated-setup/blob/ubuntu-server/documentation/restore-usb-drive.md)
- To simplify the SD card creation process we can use the open source rpi-imager utility, the code snippet below will download the latest release:
```bash
export GET_USER="Dalji" # $USER
echo Downloading latest release zip from github
curl -s https://api.github.com/repos/raspberrypi/rpi-imager/releases/latest \
      | grep "browser_download_url.*exe" \
      | cut -d : -f 2,3 \
      | tr -d \" \
      | wget -O /mnt/c/Users/$GET_USER/Downloads/imager.exe -i -

echo Checking file is now present
ls -l /mnt/c/Users/$GET_USER/Downloads/imager.exe
```
- With the software downloaded, let’s fire it up the installer and get it setup.
```bash
cmd.exe /mnt/c/Users/$GET_USER/Downloads/imager.exe
```

## Step 2: Build image to SD card
- Put the SD card and begin the imaging process.

- First select an Operating System: 
  - `CHOOSE OS` –> 
  - `Other general purpose OS` –> 
  - `Ubuntu` ->
  - `Ubuntu Server 20.04.X LTS x64`

- Select the storage (USB)

Once you’ve selected the operating system and sd card, click `WRITE`. The process will take a few minutes to complete.

## Step 3: Custom configuration
Our next step is to copy the custom `user-data` and `network-config` files included in this repository to the newly created SD card. Do this by executing the following script. 

```bash
./custom-configuration.sh
```

**Note:** 
- Make sure to update `user-data` and `network-config` files as per your requirements.
- Script assumes the SD card boot partition will be `D:\`. You may need to adjust for your environment.

## Step 4: Bootup raspberry-pi
Our SD card is ready. Lets insert it into rasbberry-pi and boot up.


## Step 5: Post install ssh configuration

Login to `raspberry-pi`
```bash
ssh 192.168.0.202 -p 22
```
#### Update color
```bash
echo " " >>  ~/.bashrc
echo "# Update color" >>  ~/.bashrc
echo "PS1='\[\033[02;31m\]\u@\H:\[\033[01;34m\]\w$\[\033[00m\] '" >>  ~/.bashrc
. .bashrc
```

#### Update default port
```bash
sudo sed -i "s/#Port 22/Port 2222/" /etc/ssh/sshd_config
sudo systemctl restart sshd
```
