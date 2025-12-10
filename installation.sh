#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then
    echo "ERROR : Please run this script with root access"
    exit 1
fi

dnf install mysql-server -y
if [ $? -ne 0 ]; then 
    echo "ERROR : Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is SUCCESS"
fi
dnf install python3 -y
if [ $? -ne 0 ]; then 
    echo "ERROR : Installing python is failure"
    exit 1
else
    echo "Installing python is SUCCESS"
fi