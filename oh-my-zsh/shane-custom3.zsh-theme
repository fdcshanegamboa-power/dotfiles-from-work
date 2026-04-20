setopt PROMPT_SUBST

_C_USR="#AFA9EC"
_C_DIR="#D4537E"
_C_GIT_CLEAN="#1D9E75"   # green - no changes
_C_GIT_DIRTY="#EF9F27"   # orange - staged/modified
_C_GIT_ERR="#E24B4A"     # red - reserved for exit code only
_C_GIT_PUSH="#AFA9EC"    # purple - unpushed commits
_C_BG="#191724"
_C_MUTED="#888780"

_shane_git() {
  local branch dirty untracked unpushed
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  dirty=$(git status --porcelain 2>/dev/null | grep -c "^[MADRCU]")
  untracked=$(git status --porcelain 2>/dev/null | grep -c "^??")
  unpushed=$(git log @{u}.. 2>/dev/null | grep -c "commit")

  if [[ $dirty -gt 0 || $untracked -gt 0 ]]; then
    echo " %F{$_C_BG}%K{$_C_GIT_DIRTY}  ${branch} ✗ %f%k%F{$_C_GIT_DIRTY}%f"
  elif [[ $unpushed -gt 0 ]]; then
    echo " %F{$_C_BG}%K{$_C_GIT_PUSH}  ${branch} ↑ %f%k%F{$_C_GIT_PUSH}%f"
  else
    echo " %F{$_C_BG}%K{$_C_GIT_CLEAN}  ${branch} ✔ %f%k%F{$_C_GIT_CLEAN}%f"
  fi
}

PROMPT='%F{$_C_MUTED}┌─%f%K{$_C_USR}%F{$_C_BG} %n@%m %f%k%F{$_C_USR} %K{$_C_DIR}%f %F{$_C_BG}%~ %f%k%F{$_C_DIR}${$(_shane_git)}
%F{$_C_MUTED}└─[%f%(?.%F{$_C_GIT_CLEAN}$%f.%F{$_C_GIT_ERR}$%f)%F{$_C_MUTED}]>%f '

RPROMPT=''