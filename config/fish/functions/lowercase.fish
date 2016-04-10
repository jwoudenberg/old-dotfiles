function lowercase
	for file in $argv
mv $file (echo $file | tr '[A-Z]' '[a-z]')
end
end
