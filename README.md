# randpass

An adequate command-line random password generator.

![Linux Build Status](https://github.com/mraffonso/randpass/actions/workflows/linux.yaml/badge.svg) ![macOS Build Status](https://github.com/mraffonso/randpass/actions/workflows/macos.yaml/badge.svg)

## Installation

### macOS

The easiest way is via Homebrew.

```bash
brew tap mraffonso/randpass
brew install randpass
```

### From source

Use the provided _Makefile_ to build a production release.

```bash
make
```

Then you can copy the binary to a location in your $PATH.  For example:

```bash
mkdir -p $HOME/bin
cp build/randpass $HOME/bin
```

If it still does not work make sure the path is in your $PATH.

```bash
# If you use bash
echo 'export PATH="$PATH":"$HOME/bin"' >> .bashrc
# Or if you use ZSH
echo 'export PATH="$PATH":"$HOME/bin"' >> .zshrc
```

## Usage

### Passwords

__randpass__ is very simple and there are only three types of arguments it accepts for password generation.

| Argument | Description | Default |
| --- | --- | --- |
| length | List all new or modified files | 8 |
| charsets | Show file differences that haven't been staged | dlsu |
| count | List all new or modified files | 1x |

OK, so how do these charsets work?  It's also very simple, you simply specity a string of the charset codes you wish to use.

| Code | Charset | Characters |
| - | -- | ------- |
| b | Binary | 01 |
| d | Digits | 0123456789 |
| l | Lowercase | abcdefghijklmnopqrstuvwxyz |
| s | Special | ! \"\#\$\%\&\'\(\)\*\+,\-\./\:\;\<\=\>\?\@\[\\]\^\_\`\{\|\}\~ |
| u | Uppercase | ABCDEFGHIJKLMNOPQRSTUVWXYZ |

### Options

In addition to the customary `--help` and `--version`, and their shorter variants (`-h` and `-v`), there is also a `--charsets` option (`-c` for short) that lists all available charsets.

```bash
randpass --charsets # Shows available charsets
randpass -c         # Also shows available charsets
randpass --help     # Shows help
randpass -h         # Also shows help
randpass --version  # Shows version
randpass -v         # Also shows version
```

### Examples

A password 8 chracters long, with digits, lowercase, uppercase and specials (the default settings).

```bash
randpass # PdXwQG|"
# Is the same as
randpass 8 dlsu 1x # lP]|;i7/
```

A password 20 characters long with digits, lowercase and uppercase.

__Note__: It is not necessary to specify 1x, since  that's the default.

```bash
randpass 20 dlu # PoCuQuVJ0rayYvOYWxcD
# OR in a different order, because order does not matter
randpass udl 20 # EEKL3lJXLhMVHf9CPzCV
```

A password 16 characters long with binary only.

```bash
randpass 16 b # 1110011101010110
```

Four passwords 12 characters long with digits, lowercase, uppercase and specials.

__Note__: It is not necessary to specify `dlsu` since that's the default.

```bash
randpass 12 4x
# z9eSPsS;&zh_
# Ui+G8p3XWnxq
# }o@@!r_,9YTG
# SYLh{:5Dt;>Y
```

## Development

To develop __randpass__ you'll need [Crystal](https://crystal-lang.org/) which is the only requirement.

## Testing

All specs can by run with.

```bash
crystal spec
```

## Contributing

1. Fork it ( https://github.com/mraffonso/randpass/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [mraffonso](https://github.com/mraffonso) Mario Affonso - creator, maintainer

## License
__randpass__ is licensed under the MIT License.  See [LICENSE](https://github.com/mraffonso/randpass/blob/main/LICENSE).
