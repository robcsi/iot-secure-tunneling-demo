#!/bin/bash
mydir="${0%/*}"
CONFIG_PATH=$mydir/../../config
IOT_RESOURCES_PATH=$CONFIG_PATH/iot/resources
LOCAL_PROXY_PATH=$mydir/../../build/ubuntu18

DAT=$(jq -r ".destinationAccessToken" $IOT_RESOURCES_PATH/tunnel.json)
REGION=$(aws configure get region)

$LOCAL_PROXY_PATH/localproxy -r $REGION -t $DAT -d ssh:22,http:80 -v 5
