# inse initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

if not set -q inse_selector
    if which fzf > /dev/null ^&1
        set -g inse_selector "fzf --reverse --multi --ansi"
        set -g inse_selector_query_arg "--query="
        set -q inse_colourised; or set -g inse_colourised "enabled"
    else if which peco > /dev/null ^&1
        set -g inse_selector "peco"
        set -g inse_selector_query_arg "--query "
        set -q inse_colourised; or set -g inse_colourised ""
    else if which percol > /dev/null ^&1
        set -g inse_selector "percol"
        set -g inse_selector_query_arg "--query="
        set -q inse_colourised; or set -g inse_colourised ""
    else
        echo "Warning: No selector is configured for 'inse', and no supported selector has been detected. Inse will not work correctly."
    end
end

set -q inse_colourised; or set -g inse_colourised ""
