#!/bin/bash

LOG_FILE="igor_blazhko_system_report.log"

{
    echo "=========================================="
    echo "System Monitoring Report"
    echo "Student: Igor Blazhko"
    echo "Date and time: $(date)"
    echo "Current user: $(whoami)"
    echo "=========================================="
    echo ""
    echo "--- Operating System and Kernel ---"
    uname -a
    echo ""
    echo "--- CPU Information ---"
    lscpu | grep -E "Model name|CPU\(s\)|Architecture"
    echo ""
    echo "--- Memory Information ---"
    free -h
    echo ""
    echo "--- Disk Usage ---"
    df -h
    echo ""
    echo "--- Available Disk Space (root /) ---"
    df -h / | tail -1 | awk '{print "Available: " $4}'
    echo "=========================================="
} | tee -a "$LOG_FILE"chmod 744 igor_blazhko_system_report.sh
==========================================
System Monitoring Report
Student: Igor Blazhko
Date and time: Fri Oct 30 02:38:43 +05 2026
Current user: igor
==========================================

--- Operating System and Kernel ---
Linux lorderon 6.6.87.2-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Thu Jun  5 18:30:46 UTC 2025 x86_64 GNU/Linux

--- CPU Information ---
Architecture:                         x86_64
CPU(s):                               8
On-line CPU(s) list:                  0-7
Model name:                           13th Gen Intel(R) Core(TM) i3-1315U
NUMA node0 CPU(s):                    0-7

--- Memory Information ---
               total        used        free      shared  buff/cache   available
Mem:           3.7Gi       421Mi       3.2Gi       3.5Mi       166Mi       3.3Gi
Swap:          1.0Gi          0B       1.0Gi

--- Disk Usage ---
Filesystem      Size  Used Avail Use% Mounted on
none            1.9G     0  1.9G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
none            1.9G  4.0K  1.9G   1% /mnt/wsl
drivers         237G  226G   11G  96% /usr/lib/wsl/drivers
/dev/sdd       1007G  1.6G  955G   1% /
none            1.9G   76K  1.9G   1% /mnt/wslg
none            1.9G     0  1.9G   0% /usr/lib/wsl/lib
rootfs          1.9G  2.7M  1.9G   1% /init
none            1.9G  520K  1.9G   1% /run
none            1.9G     0  1.9G   0% /run/lock
none            1.9G     0  1.9G   0% /run/shm
none            1.9G   76K  1.9G   1% /mnt/wslg/versions.txt
none            1.9G   76K  1.9G   1% /mnt/wslg/doc
C:\             237G  226G   11G  96% /mnt/c
tmpfs           1.9G     0  1.9G   0% /tmp
none            1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
none            1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
none            1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
none            1.0M     0  1.0M   0% /run/credentials/console-getty.service
tmpfs           378M   12K  378M   1% /run/user/1000

--- Available Disk Space (root /) ---
Available: 955G
==========================================
