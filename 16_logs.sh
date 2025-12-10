#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
FOLDER_PATH="/var/log/Scripting"
script_name=$(echo $0 | cut -d "." -f1)
log_file="$FOLDER_PATH/$script_name.log"
mkdir -p $FOLDER_PATH
echo "script execution started at $(date)" | tee -a $log_file
if [ $USER_ID -ne 0 ] ; then
    echo -e "$R ERROR : Please run this script with root access $N" | tee -a $log_file
    exit 1
fi

Validate(){
    if [ $1 -ne 0 ]; then 
    echo -e " ERROR : Installing $2 is $R failure $N" | tee -a $log_file
    exit 1
else
    echo -e "Installing $2 is $G SUCCESS $N" | tee -a $log_file
fi
}
dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]; then
    dnf install mysql-server -y &>> log_file
    Validate $? MYSQL
else 
    echo -e " MYSQL Already exists....$Y Skipping $N...." | tee -a $log_file
fi

dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$log_file
    Validate $? nginx
else 
    echo -e " nginx Already exists....$Y Skipping $N...." | tee -a $log_file
fi
