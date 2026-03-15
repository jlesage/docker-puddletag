#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

[ -f "$XDG_CONFIG_HOME"/puddletag/puddletag.conf ] || {
    mkdir -p "$XDG_CONFIG_HOME"/puddletag
    cp -v /defaults/puddletag.conf "$XDG_CONFIG_HOME"/puddletag/
}

# vim:ft=sh:ts=4:sw=4:et:sts=4
