#!/bin/bash
configFile=$(ls --format single-column /usr/src/app/build/*.exe.config)
xmlstarlet sel -T -t -m /configuration/appSettings/add -s D:N:- "@key" -v "concat('[',@key,']',' = ',@value)" -n ${configFile}

