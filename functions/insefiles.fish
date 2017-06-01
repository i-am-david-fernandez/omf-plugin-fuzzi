function insefiles -d "Populate the commandline with a list of files/directories with interactive fuzzy selection."
    set -l tmp (tempfile)
    find ./ $argv | eval $inse_selector  > $tmp
    set -l file_set (cat $tmp | string join " ")
    commandline --replace "$file_set"
    rm -f $tmp
end
