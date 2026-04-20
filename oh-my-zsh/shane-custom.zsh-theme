# ~/.oh-my-zsh/custom/themes/shane.zsh-theme


## Author: Shane, Custom Design 2 <

# ~/.oh-my-zsh/custom/themes/shane.zsh-theme

setopt PROMPT_SUBST

_C_USR="%F{#AFA9EC}"
_C_DIR="%F{#5DCAA5}"
_C_GIT="%F{#EF9F27}"
_C_OK="%F{#5DCAA5}"
_C_ERR="%F{#E24B4A}"
_C_BRK="%F{#888780}"
_C_R="%f"

_shane_git() {
  local branch dirty
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  dirty=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  if [[ $dirty -gt 0 ]]; then
    echo " %F{#888780}-[%f%F{#E24B4A}✗ ${branch}%f%F{#888780}]%f"
  else
    echo " %F{#888780}-[%f%F{#EF9F27}✔ ${branch}%f%F{#888780}]%f"
  fi
}

PROMPT='%F{#888780}┌─[%f%F{#AFA9EC}%n@%m%f%F{#888780}]-[%f%F{#5DCAA5}%~%f%F{#888780}]%f$(_shane_git)
%F{#888780}└─[%f%(?.%F{#5DCAA5}$%f.%F{#E24B4A}$%f)%F{#888780}]>%f '

RPROMPT=''