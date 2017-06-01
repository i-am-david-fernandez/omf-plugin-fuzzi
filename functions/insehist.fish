function insehist -d "Retrieve a command from history with interactive fuzzy selection."
    history | eval $inse_selector | read cmd
    commandline --replace "$cmd"
end
