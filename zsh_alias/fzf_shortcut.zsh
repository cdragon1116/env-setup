mk() {
  # List all make targets
  local MAKE_TARGETS
  MAKE_TARGETS=$(make -pRrq -f Makefile | awk -F: '/^[a-zA-Z0-9_.-]+:/{print $1}' | sort -u)

  # Use fzf to let the user select a target
  local SELECTED_TARGET
  SELECTED_TARGET=$(echo "$MAKE_TARGETS" | fzf --height 40% --ansi --tac --reverse)

  # If the user didn't select anything, return
  if [ -z "$SELECTED_TARGET" ]; then
    echo "No target selected."
    return 1
  fi

      echo -n "Are you sure you want to run 'make $SELECTED_TARGET'? (y/N): " && read ans && [ "${ans:-N}" = "y"  ] || { echo "Command not executed."; return 1;  }

  make "$SELECTED_TARGET"
}
