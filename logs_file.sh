FOLDER_PATH="/var/log/Scripting"
script_name=$(echo $0 | cut -d "." -f1)
file_name ="$FOLDER_PATH/$script_name.log"
mkdir -p $FOLDER_PATH
