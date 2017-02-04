#!/bin/bash
configFile=$(ls --format single-column /usr/src/app/build/*.exe.config)
xmlstarlet ed --inplace -u "/configuration/appSettings/add[@key='UrlToCallEvery2Seconds']/@value" -v ${UrlToCallEvery2Seconds} $configFile
xmlstarlet ed --inplace -u "/configuration/appSettings/add[@key='SomeOtherUrl']/@value" -v ${SomeOtherUrl} $configFile

