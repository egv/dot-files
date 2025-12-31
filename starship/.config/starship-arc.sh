#!/bin/bash
# Starship custom module for Arcadia VCS (arc)
# Optimized for speed - only shows branch name

# Get branch name (arc root already checked by starship 'when' condition)
branch=$(arc branch 2>/dev/null | grep '^\*' | sed 's/^\* //')
[ -z "$branch" ] && exit 1

echo "$branch"
