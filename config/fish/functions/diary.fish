function diary
  set date (date --rfc-3339=date)
  set entry ~/docs/diary/$date
  if not test -e $entry
    echo "# $date" > $entry
  end
  eval $EDITOR $entry
end
