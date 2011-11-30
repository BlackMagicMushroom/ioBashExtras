#!/bin/bash

if [ -z "${1}" ]; then
  echo "Usage: ${0} bashrc_file"
  exit 1
else
  bashrcfile="${1}"
fi

sourceForBashFunctions=$( cat <<SOURCEFUNCTION

# Function definitions
# add functions that can be run at the command line in place of aliases and scripts
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
SOURCEFUNCTION
)

if [ -f "bash_functions" ]; then
  # -- symlink the file to $HOME/.bash_functions
  echo -e "Adding symlink to bash_functions file in the home directory"
  # -- if bash_functions exists rename it to 
  # .bash_functions_private (provided the file 
  # doesn't already exist
  if [[ -f "$HOME/.bash_functions" && ! -f "$HOME/.bash_functions_private" ]]; then
      mv $HOME/.bash_functions $HOME/.bash_functions_private
  fi
      ln -sfb "$( pwd )/bash_functions" $HOME/.bash_functions
fi

if [ -f "$bashrcfile" ]; then
  # -- append functions file's sourcing to .bashrc for loading on startup for most systems
  echo "Appending function to the bashrc file: $bashrcfile"
  echo "${sourceForBashFunctions}" >> $bashrcfile
  echo -e "Complete\nSourcing $bashrcfile"
  source $bashrcfile
else
  echo "update your .bashrc file with the following"
  echo -e "$sourceForBashFunctions"
fi
