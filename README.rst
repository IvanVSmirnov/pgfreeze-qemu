Postgres consistent point-in-time snapshot for KVM
*******************************************************************************************

Package description
===========================================================================================
This script allows to get consistent database point-in-time backup using Qemu/KVM snapshot.


Requirements
-------------------------------------------------------------------------------------------
pgfreeze-qemu requires:

* qemu-guest-agent in VM with Postgres RDBMS


How to install
===========================================================================================

1. Copy script pgfreeze-qemu.sh to qemu guest agent fsfreeze-hook directory. By default, it should be /etc/qemu/fsfreeze-hook.d/. See 'man qemu-ga'

.. code:: bash

	$ cp pgfreeze-qemu.sh /etc/qemu/fsfreeze-hook.d/


2. Copy config file to /etc/default/

.. code:: bash

 	$ cp pgfreeze-qemu.example /etc/default/pgfreeze-qemu

3. Enable fsfreeze-hook. Qemu guest agent should be running with option "-F".
