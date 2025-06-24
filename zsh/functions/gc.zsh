gc() {
    if [ $# -eq 1 ]; then
        git clone "$1" && cd "$(basename "$1" .git)"
    else
        git clone "$@" && cd "$2"
    fi
}
