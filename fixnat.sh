#!/usr/bin/env bash
ifconfig | awk '
    BEGIN {
        tmpIF=theIF=""
        tmpBridge=""
        tmpFile="/tmp/pfToToast"
        getCmd="sudo pfctl -a com.apple.internet-sharing/shared_v4 -s nat 2>/dev/null"
        firstCmd=getCmd " > " tmpFile
        system( firstCmd )
    }
    /^u/ {
            tmpIF=$1
            next
        }
    /inet.*-->/ {
            if (tmpIF!="")
                theIF=substr(tmpIF,1,index(tmpIF, ":")-1)
        }
    /bridge.*:/ {
            tmpBridge=substr($1,1,index($1, ":")-1)
        }
    $1 == "inet" && tmpBridge != "" {
        theIP=$2
        }
    END {
            printf "nat on %s inet from %s/24 to any -> (%s) extfilter ei", theIF, theIP, theIF >> tmpFile
            lastCmd="sudo pfctl -a com.apple.internet-sharing/shared_v4 -N -f " tmpFile " 2> /dev/null"
            system( lastCmd )
            system( getCmd )
        }
'

