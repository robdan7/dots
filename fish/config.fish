if status is-interactive
   set fish_greeting
   eval $(ssh-agent -c)
   clear
   fastfetch --file-raw ~/.cache/chafa/icon
   source ~/.cache/wal/colors.fish
end

# Created by `pipx` on 2025-03-18 10:29:06
set PATH $PATH /home/robyn/.local/bin

# To display the current git branch in the command prompt
set biscuit_show_branch_name 1
