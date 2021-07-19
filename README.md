Postgres consistent point-in-time snap for KVM.
*******************************************************************************************

Package description
===========================================================================================
This script allows to get consistent database point-in-time backup using Qemu/KVM snapshot.


Requirements
-------------------------------------------------------------------------------------------
pgfreeze-qemu requires:

* qemu-guest-agent installed in VM with Postgre RDBMS




How to install
===========================================================================================

#. Copy script pgfreeze-qemu.sh to qemu guest agent fsfreeze-hook directory. By default, it should be /etc/qemu/fsfreeze-hook/. See 'man qemu-ga'
#. Enable fsfreeze-hook. Qemu guest agent should be running with option "-F".

