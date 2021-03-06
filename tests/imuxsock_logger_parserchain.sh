#!/bin/bash
# Copyright (C) 2015-03-04 by rainer gerhards, released under ASL 2.0
echo ======================================================================
echo \[imuxsock_logger_parserchain.sh\]: test imuxsock

uname
if [ `uname` = "SunOS" ] ; then
   echo "Solaris: FIX ME LOGGER"
   exit 77
fi

. $srcdir/diag.sh init
. $srcdir/diag.sh startup imuxsock_logger_parserchain.conf
logger -d --rfc3164 -u testbench_socket test
if [ ! $? -eq 0 ]; then
logger -d -u testbench_socket test
fi;
# the sleep below is needed to prevent too-early termination of rsyslogd
./msleep 100
. $srcdir/diag.sh shutdown-when-empty
. $srcdir/diag.sh wait-shutdown
cmp rsyslog.out.log $srcdir/resultdata/imuxsock_logger.log
if [ ! $? -eq 0 ]; then
  echo "imuxsock_logger_parserchain.sh failed"
  echo contents of rsyslog.out.log:
  echo \"`cat rsyslog.out.log`\"
  exit 1
fi;
. $srcdir/diag.sh exit
