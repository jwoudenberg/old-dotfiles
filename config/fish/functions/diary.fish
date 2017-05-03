function diary
    set date (date "+%y-%m-%d")
    mkdir -p ~/docs/diary
    set entry ~/docs/diary/$date.md
    if not test -e $entry
        echo "# $date" >$entry
    end
    eval $EDITOR $entry
end
