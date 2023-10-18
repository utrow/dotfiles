# dotfiles

## 🚀 Import this dotfiles

1. Clone repository

1. Run script
    ```
    bash bootstrap.sh
    ```


## 🛠 Manual Installations

### Applications

```shell
brew install git
brew install gh
brew install docker
brew install xcodesorg/made/xcodes
brew install --cask warp
brew install --cask visual-studio-code
brew install --cask rancher
```

- Chrome
- Homebrew
- Karabiner
- Raycat

### Tool version manager

```shell
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```
```shell
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin-add flutter
```
```shell
echo '\nlegacy_version_file = yes' >> $HOME/.asdfrc
```

### Font

- Source Han Mono

### Mac Preference

Remove all dock icons
```shell
defaults write com.apple.dock persistent-apps -array
killall Dock
```

- Disable/change the key binding for the Search man Page Index in Terminal feature:
  1. Open Apple menu | System Preferences | Keyboard | Shortcuts | Services
  1. Disable Search man Page Index in Terminal (or change the shortcut)

### Git Configure

- Generate SSH key
    - https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

#### Normal

```
git config --global user.name "Yutaro Obuchi"
git config --global user.email "example.com"
```

#### Separating work account

`~/.gitconfig`
```
[user]
        name = Yutaro Obuchi
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
        name = Yutaro Obuchi
        email = work@example.com
```

## 🗑 Unlinks

```
rm ~/.zshrc* ~/example.zshrc
```
