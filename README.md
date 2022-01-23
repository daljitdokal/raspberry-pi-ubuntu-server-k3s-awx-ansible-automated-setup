# -*- ii: ii; -*-
#+TITLE: Ubuntu-server minimal setup
#+AUTHOR: Daljit Singh (https://github.com/daljitdokal)
#+EMAIL: daljit.dokal@yahoo.co.nz
#+DATE: 28th April 2021

** Overview
The purpose of this repository is to fully automate the installation and configuration of raspberry-pi server with `Ubuntu-server`, `k3s`, `awx`, and `awx job createtion and schdule`.

** Requirements
1. a Raspberry Pi (from model 1B up to 4B, 3A+, 3B+ or Zero including Zero W)
2. SD card with at least 1GB, or at least 128MB for USB root install (without customization)
3. ethernet or wireless LAN with a working internet connection

** Install instructions
1. Format SD card or [[https://github.com/daljitdokal/raspbian-minimal-setup/blob/main/restore-usb-drive.org][Restore USB Drive if it has been used before]]
2. Write the installer to the SD card
3. Provide unattended installation settings (optional) or follow the first boot steps later
4. Power on the Raspberry Pi and wait until the installation is done

** Documentation
The purpose of this repository is to fully automate the installation and configuration of raspberry-pi server as following:
1. Build [[Ubuntu-server on raspberry-pi][documentation/server-setup.md]]
2. Enable [[remote ssh][documentation/server-setup.md]]
3. Install [[K3S with Ansible Playbook][post-install#install-k3s-and-awx]]
4. Install [[AWX with Ansible Playbook][]post-install#install-k3s-and-awx]]
5. Configure and schedule awx jobs [[with Ansible Playbook][post-install#configure-and-schedule-awx-job]]
