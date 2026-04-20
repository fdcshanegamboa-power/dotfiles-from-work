# Author: Shane, Custom Design 1 <
# Colors
_C_USR="%F{#AFA9EC}"    # purple - username@host
_C_DIR="%F{#5DCAA5}"    # teal - directory
_C_GIT="%F{#EF9F27}"    # amber - git branch
_C_OK="%F{#5DCAA5}"     # teal - exit ok
_C_ERR="%F{#E24B4A}"    # red - exit error
_C_SEP="%F{#444441}"    # dark - separators
_C_R="%f"

# Powerline chars
_PL_R=$'\ue0b0'   # filled right arrow ❯
_PL_L=$'\ue0b1'   # thin right arrow

# Git info
_shane_git() {
  local branch dirty
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  dirty=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  if [[ $dirty -gt 0 ]]; then
    echo " ${_C_GIT}${_PL_L} ✗ ${branch}${_C_R}"
  else
    echo " ${_C_GIT}${_PL_L} ✔ ${branch}${_C_R}"
  fi
}

# Exit code indicator
_shane_exit() {
  echo "%(?.${_C_OK}❯${_C_R}.${_C_ERR}❯${_C_R})"
}

# Prompt
PROMPT='
${_C_SEP}[${_C_R}${_C_USR}%n@%m${_C_R}${_C_SEP}]${_C_R} ${_PL_R} ${_C_DIR}%~${_C_R}$(_shane_git)
$(_shane_exit) '

RPROMPT=''