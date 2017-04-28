function collapse-lines
    set text ""
    while read -l line
        if [ $line = "" ]
            echo -en $text
            set text "\n\n"
        else
            set text "$text$line "
        end
    end
    echo -en $text
end
