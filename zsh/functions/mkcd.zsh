# Функция mkcd: создаёт директорию и переходит в неё
mkcd() {
    mkdir -p "$1" && cd "$1"
}
