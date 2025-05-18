# 🛠️ SimonTheTree's Configs

This repository contains my personal configuration files and scripts to set up and restore my development environment efficiently.

## 📁 Contents

- `bashrc`  
  Custom Bash configurations.

- `bash_aliases`  
  Shortcut aliases for common commands.

- `inputrc`  
  Readline configurations for command-line behavior.

- `tmux.conf`  
  TMUX session configurations.

- `tmux_auto_saver.sh`  
  Script to automatically save TMUX sessions.

- `setup.sh`  
  Script to back up existing dotfiles and deploy new ones.

- `restore.sh`  
  Script to restore backed-up dotfiles.

## ⚙️ Usage

### Setup

To back up existing configurations and deploy the ones from this repository:

```bash
./setup.sh
```

This script will:
- Check for existing dotfiles in your home directory.
- Back them up to a hidden directory (`~/.config_backup` or `~/.config_backup_<RANDOM_ID>` if the base exists).
- Save the random ID used (if any) to `~/.config_backup_rand_num`.
- Copy the new configuration files from this repository to your home directory, prefixing them with a dot (`.`).
- Exclude `README.md` during the copy process (case-insensitive).

### Restore

To restore the previously backed-up configurations:

```bash
./restore.sh
```

This script will:
- Delete the deployed dotfiles from your home directory (those that match current folder contents, prefixed with a dot).
- Determine the backup directory by checking if `~/.config_backup_rand_num` exists.
- Restore the original configurations from the corresponding backup folder.
- Delete the backup directory and `.config_backup_rand_num` file after successful restoration.

## 🔄 TMUX Auto Saver

The `tmux_auto_saver.sh` script is designed to automatically save your TMUX sessions at regular intervals, helping preserve your work in case of crashes or restarts.

To use it:

1. Ensure it's executable:
   ```bash
   chmod +x tmux_auto_saver.sh
   ```

> ℹ️ This script is automatically sourced by your `.bashrc`, so you don't need to run it manually.

## 📌 Notes

- Ensure you have the necessary permissions to execute these scripts.
- Always review scripts before running them to understand their operations.
- Customize the configuration files (`bashrc`, `tmux.conf`, etc.) as per your preferences.
- If you plan to use this on another machine, clone the repo and run `./setup.sh` to install the configs.

---

Feel free to fork this repository and adapt it to your own configuration management needs.

