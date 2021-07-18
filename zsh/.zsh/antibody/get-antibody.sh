#!/bin/sh

if [ ! -f /usr/local/bin/antibody ]; then
    curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
fi
