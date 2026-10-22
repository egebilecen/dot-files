function luks-mount --description "Unlock and mount a LUKS2 drive"
    if test (count $argv) -lt 1
        echo "Usage: luks-mount /dev/sdX1 or /mnt/mountpoint [mapper-name]"
        return 1
    end

    set -l target $argv[1]
    set -l device
    set -l mountpoint

    # Determine if input is a mount path (/mnt/...) or a device path (/dev/...)
    if string match -q "/dev/*" -- $target
        set device $target
        set -l name (test -n "$argv[2]"; and echo $argv[2]; or echo "secure-drive")
        set mountpoint "/mnt/$name"
    else
        # Treat as absolute mount path
        set mountpoint (string trim -r -c '/' $target)
        set -l name (basename $mountpoint)
        set device (test -n "$argv[2]"; and echo $argv[2]; or echo "/dev/nvme1n1p1")
    end

    set -l name (basename $mountpoint)

    echo "Clearing any existing mounts or mappings for $device..."
    sudo umount $device 2>/dev/null
    sudo umount /dev/mapper/$name 2>/dev/null
    sudo cryptsetup close $name 2>/dev/null

    echo "Unlocking $device as $name..."
    sudo cryptsetup open $device $name
    if test $status -ne 0
        return 1
    end

    sudo mkdir -p $mountpoint
    echo "Mounting to $mountpoint..."
    sudo mount /dev/mapper/$name $mountpoint
    
    echo "Done! Drive mounted at $mountpoint"
end

function luks-umount --description "Unmount and lock a LUKS2 drive using absolute path or target name"
    if test (count $argv) -lt 1
        # Default fallback if no arguments are passed
        set target "/mnt/secure-drive"
    else
        set target $argv[1]
    end

    set -l mountpoint
    set -l mapper_name

    if string match -q "/*" -- $target
        # Argument is an absolute path (e.g., /run/media/zaphiel/LUKS_PRIVATE or /mnt/secure-drive)
        # set mountpoint $target
        set mountpoint "/mnt/$name"

        # Extract mapper device associated with this mountpoint if it's currently mounted
        set -l dev_path (findmnt -n -o SOURCE $mountpoint 2>/dev/null)
        if test -n "$dev_path"
            set mapper_name (basename $dev_path)
        else
            set mapper_name (basename $mountpoint)
        end
    else
        # Argument is just a mapper name (e.g., "secure-drive")
        set mapper_name $target
        set mountpoint "/mnt/$mapper_name"
    end

    # Step 1: Unmount the filesystem (handles absolute paths directly)
    if findmnt $mountpoint >/dev/null 2>&1
        echo "Unmounting $mountpoint..."
        sudo umount $mountpoint
        if test $status -ne 0
            echo "Failed to unmount $mountpoint"
            return 1
        end
    else
        echo "No active mount found at $mountpoint (skipping unmount)..."
    end

    # Step 2: Close/lock the LUKS container
    if test -b "/dev/mapper/$mapper_name"
        echo "Closing LUKS container $mapper_name..."
        sudo cryptsetup close $mapper_name
        if test $status -eq 0
            echo "Drive securely locked and closed."
        else
            echo "Failed to close LUKS container $mapper_name."
            return 1
        end
    else
        echo "No active LUKS container found named /dev/mapper/$mapper_name."
    end
end

