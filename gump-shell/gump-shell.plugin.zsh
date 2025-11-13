PREFIX="shrimp "

check_prefix_and_accept() {
  local command_buffer="${BUFFER}"

  # Check if the command starts with the required "shrimp" prefix
  if [[ "$command_buffer" == "$PREFIX"* ]]; then
    # Command has the prefix, remove it before execution
    BUFFER="${command_buffer#$PREFIX}"
    zle .accept-line
  else
    # Command does not have the prefix, error and stop execution
    echo "\n🦐 Come on Bubba... all commands must begin with shrimp 🦐"
    # Clear the buffer to prevent execution
    BUFFER=""
    zle .accept-line
  fi
}

# Bind the function to the 'accept-line'
zle -N accept-line check_prefix_and_accept
