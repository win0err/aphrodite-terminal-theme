# Aphrodite Terminal Theme

A minimalistic terminal theme (prompt) that does not have any visual noise. Displays only the necessary information: virtual env, current user, hostname, working directory, and git branch if exists. Looks great both with dark and white terminals. Bash, fish and zsh are supported.

![Aphrodite Terminal Theme](./assets/screenshot.png)

## Installation

### **zsh** — the Z shell

#### If you're using Oh My Zsh

1. Download theme: \
   `git clone --quiet https://github.com/win0err/aphrodite-terminal-theme ~/.oh-my-zsh/custom/themes/aphrodite`
2. Select theme using `omz`: \
   `omz theme set aphrodite/aphrodite`
3. Reload current zsh session: `omz reload`

#### Without Oh My Zsh

1. Download theme to the themes directory, for example, `~/.zsh/themes`: \
   `git clone --quiet https://github.com/win0err/aphrodite-terminal-theme ~/.zsh/themes/aphrodite`
2. Select theme by sourcing it in `.zshrc`: \
   `echo 'source ~/.zsh/themes/aphrodite/aphrodite.zsh-theme' >> ~/.zshrc`
3. Load theme immediately in current session: \
   `source ~/.zsh/themes/aphrodite/aphrodite.zsh-theme`

### **fish** — the friendly interactive shell

1. Backup existing `fish_prompt.fish` file: \
   `cp ~/.config/fish/functions/fish_prompt.fish{,.bak}`
2. Download prompt:
   ```sh
   wget https://raw.githubusercontent.com/win0err/aphrodite-terminal-theme/master/fish_prompt.fish \
	    -O ~/.config/fish/functions/fish_prompt.fish
   ```

> **Author's note:** It looks even cooler when: \
> a) theme is set to `None`: `fish_config theme save None`, \
> b) autosuggestions are disabled: `echo 'set -g fish_autosuggestion_enabled 0' >> ~/.config/fish/config.fish`.

### bash — GNU Bourne-Again SHell

1. Download theme to the themes directory, for example, `~/.bash/themes`: \
   `git clone --quiet https://github.com/win0err/aphrodite-terminal-theme ~/.bash/themes/aphrodite`
2. Select theme by sourcing it in `.bashrc`: \
   `echo 'source ~/.bash/themes/aphrodite/aphrodite.theme.sh' >> ~/.bashrc`
3. Load theme immediately in current session: \
   `source ~/.bash/themes/aphrodite/aphrodite.theme.sh`


---
_Developed by [Sergei Kolesnikov](https://github.com/win0err)_
