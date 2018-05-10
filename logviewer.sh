#!/bin/bash

if [ -n "$3" ]
then
	TAIL_PARAM="tail -f /u01/apache-storm/logs/workers-artifacts/*$3*Topology-*/6*/hackett_worker.log"
else
	TAIL_PARAM=""
fi
echo $TAIL_PARAM

case $1 in
'dev')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/nat01_jmartini.pem -tt jmartini@nat.dev.hackettexchange.com "ssh webadm@$2 $TAIL_PARAM"
        ;;
'beta')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/mirror_nat01_jmartini.pem -tt jmartini@nat.beta.hackettexchange.com "ssh webadm@$2 $TAIL_PARAM"
        ;;

'mirror')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/mirror_nat01_jmartini.pem -tt jmartini@nat.mirror.hackettexchange.com "ssh webadm@$2 $TAIL_PARAM"
        ;;

'prod')
       date
       echo "Tailing directory in [$1] , [$2] enviroment for pattern [$3]"
ssh -i ~/.ssh/prod_nat01_jmartini.pem -tt jmartini@nat.poweredbyhackett.com "ssh webadm@$2 $TAIL_PARAM"
        ;;
esac
