#!/usr/bin/env fish 

function aws_list_users.help
  echo "Lists AWS users for a given profile in a friendly format.

  Usage: aws_list_users [options]

  Options:
    -h, --help      Display this help text and exit
    -p, --profile   Sets the AWS profile to use"
end
