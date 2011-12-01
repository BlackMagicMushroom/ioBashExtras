## - a function file for commands that surpass aliases and run from scripts
#

# -- include private function -- #
function include_private_functions {
   bash_private_functions_file="$HOME/.bash_functions_private"
   if [ -f "${bash_private_functions_file}" ];then
     source "${bash_private_functions_file}" 
     echo "Included: ${bash_private_functions_file}" 
   else
    echo "Private functions file not found"
   fi
}
function include_function_file {
   if [ -f "${1}" ];then
     source "${1}" 
   else
    echo "File not found: ${1}"
   fi

}
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_screen"
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_git"
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_mysql"
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_grep"
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_capistrano"
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_tar"
include_function_file "/$HOME/ioBashExtras/.io_bash_extras_vim"
include_private_functions
