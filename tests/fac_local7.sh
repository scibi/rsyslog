# added 2014-09-24 by Rgerhards

# This file is part of the rsyslog project, released under ASL 2.0
. $srcdir/diag.sh init
. $srcdir/diag.sh startup fac_local7.conf
. $srcdir/diag.sh tcpflood -m1000 -P 185
. $srcdir/diag.sh shutdown-when-empty # shut down rsyslogd when done processing messages
. $srcdir/diag.sh wait-shutdown       # and wait for it to terminate
. $srcdir/diag.sh seq-check 0 999 
. $srcdir/diag.sh exit
