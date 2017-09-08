# Aphrodite terminal theme

Minimalistic Aphrodite theme does not have any visual noise. Displays only the necessary information: current user, hostname, working directory, git branch if exists.

## Installation 

### Requirements
- Unix-like operating system
- wget and git installed

### Zsh
[**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh)
```sh
mkdir -p ~/.oh-my-zsh/custom/themes/
wget -xqO ~/.oh-my-zsh/custom/themes/aphrodite.zsh-theme https://git.io/v5ohc
sed -i.bak 's/^[[:space:]]*ZSH_THEME=.*/ZSH_THEME="aphrodite"/' ~/.zshrc
source ~/.zshrc 
```

### Bash

Bash support will be added later.

---
_Developed by [Sergei Kolesnikov](https://github.com/win0err)_
