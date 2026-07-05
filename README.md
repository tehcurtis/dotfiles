# dotfiles 'n things

Managed with [chezmoi](https://www.chezmoi.io). The source files live in this
repo; chezmoi renders them into `$HOME`. Source files use chezmoi's naming
convention (`dot_gitconfig` → `~/.gitconfig`, etc.).

## Layout

I'm using chezmoi via symlink:

```
~/.local/share/chezmoi -> ~/projects/dotfiles
```

## To bootstrap on a new machine

```sh
brew install chezmoi
git clone https://github.com/<you>/dotfiles.git ~/projects/dotfiles
ln -s ~/projects/dotfiles ~/.local/share/chezmoi
chezmoi diff      # preview what would change
chezmoi apply     # write the files into $HOME
```

## Everyday use

```sh
chezmoi add ~/.somerc   # start managing a file
chezmoi edit ~/.zshrc   # edit the source copy
chezmoi diff            # see pending changes
chezmoi apply           # apply source -> $HOME
chezmoi managed         # list managed files
```

## Currently managed

- `~/.Brewfile` (plus `run_onchange_darwin-install-packages.sh.tmpl`, which runs `brew bundle` whenever it changes)
- `~/.gitconfig`
- `~/.zprofile`
- `~/.zshrc`

`README.md` is listed in `.chezmoiignore` so it is never written into `$HOME`.
