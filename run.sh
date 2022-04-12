#!/bin/bash

if   [[ $# -eq 0 ]]; then
    robot -d ./tests/logs/ tests/features
elif [[ $# == 1 ]]; then
    robot -d ./tests/logs/ tests/features/${1}.robot
elif [[ $# == 2 ]]; then
    robot -d ./tests/logs/ -i ${2} tests/features/${1}.robot
else
    printf  '\nNo parameters -> run all robot files using tests / logs directory'
    printf  '\nOne  parameter  -> run specific "${PARAM1}".robot'
    printf  '\nTwo  parameters -> run specific "${PARAM1}".robot and specific Tag "${PARAM2}"'
fi