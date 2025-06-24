#!/usr/bin/env bash

# --- 1. Nord-палитра
tmux set -g @nord0 "#2E3440"
tmux set -g @nord1 "#3B4252"
tmux set -g @nord2 "#434C5E"
tmux set -g @nord3 "#4C566A"
tmux set -g @nord4 "#D8DEE9"
tmux set -g @nord5 "#E5E9F0"
tmux set -g @nord6 "#ECEFF4"
tmux set -g @nord7 "#8FBCBB"
tmux set -g @nord8 "#88C0D0"
tmux set -g @nord9 "#81A1C1"
tmux set -g @nord10 "#5E81AC"
tmux set -g @nord11 "#BF616A"
tmux set -g @nord12 "#D08770"
tmux set -g @nord13 "#EBCB8B"
tmux set -g @nord14 "#A3BE8C"
tmux set -g @nord15 "#B48EAD"

# --- 2. Базовые стили для tmux ---
tmux set -g message-style "fg=#{@nord4},bg=#{@nord1}"
tmux set -g message-command-style "fg=#{@nord4},bg=#{@nord1}"

tmux set -g status-style "fg=#{@nord4},bg=#{@nord0}"
tmux set -g status-left-style "fg=#{@nord4},bg=#{@nord0}"
tmux set -g status-right-style "fg=#{@nord4},bg=#{@nord0}"

tmux set -g pane-border-style "fg=#{@nord2}"
tmux set -g pane-active-border-style "fg=#{@nord7}"

tmux set -g window-style "fg=#{@nord4},bg=#{@nord0}"
tmux set -g window-active-style "fg=#{@nord6},bg=#{@nord0}"

tmux set -g window-status-format "#[fg=#{@nord4},bg=#{@nord1}] #I:#W "
tmux set -g window-status-current-format "#[fg=#{@nord4},bg=#{@nord2}] #I:#W "
tmux set -g window-status-activity-style "fg=#{@nord9},bg=#{@nord1}"

# --- 3. Храним "текущий режим" в переменной @my_mode ---
# Изначально установим "NORMAL".
tmux set -g @my_mode "NORMAL"

# --- 4. Автоматически переключаем в COPY при входе в copy-mode ---
#    - хук on-enter-copy-mode и on-exit-copy-mode
tmux set-hook -g on-enter-copy-mode "run-shell '~/.tmux/plugins/tmux-nord-full-indicator/scripts/set-mode.sh COPY'"
tmux set-hook -g on-exit-copy-mode  "run-shell '~/.tmux/plugins/tmux-nord-full-indicator/scripts/set-mode.sh NORMAL'"

# --- 5. (Опционально) Определим бинды для "INSERT" ---
#    Здесь лишь пример. Когда вы в NORMAL, нажимаете <префикс>+I — ставит INSERT.
#    Нажимаете <префикс>+O — вернёт NORMAL (или можете ESC, как угодно).
#    !!! Убедитесь, что у вас префикс не конфликтует с уже существующими биндами.
tmux bind-key -n C-i run-shell "~/.tmux/plugins/tmux-nord-full-indicator/scripts/set-mode.sh INSERT"
tmux bind-key -n C-o run-shell "~/.tmux/plugins/tmux-nord-full-indicator/scripts/set-mode.sh NORMAL"

# --- 6. Выводим текущий режим в status-right ---
#    Через конструкцию "#( ... )", которая вызывает скрипт show-mode.sh
CURRENT_STATUS_RIGHT="$(tmux show -gqv status-right)"
if [ -z "$CURRENT_STATUS_RIGHT" ]; then
  tmux set -g status-right "#(bash ~/.tmux/plugins/tmux-nord-full-indicator/scripts/show-mode.sh)"
else
  tmux set -g status-right "$CURRENT_STATUS_RIGHT #(bash ~/.tmux/plugins/tmux-nord-full-indicator/scripts/show-mode.sh)"
fi

# Готово. При входе в copy-mode будет писать "COPY", при выходе — "NORMAL".
# При нажатии Ctrl+I (вне copy-mode) — "INSERT" (пока опять не смените на NORMAL).
