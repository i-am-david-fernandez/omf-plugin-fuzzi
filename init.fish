# inse initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

if not set -q inse_selector
    if which fzf > /dev/null
        set -g inse_selector "fzf --reverse --multi --ansi"
        set -q inse_colourised; or set -g inse_colourised "enabled"
    else if which peco > /dev/null
        set -g inse_selector "peco"
        set -q inse_colourised; or set -g inse_colourised ""
    else if which percol > /dev/null
        set -g inse_selector "percol"
        set -q inse_colourised; or set -g inse_colourised ""
    end
end

set -q inse_colourised; or set -g inse_colourised ""
