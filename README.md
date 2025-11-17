# homebrew-kagent (retired)

> [!NOTE] This tap is no longer maintained. Please use the official
> [homebrew-core](https://github.com/Homebrew/homebrew-core) formula instead.

## About


This tap previously provided a binary formula while the project was transitioning
into Homebrew/core. 

## Migration

If you installed from this tap, run the following to migrate:

```sh
brew untap marcinkubica/kagent
brew install kagent
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
