function inseup -d "Navigate to a parent directory with interactive fuzzy selection."

    set -l path_file (tempfile)

    ## Compose a list of directories starting with ourself and progressing
    ## up until we hit the root.
    set -l path $PWD
    while test "$path" != "/"
        set path (realpath "$path/..")
        echo "$path" >> $path_file
    end

    set path ''
    cat $path_file | eval $inse_selector | read path
    if test -n "$path"
        cd $path
    end

    rm $path_file
end
