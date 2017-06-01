function insegit -d "Git command wrapper with interactive fuzzy file selection."
    set -l tmp (tempfile)
    git status --porcelain | eval $inse_selector  > $tmp
    set -l file_set
    for f in (cat $tmp | awk '{print $2}')
        set file_set $file_set $f
    end
    rm -f $tmp

    commandline --replace "git $argv $file_set"
end
