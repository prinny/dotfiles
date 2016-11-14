#!/usr/bin/env fish

# Allow access to calling function variables with -S
function -S aws_list.users
  set user_list (aws --profile $profile iam list-users)
  echo $user_list | jq -r '.Users[] | "User: " + .UserName'
  set -e argv
end
