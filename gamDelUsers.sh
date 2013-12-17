#!/bin/bash
gam_command() {
  python gam.py delete user "$username"
  }
IFS=,
while read username; do
  username=$username
  gam_command $username &
  while (( $(jobs | wc -l) >= 2 )); do
    sleep 0.1
    jobs > /dev/null
    done
done < userList-deletes.csv
wait
