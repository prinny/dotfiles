#!/usr/bin/env fish 

function aws_iam.help
  echo "Lists AWS users for a given profile in a friendly format.

  Usage: aws_iam [OPTIONS] [COMMANDS]

  Commands:
    help            Display this help text. Provide more info on commands.
    list            List IAM users, groups or roles.

  Options:
    -h, --help      Display this help text and exit
    -p, --profile   Sets the AWS profile to use"
end
