#!/usr/bin/env fish

function -VS aws_list_users.list
  set user_list (aws --profile $argv[1] iam list-users)
  echo $user_list | jq -r '.Users[] | "User: " + .UserName'
  set -e argv
end
