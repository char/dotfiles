#!/bin/sh

if ! command -v antibody &> /dev/null; then
    curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
fi
