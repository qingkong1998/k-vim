#!/bin/bash
VIMHOME=~/.vim
# 回到家目录
cd ~
# 安装oh-my-zsh
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd ~ && rm -rf  .vimrc .vimrc.bundles

# 下载.vim
# :git clone  git@github.com:qingkong1998/.vim.git && cd .vim
# 把.zshrc放到家目录
sudo cp -rf .zshrc ~
# 把.xvimrc放到家目录
sudo cp -rf  .xvimrc ~

# 开始vim的安装
# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

# parse arguments
function show_help
{
    echo "install.sh [option]
    --for-vim       Install configuration files for vim, default option
    --for-neovim    Install configuration files for neovim
    --for-all       Install configuration files for vim & neovim
    --help          Show help messages
For example:
    install.sh --for-vim
    install.sh --help"
}
FOR_VIM=true
FOR_NEOVIM=false
if [ "$1" != "" ]; then
    case $1 in
        --for-vim)
            FOR_VIM=true
            FOR_NEOVIM=false
            shift
            ;;
        --for-neovim)
            FOR_NEOVIM=true
            FOR_VIM=false
            shift
            ;;
        --for-all)
            FOR_VIM=true
            FOR_NEOVIM=true
            shift
            ;;
        *)
            show_help
            exit
            ;;
    esac
fi

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}


#echo "Step1: backing up current vim config", 这一步没有必要了
#today=`date +%Y%m%d` #if $FOR_VIM; then
#    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
#    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done
#fi
#if $FOR_NEOVIM; then
#    for i in $HOME/.config/nvim $HOME/.config/nvim/init.vim; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
#    for i in $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -L $i ] && unlink $i ; done
#fi

echo "Step2: setting up symlinks"
if $FOR_VIM; then
    lnif $CURRENT_DIR/vimrc $HOME/.vimrc
    lnif $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
    # lnif "$CURRENT_DIR/" "$HOME/.vim"
fi
if $FOR_NEOVIM; then
    lnif "$CURRENT_DIR/" "$HOME/.config/nvim"
    lnif $CURRENT_DIR/vimrc $CURRENT_DIR/init.vim
fi

echo "Step3: update/install plugins using Vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
if $FOR_VIM; then
    vim -u $HOME/.vimrc.bundles +PlugInstall! +PlugClean! +qall
else
    nvim -u $HOME/.vimrc.bundles +PlugInstall! +PlugClean! +qall
fi
export SHELL=$system_shell


echo "Step4: compile YouCompleteMe"
echo "It will take a long time, just be patient!"
echo "If error,you need to compile it yourself"
echo "cd $CURRENT_DIR/bundle/YouCompleteMe/ && python install.py --clang-completer"
cd $CURRENT_DIR/bundle/YouCompleteMe/
git submodule update --init --recursive
if [ `which clang` ]   # check system clang
then
    python install.py --clang-completer --system-libclang   # use system clang
else
    python install.py --clang-completer
fi

# 把家目录下的.zshrc,.vimrc,.xvimrc备份到.vim

sudo cp -rf ~/.zshrc  ~/.vim
sudo cp -rf ~/.xvimrc ~/.vim

# 对插件还原某些配置
sudo  cp -r ~/.vim/delimitMate.vim ~/.vim/bundle/delimitMate/plugin/
sudo  cp -r ~/.vim/NERD_commenter.vim ~/.vim/bundle/nerdcommenter/plugin/
sudo  cp -r ~/.vim/NERD_tree.vim ~/.vim/bundle/nerdtree/plugin/

# 把以上操作备份提交到github
git config --global user.email "qingkong1998@sina.cn" && git config --global user.name "qingkong1998"
cd ~/.vim
git add .
git commit -m"更新.vimrc, .xvimrc到.vim,并提交到github"

cd ~/.vim  && git pull git@github.com:qingkong1998/.vim.git  && git push git@github.com:qingkong1998/.vim.git

echo "Install Done!"

