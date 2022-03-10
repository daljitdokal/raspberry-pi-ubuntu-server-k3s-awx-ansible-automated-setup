# Introduction
The purpose of this documentation is to attached new harddrive to `raspberry-pi` and mount it to `ubuntu-server`, so that it is available to for AWX jobs to backup `mysql` databases files.

## Mount new harddrive

Please attach new harddrive to `raspberry-pi` and use following commands to mount new harddrive to `ubuntu-server`.

Create new partition:

```bash
sudo lsblk
sudo fdisk /dev/sda 
m
d # If hard drive used before, else skip
n
w
```

Create/format file system:

```bash
sudo mkfs.ext4 /dev/sda1
```

Create mount point `/mn/backup`:

```bash
cd /mnt 
sudo mkdir backup
sudo chown $USER:$USER backup -R
sudo mount /dev/sda1 /mnt/backup
```

### Create partition mount at boot

Get UUID for sda1 (newly attached harddrive)
```bash
ls -l /dev/disk/by-uuid
```

Add following line with `UUID` to `/etc/fstab` file.
```bash
UUID=XXXXXXX-XXXXXXX-XXX-XXX-XXXXXXX  /mnt/backup      ext4    defaults        0
```

Restart the `raspberry-pi`
