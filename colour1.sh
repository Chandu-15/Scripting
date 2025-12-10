#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ] ; then
    echo -e "$R ERROR : Please run this script with root access $N"
    exit 1
fi

Validate(){
    if [ $1 -ne 0 ]; then 
    echo -e " ERROR : Installing $2 is $R failure $N"
    exit 1
else
    echo -e "Installing $2 is $G SUCCESS $N"
fi
}
dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql-server -y
    Validate $? MYSQL
else 
    echo -e " MYSQL Already exists....$Y Skipping $N...."


dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    Validate $? nginx
else 
    echo -e " nginx Already exists....$Y Skipping $N...."

