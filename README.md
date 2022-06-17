# randpass

An adequate command-line random password generator for macOS.

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

Randpass is very simple and there are three types of arguments randpass accepts for password generation.

| Argument | Description | Default |
| --- | --- | --- |
| length | List all new or modified files | 8 |
| charsets | Show file differences that haven't been staged | dlsu |
| count | List all new or modified files | 1x |

OK, so how do these charsets work?  It's also very simple, you simply specity a string of the charset codes you wish to use.

* b = Binary
* d = Digits
* l = Lowercase Characters
* s = Special Characters
* u = Uppercase Characters

### Options

In addition to the mandatory --help and --version, and their shorter variants, there is also a --charsets (-c for short) option to list the available charsets.

```bash
randpass --charsets # Shows available charsets
randpass -c         # Also shows available charsets
randpass --help     # Shows help
randpass -h         # Also shows help
randpass --version  # Shows version
randpass -v         # Also shows version
```

### Examples

A password 20 characters long with digits, lowercase and uppercase.  It is not necessary to specify 1x, since  that's the default.

```bash
randpass 20 dlu # PoCuQuVJ0rayYvOYWxcD
```

A password 16 characters long with binary only.

```bash
randpass 16 b # 1110011101010110
```

Four passwords 12 characters long with digits, lowercase, uppercase and specials.  It is not necessary to specify __"dlsu"__ since that's the default.

```bash
randpass 12 4x
# dyeuGs0lZXDM
# Gi605fBxTxc7
# Hy7ojyqvYJnA
# 58k9WXw5rb72
```

## Development

To develop randpass you'll need [Crystal](https://crystal-lang.org/) which is the only requirement.

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
