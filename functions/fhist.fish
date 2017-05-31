function fhist -d "Retrieve a command from history with interactive fuzzy selection."
    history | fzf --no-sort --tac | read cmd
    commandline --replace "$cmd"
end
