html() { cd ~/Sites/HTML/$1; }
_html() { _files -W ~/Sites/HTML -/; }
compdef _html html

sites() { cd ~/Sites/Ruby/$1; }
_sites() { _files -W ~/Sites/Ruby -/; }
compdef _sites sites

code() { cd ~/Code/$1; }
_code() { _files -W ~/Code -/; }
compdef _code code

# Creates a directory and then cd's in to it
mkcd() {
  mkdir $1;
  cd $1;
}

# Extracts an archive
extract () {
  if [ -z $1 ]
  then
    echo "No file specified."
  else
    if [ -f $1 ]; then
      case $1 in
        (*.tar.bz2) tar -jxvf $1 ;;
        (*.tar.gz) gunzip -c $1 | tar xopf - ;;
        (*.bz2) bzip2 -d $1 ;;
        (*.gz) gunzip -d $1 ;;
        (*.tar) tar -xvf $1 ;;
        (*.tgz) tar -zxvf $1 ;;
        (*.zip) unzip $1 ;;
        (*.Z) uncompress $1 ;;
        (*.rar) unrar x $1 ;;
        (*) echo "'$1' Error. Please go away" ;;
      esac
    else
      echo "'$1' is not a valid file"
    fi
  fi
}

tbrowser () {
  if (( $# == 0 )); then
    echo "No file(s) specified."
  else
    for i; do
      if [ ! -f $i ]; then
        echo "Could not find file $i"
        return 1;
      fi
    done
    root -l $* $HOME/.macros/newBrowser.C
  fi
}
_tbrowser() { _files -g "*.root"; }
compdef _tbrowser tbrowser

# Cleanly closes an application
# http://apple.stackexchange.com/a/5461
quit () {
  for app in $*; do
    osascript -e 'quit app "'$app'"'
  done
}
