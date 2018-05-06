#!/bin/bash

case $1 in

'dev')
       	date
       	echo "Multitailing for [$1] and topology [$2] "
       	x-terminal-emulator -e logviewer.sh dev supervisor01 $2
	x-terminal-emulator -e logviewer.sh dev supervisor02 $2
	x-terminal-emulator -e logviewer.sh dev supervisor03 $2
	x-terminal-emulator -e logviewer.sh dev supervisor04 $2
        ;;
'beta')
       	date
       	echo "Multitailing for [$1] and topology [$2] "
       	x-terminal-emulator -e logviewer.sh beta supervisor01 $2
	x-terminal-emulator -e logviewer.sh beta supervisor02 $2
	x-terminal-emulator -e logviewer.sh beta supervisor03 $2
        ;;

'mirror')
       	date
       	echo "Multitailing for [$1] and topology [$2] "
       	x-terminal-emulator -e logviewer.sh mirror supervisor01 $2
	x-terminal-emulator -e logviewer.sh mirror supervisor02 $2
	x-terminal-emulator -e logviewer.sh mirror supervisor03 $2
	x-terminal-emulator -e logviewer.sh mirror supervisor04 $2
        ;;

'prod')
       	date
       	echo "Multitailing for [$1] and topology [$2] "
       	x-terminal-emulator -e logviewer.sh prod supervisor01 $2
	x-terminal-emulator -e logviewer.sh prod supervisor02 $2
	x-terminal-emulator -e logviewer.sh prod supervisor03 $2
	x-terminal-emulator -e logviewer.sh prod supervisor04 $2
        ;;
*)
        echo "usage: $0 {dev|beta|mirror|prod} {pattern topology}"
        echo "Example: $0 dev stream"
        ;;

esac
