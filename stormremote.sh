#!/bin/bash

case $2 in
'dev')
	SSHPARAM="-i ~/.ssh/nat01_jmartini.pem -tt jmartini@nat.dev.hackettexchange.com"
	;;
'beta')
	SSHPARAM="-i ~/.ssh/mirror_nat01_jmartini.pem -tt jmartini@nat.beta.hackettexchange.com "
	;;
'mirror')
	SSHPARAM="-i ~/.ssh/mirror_nat01_jmartini.pem -tt jmartini@nat.mirror.hackettexchange.com"
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
	ssh $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh stop $3""
        ;;
'start')
       	date
       	echo "Starting topology [$3] in enviroment [$2 ] "
	ssh $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh start $3""
        ;;
'restartGroup')
       	date
       	echo "Restarting topology group [$3] in enviroment [$2 ] "
	ssh $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh restartgroup $3""
        ;;
'stopall')
       	date
       	echo "Stoping all topologies in enviroment [$2 ] "
	ssh $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh stopall""
        ;;
'startall')
       	date
       	echo "Starting all topologies in enviroment [$2 ] "
	ssh $SSHPARAM "ssh webadm@supervisor01 "/usr/local/bin/stormctl.sh startall""
        ;;
'ssh')
       	date
       	echo "Multi SSH for enviroment [$2]"
        multitail.sh $2
        ;;
*)
        echo "usage: $0 {logs|stop|start} {dev|beta|mirror|prod} {topology}"
        echo "usage: $0 restartGroup {dev|beta|mirror|prod} {topology group}"
        echo "usage: $0 {stopall|startall} {dev|beta|mirror|prod}"
        echo "usage: $0 {ssh} {dev|beta|mirror|prod}"
        ;;

esac
