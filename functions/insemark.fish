function __add_mark -a bookmark_file
    set -e argv[1]
    echo "$PWD# $argv "(date) >> $bookmark_file
end

function __get_marks_for_selection -a bookmark_file
    for mark in (cat $bookmark_file)
        set -l elements (string split "#" $mark)
        if test -n "$inse_colourised"
            set_color normal
        end
        echo -n $elements[1]
        if test -n "$inse_colourised"
            set_color blue
        end
        echo "  #"$elements[2]
        if test -n "$inse_colourised"
            set_color normal
        end
    end
end

function __get_mark -a bookmark_file -a query
    __get_marks_for_selection $bookmark_file | eval $inse_selector $query | read bookmark
    if test -n "$bookmark"
        set -l bookmark_dir (echo $bookmark | sed -e 's/\s*#.*//g')
        echo $bookmark_dir
    end
end


function insemark -d "Create/navigate to bookmarked directories with interactive fuzzy selection."

    set -l bookmark_file "$HOME/.inse.bookmarks"
    set -l query ""

    for arg in $argv
        set -e argv[1]

        switch $arg
            case '--set'
                __add_mark $bookmark_file $argv
                return
            case '*'
                set query $inse_selector_query_arg"\""$arg"\""
        end
    end

    if test -e $bookmark_file
        __get_mark $bookmark_file $query | read bookmark_dir
        if test -n "$bookmark_dir"
            cd $bookmark_dir
        end
    else
        echo "No bookmarks stored."
    end
end
