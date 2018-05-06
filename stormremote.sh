#!/bin/bash

case $2 in
'dev')
	SSHPARAM="~/.ssh/nat01_jmartini.pem -tt jmartini@nat.dev.hackettexchange.com"
	;;
'beta')
	SSHPARAM="~/.ssh/mirror_nat01_jmartini.pem -tt jmartini@nat.beta.hackettexchange.com "
	;;
'mirror')
	SSHPARAM="~/.ssh/mirror_nat01_jmartini.pem -tt jmartini@nat.mirror.hackettexchange.com"
	;;
esac
echo "$SSHPARAM"

case $1 in

'logs')
       	date
       	echo "Multitailing for enviroment [$2] and topology [$3] "
        multitail.sh $2 $3
        ;;
'stop')
       	date
       	echo "Stoping topology [$3] in enviroment [$2 ] "
	ssh -i $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh stop $3""
        ;;
'start')
       	date
       	echo "Starting topology [$3] in enviroment [$2 ] "
	ssh -i $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh start $3""
        ;;

'restartall')
       	date
       	echo "Restarting topology group [$3] in enviroment [$2 ] "
	ssh -i $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh restartgroup $3""
        ;;

*)
        echo "usage: $0 {logs|stop|start} {dev|beta|mirror|prod} {topology}"
        echo "usage: $0 restartall {dev|beta|mirror|prod} {topology group}"
        ;;

esac
