#!/usr/bin/env bash

# Время задержки перед отображением меню
DELAY=0.5

# Ждём DELAY секунд
sleep $DELAY

# Проверяем, выполнялась ли команда после префикса
LAST_CMD=$(tmux display-message -p "#{history[-1]}" 2>/dev/null)

# Если последняя команда не содержит нажатую клавишу → вызываем WhichKey
if [[ -z "$LAST_CMD" || "$LAST_CMD" == "C-b" ]]; then
	tmux display-popup -E "tmux list-keys | fzf || true"
fi
