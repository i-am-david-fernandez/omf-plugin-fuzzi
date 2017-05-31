function fkill -d "Kill one or more processes with interactive fuzzy process selection."
    ps axf | fzf --no-sort --tac --multi | awk '{print $1}' | read --array --null ps_set
    for p in $ps_set
        echo "Killing [$p]"
        kill $argv $p
    end
end
