# fuzzi initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

set -q fuzzi_selector; or set -g fuzzi_selector "fzf --reverse --multi"
