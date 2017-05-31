function fup -d "Navigate to a parent directory with interactive fuzzy selection."

    set -l path_file (tempfile)
    set -l path $PWD
    while test "$path" != "/"
        set path (realpath "$path/..")
        echo "$path" >> $path_file
    end

    cat $path_file | fzf | read path
    if test -n "$path"
        cd $path
    end

    rm $path_file
end
