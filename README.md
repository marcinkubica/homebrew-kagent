# homebrew-kagent

A Homebrew tap for installing `kagent` CLI

`kagent` brings Agentic AI to Cloud Native. Visit the main repository at [https://github.com/kagent-dev/kagent](https://github.com/kagent-dev/kagent).

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

## Future Plans

This repository will eventually be moved to `https://github.com/kagent-dev` and users will be able to install with:

```sh
brew install kagent-dev/kagent/kagent
```

and
```sh
brew upgrade kagent
```

## License

Apache-2.0