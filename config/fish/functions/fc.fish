function fc
  set tmpfile /tmp/fc.fish
  set lastcmd $history[1]
  echo $lastcmd > $tmpfile
  eval $EDITOR $tmpfile
  source $tmpfile
end
