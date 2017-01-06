set ELMVM_ROOT  ~/.elmvm
set BIN /usr/local/bin

function elmvm --description 'Manage multiple elm installations'

  set cmd $argv[1]
  if test (count $argv) -ge 2
    set version $argv[2]
  else
    set version NONE
  end

  switch $cmd
    case install
      elmvm-install $version
    case remove
      elmvm-remove $version
    case use
      elmvm-use $version
    case list
      ls $ELMVM_ROOT
    case '*'
      echo 'Supported commands: install, use, remove, list'
  end

end

function elmvm-install
  set version $argv[1]
  if test "$version" = NONE
    echo "Specify a version to install."
    return 1
  end
  mkdir -p $ELMVM_ROOT/$version
  cd $ELMVM_ROOT/$version
  npm install elm@$version elm-format-download
  ./node_modules/.bin/elm-format-download --elm-version $version --target $ELMVM_ROOT/$version/node_modules/.bin
  echo "Installed elm version $version."
  elmvm-use $version
  cd -
end

function elmvm-use
  set version $argv[1]
  if test "$version" = NONE
    echo "Specify a version to use"
    return 1
  end
  set EXEC_PATH $ELMVM_ROOT/$version/node_modules/.bin
  ln -sf $EXEC_PATH/elm $BIN/elm
  ln -sf $EXEC_PATH/elm-make $BIN/elm-make
  ln -sf $EXEC_PATH/elm-package $BIN/elm-package
  ln -sf $EXEC_PATH/elm-reactor $BIN/elm-reactor
  ln -sf $EXEC_PATH/elm-repl $BIN/elm-repl
  ln -sf $EXEC_PATH/elm-format $BIN/elm-format
  echo "Now using elm $version."
end

function elmvm-remove
  set version $argv[1]
  if test "$version" = NONE
    echo "Specify a version to remove."
    return 1
  end
  if not test -d $ELMVM_ROOT/$version
    echo "No elm version $version installed."
    return 1
  end
  rm -r $ELMVM_ROOT/$version
  echo "Removed elm version $version."
end
