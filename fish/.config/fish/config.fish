if status is-interactive
    # Commands to run in interactive sessions can go here

    # Abbreviations.
    abbr -a df df --human-readable --exclude-type tmpfs
    abbr -a du du --human-readable --max-depth 1
    abbr -a fd fd --no-ignore
    abbr -a px pixi run
    abbr -a r R --quiet --no-save
    abbr -a trim "sd ' +\$' ''"

    abbr -a --position anywhere \
      -- --help '--help | bat --plain --language help'

    abbr -a --set-cursor scpu srun --partition high2 --time 0-12 --mem 16G % --pty /usr/bin/env fish -il
    abbr -a --set-cursor sgpu srun --partition gpu-a100-h --time 0-6 --mem 16G --gres gpu:1 % --pty /usr/bin/fish -il

    # Initializations.
    atuin init fish --disable-up-arrow | source
    pixi completion --shell fish | source
    zoxide init fish | source
    starship init fish | source
    # batman --export-env | source
end
