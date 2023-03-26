show_files() {
    git status --porcelain | sort | awk '
    BEGIN {
      red = "\033[31m";
      green = "\033[32m";
      reset = "\033[0m";
    }
    {
      first_char = substr($0, 1, 1)
      if (first_char == "M" || first_char == "A" || first_char == "D") {
        color = green;
      } else if (first_char == " ") {
        color = red;
      }
      printf("%s%s%s\n", color, $2, reset);
    }'
}

fzf_window() {
    fzf --ansi --height 100% --preview 'git diff --color=always {}'
}

FILE="$(show_files | fzf_window)"
while [ -n "$FILE" ]; do
    # If the file is staged, unstage it. Otherwise, stage it.
    if [ -n "$(git status --porcelain | grep "^.\S $FILE")" ]; then
        echo "Staging $FILE"
        git add "$FILE"
    else
        echo "Unstaging $FILE"
        git restore --staged "$FILE"
    fi
    FILE="$(show_files | fzf_window)"
done
