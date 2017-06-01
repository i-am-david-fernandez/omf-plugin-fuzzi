# inse initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

set -q inse_selector; or set -g inse_selector "fzf --reverse --multi"
