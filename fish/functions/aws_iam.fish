#!/usr/bin/env fish

function aws_iam
  if test (count $argv) -ge 2
    set command $argv[1]
    set arguments $argv[2..-1]
  else if test (count $argv) = 1
    set command $argv[1]
    set arguments
  else
    set command help
    set arguments
  end
  switch $command
    case '-h' '--help' 'help'
      aws_iam.help
      set -e argv
      set -e command
      set -e arguments
    case '-p' '--profile'
      # set user_list (aws --profile $argv[2] iam list-users)
      # echo $user_list | jq -r '.Users[] | "User: " + .UserName'
      # set -e argv
      # set -e user_list
      aws_list.users $arguments
      set -e argv
    case '*'
      echo 'i dunno'
      set -e argv
      set -e command
      set -e arguments
    end
end
