####################################################
###################  PARAMETERS  ###################
####################################################
 
_pbl=~/.config/polybar/launch.sh
 
#####################################################
####################  FUNCTIONS  ####################
#####################################################
 
# ------- Get an External Binary's Path ------- #
getCmd ()
{
  _cmdPath=$( command -v "$1" )
  [ -n "$_cmdPath" ] && return 0 || return 1
}
 
# ------- Check if a Process is running or not ------- #
checkProcess ()
{
  pgrep -x "$1" > /dev/null 2>&1 && return 0 || return 1
}
 
# ------- Launch a {script,binary} as a process ------- #
launchProcess ()
{
  _cmd=''
  case $1 in
    */*)  [ -f "$1" ] && _cmd=$1 || return 1
          ;;
    *)    getCmd "$1" || return $?
          _cmd=$_cmdPath ; unset -v -- _cmdPath
          ;;
  esac
  [ -x "$_cmd" ] && "$_cmd" &
  unset -v -- _cmd
}
