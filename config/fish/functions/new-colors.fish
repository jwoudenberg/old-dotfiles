function new-colors --description 'Generate a new color scheme for the terminal' -a flag
    set location (location-hash)
    set colorscheme_dir "$HOME/.colorschemes"
    set scheme_path "$colorscheme_dir"/$location
    if not set -q flag
        set -l flag ''
    end

    # If the -f flag is set, bust the cache for the current location
    if test (string trim -- "$flag") = '-f'
        bust-cache $scheme_path
    end

    if not valid-colors $scheme_path
        bust-cache $scheme_path
    end

    # Shortcut if the location hash didn't change.
    # This keeps directory changes within a project snappy.
    if test $location = $LAST_LOCATION
        return
    end

    # Load a new color scheme if one doesn't exist for this location.
    if not test -e $scheme_path
        mkdir -p $colorscheme_dir
        cat (get-new-colors) >$scheme_path
    end

    # Set the colorscheme for this location.
    set-colors $scheme_path
    set -U LAST_LOCATION $location
end

function get-new-colors
    curl 'http://colormind.io/api/' --silent --data-binary '{"model":"ui"}' | jq '.result' | psub
end

function location-hash
    set root (git rev-parse --show-toplevel ^ /dev/null; or echo 'no-git-root')
    set branch (git rev-parse --abbrev-ref HEAD ^ /dev/null; or echo 'no-git-branch')
    # We want to be able to use the location hash as a file name, so escape it.
    # Fish offers no escaping rules for filenames, but those for vars are fairly
    # restrictive, so they will do.
    string escape --style var "$root:$branch"
end

function set-colors -a scheme
    if not valid-colors $scheme
        return
    end
    set foreground (array-to-hex (cat $scheme | jq '.[0]'))
    set light (array-to-hex (cat $scheme | jq '.[1]'))
    set main (array-to-hex (cat $scheme | jq '.[2]'))
    set dark (array-to-hex (cat $scheme | jq '.[3]'))
    set background (array-to-hex (cat $scheme | jq '.[4]'))

    set-color fg $foreground
    set-color bg $background
    set-color black $background
    set-color red $dark
    set-color green $main
    set-color yellow $light
    set-color blue $main
    set-color magenta $dark
    set-color cyan $light
    set-color white $foreground
    set-color br_black $background
    set-color br_red $dark
    set-color br_green $main
    set-color br_yellow $light
    set-color br_blue $main
    set-color br_magenta $dark
    set-color br_cyan $light
    set-color br_white $foreground
end

function set-color -a key value
    # This is an iterm2 specific escape code for setting terminal colors.
    # See: https://iterm2.com/documentation-escape-codes.html
    echo -en "\033]1337;SetColors=$key=$value\a"
end

function array-to-hex
    set r (echo "$argv" | jq '.[0]')
    set g (echo "$argv" | jq '.[1]')
    set b (echo "$argv" | jq '.[2]')
    printf "%x%x%x" $r $g $b
end

function valid-colors -a scheme_path
    # A smoke test to see we got back the expected format.
    if not test -f $scheme_path
        return 1
    end
    set test_color (cat $scheme_path | jq '.[0][0]')
    if test -z "$test_color"
        return 1
    end
end

function bust-cache -a scheme_path
    set -U LAST_LOCATION ''
    rm -f $scheme_path
end
