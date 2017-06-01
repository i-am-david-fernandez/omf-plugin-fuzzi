function insegit -d "Git command wrapper with interactive fuzzy file selection."
    set -l tmp (tempfile)
    git status --porcelain | eval $inse_selector > $tmp
    set -l file_set (cat $tmp | awk '{print $2}' | string join " ")
    rm -f $tmp
    commandline --replace "git $argv $file_set"
end
