#!/bin/bash

set -e # exit on first error

install_ipopt()
{
    curl -L https://git.io/vFtfI > install.bash && bash install.bash && rm install.bash
}

install_ipopt
