# Remote Computing Dotfiles

These are the dotfiles @nick-ulle uses to set up on remote computing resources.


## Usage

Requirements:

* [GNU Stow](https://www.gnu.org/software/stow/)

To install:
```bash
git clone https://github.com/nick-ulle/dotfiles-remote ~/.dotfiles
cd ~/.dotfiles
stow */
```

To reinstall (after edits):
```bash
cd ~/.dotfiles
stow --restow */
```

To uninstall:
```bash
cd ~/.dotfiles
stow --delete */
```
