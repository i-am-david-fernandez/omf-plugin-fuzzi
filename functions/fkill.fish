function fkill -d "Kill one or more processes with interactive fuzzy process selection."

    set -l tmp (tempfile)
    ps axf | eval $fuzzi_selector  > $tmp

    for p in (cat $tmp)
        echo "Killing [$p]"
        set -l pid (echo $p | awk '{print $1}')
        kill $argv $pid
    end

    rm -f $tmp
end
