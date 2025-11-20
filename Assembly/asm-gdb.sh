#!/bin/bash

set -e

function wrong_usage {
    echo "Usage: $0 -f sources [-a args]"
    exit 1
}

files=()
args=()

if [ -z "$1" ]; then
    wrong_usage
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        -f)
            shift
            # raccogli file finché non trovi un'altra flag
            while [[ $# -gt 0 && "$1" != -* ]]; do
                files+=("$1")
                shift
            done
            ;;
        -a)
            shift
            # raccogli args finché non trovi un'altra flag
            while [[ $# -gt 0 && "$1" != -* ]]; do
                args+=("$1")
                shift
            done
            ;;
        *)
            wrong_usage
            ;;
    esac
done

echo "Compilo gli eseguibili ${files[@]}..."
arm-linux-gnueabihf-gcc "${files[@]}" -static -ggdb3

echo "Eseguo il processo per poterlo debuggare con argomenti ${args[@]} ..."
qemu-arm -g 12345 ./a.out "${args[@]}" &

echo "Eseguo gdb..."
gdb-multiarch -q --nh -ex 'set architecture arm' -ex 'file ./a.out' -ex 'target remote localhost:12345' -ex 'layout regs'
