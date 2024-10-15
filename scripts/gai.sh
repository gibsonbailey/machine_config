show_files() {
    git status --porcelain | sort | awk '
    BEGIN {
      red = "\033[31m";
      orange = "\033[33m";
      green = "\033[32m";
      reset = "\033[0m";
    }
    {
      first_char = substr($0, 1, 1)
      second_char = substr($0, 2, 1)
      if (first_char == "M" || first_char == "A" || first_char == "D") {
        if (second_char == "M" || second_char == "A" || second_char == "D") {
          color = orange;
        } else {
          color = green;
        }
      } else if (first_char == " ") {
        color = red;
      }
      printf("%s%s%s\n", color, $2, reset);
    }'
}

ROOT_GIT_DIR="$(git rev-parse --show-toplevel)"

fzf_window() {
    fzf --ansi --height 100% --preview "git diff --color=always -- ${ROOT_GIT_DIR}/{}"
}

FILE="$(show_files | fzf_window)"
while [ -n "$FILE" ]; do
    # If the file is staged, unstage it. Otherwise, stage it.
    if [ -n "$(git status --porcelain | grep "^.\S $FILE")" ]; then
        echo "Staging ${ROOT_GIT_DIR}/${FILE}"
        git add -- "${ROOT_GIT_DIR}/${FILE}"
    else
        echo "Unstaging ${ROOT_GIT_DIR}/${FILE}"
        git restore --staged -- "${ROOT_GIT_DIR}/${FILE}"
    fi
    FILE="$(show_files | fzf_window)"
done
