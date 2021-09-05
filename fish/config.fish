#
# ~/.config/fish/config.fish
#


#########
# Aliases
#########

# Use `lsd` instead of `ls`.
alias ls="lsd"
# Use `bat` instead of the outdated `cat`.
alias cat="bat"
# Use `rg` (ripgrep) instead of `grep`.
alias grep="rg"
# Use `fd` instead of `find`.
alias find="fd"
# Remove older packages from paccache; only keep the most recent version. Then run the full system upgrade.
alias update="df -h; sudo paccache -rk1; df -h; sudo pacman -Syu"
# Run rkhunter update, check, cat's the rkhunter log, then runs `--propupd`.
alias check="sudo rkhunter --update; sudo rkhunter -c; sudo cat /var/log/rkhunter.log; sudo rkhunter --propupd"
# Get blog statistics.
alias blogstats="python blog_stats.py"


######
# PATH
######

# Add Rust.
fish_add_path /home/joseph/.cargo/bin
fish_add_path /home/joseph/.rustup
# Add Go.
fish_add_path /usr/local/go/bin


# Run starship.
starship init fish | source

