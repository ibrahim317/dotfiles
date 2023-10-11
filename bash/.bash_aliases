# CONFIG FILES
alias conpo='nvim ~/.config/polybar/'
alias coni3='nvim ~/.config/i3/config'
alias conpi='nvim ~/.config/picom/picom.conf'
alias conala='nvim ~/.config/alacritty/alacritty.toml'
alias conn='nvim ~/.config/nvim'
# Short-naming
alias p='python3'
alias cl='clear'
alias n='nvim'
alias so='source ~/.bash_aliases'
alias i='sudo apt-get install'
alias rpk='sudo apt remove'
alias ll='ls -l --block-size=M'
#Others
alias gotop='~/Downloads/sources/gotop'
alias ma='nvim ~/.bash_aliases'
alias cdp1='cd $p1'
alias cdp2='cd $p2'
alias cdp3='cd $p3'
alias rpo=' killall -q polybar & $HOME/.config/polybar/launch.sh --material & alacritty & exit'
alias b1='open ~/Documents/stocks/filtered/one_class.csv'
alias b0='open ~/Documents/stocks/filtered/second_class.csv'
alias b2='open ~/Documents/stocks/filtered/third_class.csv'
export LANG=ar_EG.utf8
export gitPass=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 

#Functions
c() {
    filename=$(basename "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    gcc $(pwd)/"$1" -o "$filename"
}
cop() {
    filename=$(basename "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    g++ $(pwd)/"$1" -o "$filename"
}

copr() {
    filename=$(basename "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    g++ $(pwd)/"$1" -o "$filename"
    ./$filename
}
sepa () {
    if [ -z "$1" ]; then
        if [ -z "$2" ]; then
            ~/Documents/scripts/setPath.sh 1 $(pwd)
        else 
            ~/Documents/scripts/setPath.sh 1 $1
        fi    
    else 
         if [ -z "$2" ]; then
            ~/Documents/scripts/setPath.sh $1 $(pwd)
        else 
            ~/Documents/scripts/setPath.sh $1 $1
        fi     fi

    source ~/.bashrc  
}
#POE
pFunc2 () {
poe -t $TOKEN -m "$1" -c
}

ph () {
search=''
for word in "$@"
    do

        search="$search"+"$word"
    done
pFunc2 $search
}
