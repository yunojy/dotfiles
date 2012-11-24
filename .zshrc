#!/bin/zsh
#==============================================
# thx!
# 漢のzsh:
#  http://news.mynavi.jp/column/zsh/
# idiom:
#  http://gihyo.jp/dev/serial/01/zsh-book/0002?page=2
#==============================================

path=($path \
      /share/MD0_DATA/yuji/bin)

export LANG=ja_JP.UTF-8

setopt auto_resume # サスペンド中のプロセスと同じコマンドが実行されたらリジューム(C-z <-> fg)
setopt correct # 誤ったコマンド入力時に、"もしかして"表示

limit coredumpsize 102400 # コアダンプサイズ制限

setopt prompt_subst # 配色ON

setopt nolistbeep # 補完候補表示時などに鳴るビープ音OFF

###############################################
## プロンプト
PROMPT="%m@%F{magenta}%n%f %% " # 左プロンプト
RPROMPT="%F{yellow}[%~]%f"      # 右プロンプト
PROMPT2="%/%% "                 # 複数行入力時プロンプト

autoload -U colors; colors # プロンプトのカラー表示ON

###############################################
## 補完設定

autoload -U compinit; compinit # zshの補完強化機能ON

setopt auto_cd           # cd 省略可
setopt autopushd         # popd で cd 前の場所に戻る
setopt pushd_ignore_dups # cd の重複する移動履歴を保存しない


setopt auto_list        # 補完候補を一覧表示
setopt auto_menu        # 補完候補切り替え(Tab、C-I)
setopt list_types       # 補完候補一覧表示時に、ファイル種類を記号で表示
setopt print_eightbit   # 日本語名の候補候補も表示
setopt list_packed      # 補完候補一覧の表示をツメツメで表示
setopt auto_param_slash # ディレクトリ補完時に / を末尾に付与
setopt auto_param_keys  # 対応する括弧を補完

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大小文字を区別しない
zstyle ':completion:*' menu select=1 # 補完候補選択を矢印キーでも可能へ


###############################################
## コマンド履歴
HISFILE=~/.zsh-history   # 保存先
HISTSIZE=1000000         # メモリ上に展開する履歴数
SAVEHIST=1000000         # 保存する履歴数

setopt hist_ignore_dups  # 直前と同じコマンドは記憶しない
setopt extended_history  # zshの開始/終了時刻を.zsh-historyに書き込む
setopt hist_verify       # 履歴から選択で直接実行しない
setopt share_history     # 複数同時起動中のシェルの履歴を共有

# 履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

###############################################
## KeyBindings

bindkey -e # emacsライクなキーバインドON

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # Ctrl+wで､直前の/までを削除する

## alias
alias ls='ls -A'
alias ll='ls -lA'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias e='emacs'
alias ps='ps -fU`whoami` --forest'
alias grep='grep -nH -r'

###############################################


: << '#_comment_out'
メモ
・shファイルは「: << '#_comment_out'」と「#_comment_out」で囲えば(結果的に)範囲コメントアウト。
・mv ./*.txt~kurorekishi.txt ./new/ 除外指定。除外対象の頭に~を指定(kurorekishi.txt 以外の全txt を new 以下へ移動)
・gzcat ./app-1.0-patch<1-10>.gz | patch -p 範囲のワイルドカード指定:<from-to>
・touch dummy{001..999}.txt 範囲のワイルドカード指定:{from..to}(dummy001.txt dummy002.txt .. dummy999.txt)


#_comment_out
