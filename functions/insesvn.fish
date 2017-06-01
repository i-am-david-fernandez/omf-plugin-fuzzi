function insesvn -d "Subversion command wrapper with interactive fuzzy file selection."
    set -l tmp (tempfile)
    svn status | eval $inse_selector > $tmp
    set -l file_set (cat $tmp | awk '{print $2}' | string join " ")
    rm -f $tmp
    commandline --replace "svn $argv $file_set"
end
