function fbmk -d "Create/navigate to bookmarked directories with interactive fuzzy selection."

    set -l bookmark_file "$HOME/.fuzzi.bookmarks"

    for arg in $argv
        set -e argv[1]

        switch $arg
            case '--set'
                echo "$PWD #$argv "(date) >> $bookmark_file
                return
        end
    end

    if test -e $bookmark_file
        cat $bookmark_file | eval $fuzzi_selector | read bookmark
        if test -n "$bookmark"
           set -l bookmark_dir (echo $bookmark | sed -e 's/\s*#.*//g')
           cd $bookmark_dir
        end
    end
end
