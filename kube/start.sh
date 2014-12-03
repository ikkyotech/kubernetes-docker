#!/bin/bash

if [ $1 == '--help' ]; then
    echo """
Usage: kube <ctl|cfg|-down|-env|-push|-up|-util|-cluster> [SCRIPT QUERY]

Note: configurations files are located in /cfg/, therefore you need to create as
follow:

    $ kube cfg -c /cfg/file.json create pods
    """
else
    # Start script kube.. with other parameters
    cluster/kube${1}.sh ${@:2}
fi


