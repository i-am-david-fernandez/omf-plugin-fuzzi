function fsvn -d "Subversion command wrapper with interactive fuzzy file selection."
    set -l tmp (tempfile)
    svn status | fzf --no-sort --tac --multi > $tmp
    set -l file_set
    for f in (cat $tmp | awk '{print $2}')
        set file_set $file_set $f
    end
    rm -f $tmp

    svn $argv $file_set
end
