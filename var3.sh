#!/bin/bash
echo "please allow all the arguments passed to this script : $@"
echo "please allow all the arguments passed to this script : $*"
echo "Current working directory :$PWD"
echo "Home directory :$HOME"
echo "Script name : $0"
echo "PID for current script : $$"
sleep 15&
echo "PID for last executed script :$!"