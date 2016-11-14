#!/usr/bin/env fish

function aws_iam
  # Sets profile to default
  set profile default
  set i 1

  # Loop through arguments to see if profile is set.
  for arg in $argv
    if test $arg = '-p'; or test $arg = '--profile'
      # Set profile to new value
      set profile $argv[(math $i + 1)]
      # Remove profile data from arguments
      set -e argv[$i]
      set -e argv[$i]
    # Go again. Increment counter by 1.
    else
      set i (math $i + 1)
      continue
    end
  end

  # Count arguments to determine next path.
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

  # Select command.
  switch $command
    case '-h' '--help' 'help'
      aws_iam.help $arguments
    case 'list'
      aws_list.users $profile
    case '*'
      echo -e (set_color red)'Invalid option.\n'(set_color normal)
      set -e argv
      aws_iam.help
  end
end
