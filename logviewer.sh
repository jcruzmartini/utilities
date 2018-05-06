#!/bin/bash

case $1 in
'dev')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/nat01_jmartini.pem -tt jmartini@nat.dev.hackettexchange.com "ssh webadm@$2 "tail -f /u01/apache-storm/logs/workers-artifacts/*$3*Topology-*/6*/hackett_worker.log""
        ;;
'beta')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/mirror_nat01_jmartini.pem jmartini@nat.beta.hackettexchange.com "ssh webadm@$2 "tail -f /u01/apache-storm/logs/workers-artifacts/*$3*Topology-*/6*/hackett_worker.log""
        ;;

'mirror')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/mirror_nat01_jmartini.pem jmartini@nat.beta.hackettexchange.com "ssh webadm@$2 "tail -f /u01/apache-storm/logs/workers-artifacts/*$3*Topology-*/6*/hackett_worker.log""
        ;;

'prod')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/prod_nat01_jmartini.pem jmartini@nat.poweredbyhackett.com "ssh webadm@$2 "tail -f /u01/apache-storm/logs/workers-artifacts/*$3*Topology-*/6*/hackett_worker.log""
        ;;
esac


