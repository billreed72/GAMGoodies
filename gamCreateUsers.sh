#!/bin/bash
gam_command() {
  python gam.py create user "$email" firstname "$firstname" lastname "$lastname" password "$password" org "sub Org/sub2 Org/sub3 Org"
  }
IFS=,
while read email firstname lastname password; do
  email=$email
  firstname=$firstname
  lastname=$lastname
  password=$password
  gam_command $email $firstname $lastname $password &
  while (( $(jobs | wc -l) >= 2 )); do
    sleep 0.1
    jobs > /dev/null
    done
done < userList.csv
wait
