function __add_mark -a bookmark_file
    set -e argv[1]
    echo "$PWD# $argv "(date) >> $bookmark_file
end

function __get_marks_for_selection -a bookmark_file
    for mark in (cat $bookmark_file)
        set -l elements (string split "#" $mark)
        set_color normal
        echo -n $elements[1]
        set_color blue
        echo " #"$elements[2]
    end
end

function __get_mark -a bookmark_file
    __get_marks_for_selection $bookmark_file | eval $inse_selector | read bookmark
    if test -n "$bookmark"
        set -l bookmark_dir (echo $bookmark | sed -e 's/\s*#.*//g')
        echo $bookmark_dir
    end
end


function insemark -d "Create/navigate to bookmarked directories with interactive fuzzy selection."

    set -l bookmark_file "$HOME/.inse.bookmarks"

    for arg in $argv
        set -e argv[1]

        switch $arg
            case '--set'
                __add_mark $bookmark_file $argv
                return
        end
    end

    if test -e $bookmark_file
        __get_mark $bookmark_file | read bookmark_dir
        if test -n "$bookmark_dir"
           cd $bookmark_dir
        end
    else
        echo "No bookmarks stored."
    end
end
