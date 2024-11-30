#!/usr/bin/env bash

mkdir -p $HOME/.dotbackup
mv $HOME/.config/vivaldi/Default/Preferences $HOME/.dotbackup
mv $HOME/.config/nvim $HOME/.dotbackup

ln -s $PWD/../.config/vivaldi/Default/Preferences $HOME/.config/vivaldi/Default/Preferences
ln -s $PWD/../.config/nvim/ $HOME/.config/nvim

#set -ue
#
#helpmsg() {
#  command echo "Usage: $0 [--help | -h]" 0>&2
#  command echo ""
#}
#
#install_nvim() {
#    sudo apt update
#    sudo apt install -y nodejs npm
#    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
#    chmod u+x nvim.appimage
#    ./nvim.appimage --appimage-extract
#    ./squashfs-root/AppRun --version
#    sudo mv squashfs-root /
#    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
#    nvim
#}
#
#link_to_homedir() {
#  command echo "backup old dotfiles..."
#  if [ ! -d "$HOME/.dotbackup" ];then
#    command echo "$HOME/.dotbackup not found. Auto Make it"
#    command mkdir "$HOME/.dotbackup"
#  fi
#
#  local script_dir="$(cd "$(dirname "$0")" && pwd -P)"
#  local dotdir=$(dirname ${script_dir})
#  if [[ "$HOME" != "$dotdir" ]];then
#    for f in $dotdir/.??*; do
#      [[ `basename $f` == ".git" ]] && continue
#
#      # .configディレクトリを個別に処理
#      if [[ $(basename $f) == ".config" ]]; then
#        for config_dir in $(find $f -mindepth 1 -maxdepth 1 -type d); do
#          # シンボリックリンク先のパスを作成
#          target="$HOME/${config_dir#$dotdir/}"
#          
#          # 既存のシンボリックリンクを削除
#          if [[ -L "$target" ]]; then
#            command rm -f "$target"
#          fi
#
#          # 既存のディレクトリやファイルをバックアップ
#          if [[ -e "$target" ]]; then
#            command mv "$target" "$HOME/.dotbackup"
#          fi
#
#          # ディレクトリへのシンボリックリンク作成
#          command ln -snf "$config_dir" "$target"
#        done
#        continue
#      fi
#
#      if [[ -L "$HOME/`basename $f`" ]];then
#        command rm -f "$HOME/`basename $f`"
#      fi
#      if [[ -e "$HOME/`basename $f`" ]];then
#        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
#      fi
#      command ln -snf $f $HOME
#    done
#  else
#    command echo "same install src dest"
#  fi
#}
#
#while [ $# -gt 0 ];do
#  case ${1} in
#    --debug|-d)
#      set -uex
#      ;;
#    --help|-h)
#      helpmsg
#      exit 1
#      ;;
#    *)
#      ;;
#  esac
#  shift
#done
#
##install_nvim
#link_to_homedir
#git config --global include.path "~/.gitconfig_shared"
#command echo -e "\e[1;36m Install completed!!!! \e[m"
