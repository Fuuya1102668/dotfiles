# dotfiles
dotfiles

### nvimの設定
```
$ ln -s $PWD/.config/nvim/ $HOME/.config/nvim
$ ln -s $PWD/.config/mcphub/ $HOME/.config/mcphub/
```

### zshの設定

#### oh-my-zshのinstall
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Powerlevel10kのinstall
```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

#### 設定ファイルのコピー
```
$ mv ~/.zshrc ~/.zshrc.backup
$ ln -s $PWD/.zshrc ~/
$ ln -s $PWD/.p10k.zsh ~/
$ cd 
$ source ~/.zshrc
```
##### もしかしたらフォントを入れなきゃいけないかも
```
$ curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
```

$ cp fuya.zsh-theme ~/.oh-my-zsh/themes/

### シンボリックリンクを通してコマンドを使う
```
$ sudo ln -si ~/dotfiles/.bin/fmktex /usr/local/bin
$ sudo ln -si ~/dotfiles/.bin/fmkmd /usr/local/bin
```
