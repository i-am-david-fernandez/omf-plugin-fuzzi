<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### inse
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## About

This plugin provides a set of interactive-selection (inse) wrappers around various tools to provide an effective means of selecting things (e.g., files, processes) for futher action.

This plugin uses an external selector program that must be installed separately and configured appropriately (see [Configuration](#Configuration)).


## Install

```fish
$ omf install inse
```

## Configuration

In summary, this plugin should "just work" out of the box. There are some configurable items (below), but defaults are intelligently selected/discovered where possible.

The following may be set (e.g., in `config.fish`) to override defaults:

* `inse_selector`
  * The commandline of the interactive selector to be used. Examples:
    * `fzf --reverse --multi --ansi` to use [fzf](https://github.com/junegunn/fzf).
    * `peco` to use [peco](https://github.com/peco/peco).
    * `percol` to use [percol](https://github.com/mooz/percol).
  * If not explicitly set, the first of `fzf`, `peco` and `percol` to be found will be used (the order being based simply on a subjective ranking of performance/function).
  * As some plugin commands allow for multiple selections, the commandline you specify should provide for multiple selections where possible, if you wish to support multiple selections.

* `inse_colourised`
  * Some selectors (`fzf` for example) can parse colour codes, and so if this configuration option is set to a non-empty string (e.g., `enabled`), some plugin commands will colourise the presented list items. For example, `insemark` will colourise the presented list of bookmarks to help visually distinguish the bookmarked directory from the associated comment.
  * If no selector (above) is user-configured, then this value is set according to the automatically-chosen selector, otherwise the default is unset (i.e., no colourisation).


## Usage

```fish
$ insehist
```

Select something from commandline history for reuse. This will place the selected history item at the prompt but not execute it, allowing editing.


```fish
$ insemark {--set <comment>}
```

Create or navigate to a bookmarked directory. Use `--set` to store the current directory in the list of bookmarks with an optional comment. Use with no options to present the list of stored bookmarks for selection and navigation. Comments are displayed in the presented list.


```fish
$ insekill <options>
```

Select one or more processes for killing. Any specified options are passed directly to `kill`, so this may be used to do other things with `kill` (e.g., send non-kill signals).


```fish
$ inseup
```

Navigate to a directory somewhere directly above the current directory in the heirarchy. For example, if the current directory is `/foo/bar/bongo/mongo`, a selection list containing `/foo/bar/bongo/mongo`, `/foo/bar/bongo`, `/foo/bar`, `/foo` and `/` is presented.


```fish
$ insegit <options>
```

Construct a `git` operation commandline for one or more files. The list of files presented is that obtained via `git status --porcelain`, and the operation is the expansion of `git <options> <selected files>`, so, for example, one could run `insegit add` to select which files to add rather than typing each filename. Note that the list of presented files includes the `git status` indicators (e.g., `M` for modified) to aid selection, but only the filenames are included on the expanded commandline. Further, the result is placed at the prompt for use/editing but is not executed.


```fish
$ insesvn
```

Construct an `svn` operation commandline for one or more files. The list of files presented is that obtained via `svn status`, and the operation performed is the expansion of `svn <options> <selected files>`, so, for example, one could run `insesvn commit` to select which files to commit rather than typing each filename. Note that the list of presented files includes the `svn status` indicators (e.g., `M` for modified) to aid selection, but only the filenames are included on the expanded commandline. Further, the result is placed at the prompt for use/editing but is not executed.


```fish
$ insefiles <options>
```

Populate the commandline with a list of files/directories. The presented list of files is generated via `find ./ <options>` and so additional `find` options may be provided (e.g., `-maxdepth N` to limit the search depth).



# License

[MIT][mit] © [David Fernandez][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/{{USER}}
[contributors]:   https://github.com/{{USER}}/plugin-inse/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
