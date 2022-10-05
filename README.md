# dotfiles

## 🚀 Import this dotfiles

1. Clone repository

1. Run script
    ```
    bash bootstrap.sh
    ```


## 🛠 Manual Installations

### Applications

- Chrome
- Homebrew
- Karabiner
- iTerm
    - import profile and color scheme from ./iterm2
- VSCode
- Docker

### Font

- Source Han Mono



### Mac Preference

- Disable/change the key binding for the Search man Page Index in Terminal feature:
  1. Open Apple menu | System Preferences | Keyboard | Shortcuts | Services
  1. Disable Search man Page Index in Terminal (or change the shortcut)

### Git Configure

- Generate SSH key
    - https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

#### Normal

```
git config --global user.name "Yutaro Ohbuchi"
git config --global user.email "example.com"
```

#### Separating work account

`~/.gitconfig`
```
[user]
        name = Yutaro Ohbuchi
        email = example.com

[includeIf "gitdir:~/Projects/work/"]
        path = ~/.work.gitconfig
[core]
        autocrlf = input
[init]
        defaultBranch = main
```

`~/.work.gitconfig`
```
[user]
        name = Yutaro Ohbuchi
        email = work@example.com
```

## 🗑 Unlinks

```
rm ~/.zshrc* ~/example.zshrc
```
