# Dotfiles

This repository contains configuration files and scripts for managing and customizing my macOS environment. It is organized for use with [GNU Stow](https://www.gnu.org/software/stow/) to easily symlink and manage dotfiles.

## Usage

1. Clone this repository to your home directory:
   ```
   git clone https://github.com/pranx29/dotfiles.git ~/dotfiles
   ```
2. Use GNU Stow to symlink configs:
   ```
   cd ~/dotfiles
   stow .
   ```