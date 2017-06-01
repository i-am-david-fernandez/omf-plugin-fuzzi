<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### inse
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## About

This plugin provides a set of interactive-selection (inse) wrappers around various tools to provide an effective means of selecting things (e.g., files, processes) for futher action.

This plugin uses an external selector program that must be installed separately and configured appropriatly (see [Configuration](#Configuration)).


## Install

```fish
$ omf install inse
```

## Configuration

The following may be set (e.g., in `config.fish`) to override defaults:

* `inse_selector`
  * The commandline of the interactive selector to be used. Examples:
    * `fzf --reverse --multi` to use [fzf](https://github.com/junegunn/fzf). This is the default if not set elsewhere.
    * `peco` to use [peco](https://github.com/peco/peco).
    * `percol ` to use [percol](https://github.com/mooz/percol).
  * Note that, while not all plugin commands make use of multiple selections, the commandline specified should provide for multiple selections if you wish to support multiple selections where it makes sense.


## Usage

```fish
$ insehist
```

Select something from commandline history for reuse. This will place the selected history item at the prompt but not execute it, allowing editing.


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



# License

[MIT][mit] © [David Fernandez][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/{{USER}}
[contributors]:   https://github.com/{{USER}}/plugin-inse/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
