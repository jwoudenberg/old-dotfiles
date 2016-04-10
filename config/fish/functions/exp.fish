function exp --description 'Create a quick temporary directory'
    set path ~/tmp/experiments/$argv[1]
    mkdir -p $path
    cd $path
end
