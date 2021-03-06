echo "Mount the new partition in wsl"
if [ -d "/mnt/d" ]; then
    echo "Folder already exits."
else
    sudo mkdir /mnt/d
fi

sudo mount -t drvfs d: /mnt/d/

echo "Copy the contents of installer to sd"
cp config/network-config /mnt/d/
cp config/user-data /mnt/d/
cp config/cmdline.txt /mnt/d/

echo "We need to wait before we can eject"
sudo umount /mnt/d
