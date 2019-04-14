# Aphrodite Terminal Theme

Minimalistic Aphrodite theme does not have any visual noise. Displays only the necessary information: current user, hostname, working directory, git branch if exists.
Looks great both with dark and white terminals.

![Aphrodite Terminal Theme](https://user-images.githubusercontent.com/11278181/56094804-29972500-5edf-11e9-90a4-ffafdc58d3d7.png)

## Installation 

### Requirements
- UNIX-like OS (Linux, macOS, BSD)
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
