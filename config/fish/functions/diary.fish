function diary
    set date (date "+%y-%m-%d")
    mkdir -p ~/docs/diary
    set entry ~/docs/diary/$date.md
    set title "# $date"
    if not test -e $entry
        echo "$title" > $entry
    end
    eval $EDITOR $entry
    set content (string trim (cat $entry))
    if test "$content" = "$title"
        echo "Deleting empty diary entry."
        rm $entry
    end
end
