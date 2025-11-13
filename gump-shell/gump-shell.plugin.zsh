PREFIX="shrimp "

check_prefix_and_accept() {
  local command_buffer="${BUFFER}"

  # Add exceptions for built-ins or other special commands
  if [[ "$command_buffer" == "exit" || "$command_buffer" == "logout" || "$command_buffer" == "" ]]; then
    zle .accept-line
    return
  fi

  # Check if the command starts with the required prefix
  if [[ "$command_buffer" == "$PREFIX"* ]]; then
    # Command has the prefix, remove it before execution
    BUFFER="${command_buffer#$PREFIX}"
    zle .accept-line
  else
    # Command does not have the prefix, show an error and do not execute
    echo "\n🦐 Come on Bubba... all commands must begin with shrimp 🦐"
    # Clear the buffer to prevent execution
    BUFFER=""
    zle .accept-line
  fi
}

# Bind the function to the 'accept-line'
zle -N accept-line check_prefix_and_accept
