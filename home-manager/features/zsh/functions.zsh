# Vim / Neovim {{{
# See: https://github.com/fallwith/bootstrap/blob/0cef51d610f0118c879cc6e0d0de0d37bdab393c/dots/.zshrc#L329
function nvim_launch {
  declare -a args

  # if there were no arguments passed to this function...
  if [[ $# -eq 0 ]]; then
    # when called from a Neovim terminal session, use `nvr -o <file>` instead
    # of `nvim <file>` to open the file in a new split within the existing
    # session. `nvr` is the binary delivered by the neovim-remote Python egg.
    # `nvr -o`  requires an argument, so if there are no arguments present,
    # default to a single argument of '.' to have the Neovim split open a file
    # browser at PWD.
    if [[ -n $NVIM ]]; then args+=(.); fi
  else
    local path_arg="$1"               # grab the first argument
    shift                             # remove the first argument from $@
    elements=(${(s/:/)path_arg})      # split the first argument on ':'
    local file=${elements[@]:0:1}     # get the file value that precedes the ':'
    args+=($file)                     # add the file to our args array
    local line_num=${elements[@]:1:1} # get the line value that follows the ':'
    if (( line_num )); then           # if the line value is set
      args+=("+$line_num")            #   add the '+' prefixed line to the
    fi                                #   args array
    args+=($@)                        # add original args 1..-1 to to args array
  fi

  # if called within a Neovim session, use `nvr` and otherwise use `\nvim`
  if [[ -n $NVIM ]]; then
    nvr -o $args
  else
    \nvim $args
  fi
}

# }}}


# which process is using a port
function port {
  # alias port='sudo lsof -n -i | grep '
  p=$1
  if [ -z "$p" ]; then
    echo "port() - determine which process is using a port"
    echo "Usage: port <port number>"
    return
  fi
  lsof -i :$p
}



# Say you have a process who spawns processes, how much vmrss memories you using?
function vmrss() {
    if [ -z "$1" ]; then
      echo "vmrss() - determine how much resident virtual memory a process is using"
      echo "Usage: vmrss <pid>"
      return
    fi

    declare -a arr
    arr=("$1" 0)
    total=0

    while [[ ${#arr[@]} -gt 0 ]]; do

        # Get the last two elements
        local space=${arr[-1]}
        local pid=${arr[-2]}

        # Remove the last two elements
        arr=("${arr[@]:1:${#arr[@]}-2}")

        [[ -d "/proc/$pid" ]] || continue

        local mem=$(grep --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox VmRSS /proc/$pid/status \
          | grep $GREP_OPTS -o '[0-9]\+' \
          | awk '{print $1/1024}')
        # Add decimals to total
        total=$(echo $mem+$total | bc)

        # name of process
        local name=$(ps -p $pid -o comm=)

        printf "%${space}s%s($pid): $mem MB\n" '' "$name"

        # get children
        local children=$(pgrep -P $pid)

        # add children to array
        for child in $children; do
            arr+=("$child" $((space+2)))
        done
    done
    printf "Total: $total MB\n"
}

