#!/usr/bin/env fish

function aws_list.users
  set user_list (aws --profile $argv[1] iam list-users)
  echo $user_list | jq -r '.Users[] | "User: " + .UserName'
  set -e argv
end

function aws_list.groups
  echo "placeholder group list"
end
