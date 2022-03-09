## How To Restore USB Drive in Windows 10

Please use following steps to restore USB drive:

- Go to Start > Run DiskPart

- Identify the disk that corresponds to the USB.

    ```bash
    DISKPART> list disk
    # We assume the correct disk is X.
    DISKPART> select disk X
    ```
- Delete disk

    ```bash
    DISKPART> clean
    ```

- Create partition
    ```bash
    DISKPART> create partition primary
    ```

### Format USB
- Go to Computer and right click on the USB drive, then select `Format`.
- Select the desired `option` () and click `Format`.

**Note:** The SD card formats supported by the Raspberry Pi bootloader are `FAT16` and `FAT32` only. So, it is quite obvious that using the SD cards with higher capacities(SDXC) won't work. In order to make SDXC cards compatible with Raspberry Pi, you will require to format the card into `FAT32`.
