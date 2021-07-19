Tool to create consistent point-in-time backup for Postgres database in VM environment.
********************************************************************************

Package description
================================================================================
This script allows to get consistent database point-in-time backup using Qemu/KVM snapshot.


Requirements
--------------------------------------------------------------------------
pgfreeze-qemu requires:

* qemu-guest-agent installed in VM with Postgre RDBMS




How to install
================================================================================

# Copy script pgfreeze-qemu.sh to qemu guest agent fsfreeze-hook directory. By default, it should be /etc/qemu/fsfreeze-hook/. See 'man qemu-ga'
# Enable fsfreeze-hook. Qemu guest agent should be running with option "-F"
