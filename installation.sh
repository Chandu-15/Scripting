#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then
    echo "ERROR : Please run this script with root access"
fi

dnf install mysql-server -y
if [ $? -ne 0 ]; then 
    echo "ERROR : Installing mysql is failure"
else
    echo "Installing mysql is SUCCESS"
fi
dnf install python3 -y
if [ $? -ne 0 ]; then 
    echo "ERROR : Installing python is failure"
else
    echo "Installing python is SUCCESS"
fi