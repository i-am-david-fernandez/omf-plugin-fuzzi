function fhist -d "Retrieve a command from history with interactive fuzzy selection."
    history | eval $fuzzi_selector | read cmd
    commandline --replace "$cmd"
end
