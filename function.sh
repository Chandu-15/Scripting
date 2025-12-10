#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then
    echo "ERROR : Please run this script with root access"
    exit 1
fi

Validate(){
    if [ $1 -ne 0 ]; then 
    echo "ERROR : Installing $2 is failure"
    exit 1
else
    echo "Installing $2 is SUCCESS"
fi
}
dnf install mysql-server -y
Validate $? MYSQL

dnf install python3 -y
Validate $? Python

