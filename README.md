# Dotfile

This repository contains personal configuration files for various linux app and tools. It is intended to be used to replicate the same environment across my linux machines.

## Prerequisites

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage the dotfiles. Make sure to install it before proceeding.

## Usage

To use the dotfiles with GNU Stow, follow these steps:

1. Clone the repository to your home directory:

    ```bash
    git clone git@github.com:BBraeck/dotfiles.git
    ```
2. Navigate to the cloned repository:

    ```bash
    cd dotfiles
    ```
3. Use GNU Stow to create symbolic links for the desired configuration files. For example,
    to link the `nvim` configuration, run:

    ```bash
    stow nvim
    ```

    This will create symbolic links in your home directory pointing to the files in the `nvim` directory of the repository.

## Add new dotfiles

To add new dotfiles to the repository, follow these steps:
1. Create a new directory in the repository for the application or tool you want to configure. For example, if you want to add configuration files for `tmux`, create a directory named `tmux`:

    ```bash
    mkdir tmux
    ```
2. Move or copy the configuration files for the application into the newly created directory. For example, if you have a `.tmux.conf` file, move it to the `tmux` directory:
    ```bash
    mv ~/.tmux.conf tmux/
    ```
3. Use GNU Stow to create symbolic links for the new configuration files:
    ```bash
    stow tmux
    ```