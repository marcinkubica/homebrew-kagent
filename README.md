# homebrew-kagent **v0.7.1**

A Homebrew tap for installing `kagent` CLI

`kagent` brings Agentic AI to Cloud Native. Visit the main repository at [https://github.com/kagent-dev/kagent](https://github.com/kagent-dev/kagent).

## About


This repository was supposed to be moved to `https://github.com/kagent-dev` however other stream of work is
currenlty in play to place kagent in hombrew-core for canonical `brew install kagent` command.

For now this repository looks to update the formula every hour.

## Installation

To install with this tap:
```sh
# Add the tap
brew tap marcinkubica/kagent

# Install kagent
brew install kagent
```

Or add and install in one go:
```sh
brew install marcinkubica/kagent/kagent
```

Both of these commands will allow you later to simply upgrade with

```sh
brew upgrade kagent
```

## Migration from older _bash_ installer

If you previously installed `kagent` CLI with the old installer (using curl and bash)
you will need to remove it in order to use homebrew installed version.

Find location of your binary

```sh
which kagent

# likely will output something like
/usr/local/bin/kagent
```

1. Remove the old binary

```sh
sudo rm /usr/local/bin/kagent
```

Or remove in one go

```sh
sudo rm $(which kagent)
```

## TestedPlatforms

- macOS (Intel and Apple Silicon)
- Linux (AMD64 and ARM64)

## License

Apache-2.0
