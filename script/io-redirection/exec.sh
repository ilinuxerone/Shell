#!/bin/bash

echo "Before \"exec 3>&1\", message in stdout"
exec 3>&1 # link 3 to stdout
echo "After  \"exec 3>&1\", and \"echo ... >&3\"" >&3
echo "And \"echo .... \", default stdout"

# redirects stdout to file
LOG="log.txt"
echo ; exec > "$LOG" # open $LOG as stdout
echo "This message will be redirected to file"
exec 1>&- # close stdout
echo "What about this message?"
exec 1>&3 # restore stdout

exec 3>&- # close 3 file-descriptor
echo "After \"3>&-\", try to \"echo ... >&3\""
echo "echo \"Something...\" >&3" >&3

echo -e "\nwill now try to read \"$LOG\""
exec 4<&0 # save stdin to 4
exec < "$LOG"
cat -n
exec 0<&4 # restore stdin
exec 4<&- # close 4

exit 0
