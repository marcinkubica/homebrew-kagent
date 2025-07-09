# homebrew-kagent

A Homebrew tap for installing `kagent` - the CLI agent for Kubernetes automation.

## Installation

To install `kagent` using this tap:

```bash
# Add the tap
brew tap marcinkubica/kagent

# Install kagent
brew install kagent
```

Or
```bash
# Add tap and install
brew install marcinkubica/kagent/kagent
```

Both of these commands will allow you later to issue

```sh
brew upgrade kagent
```

## Verify Installation

After installation, verify that `kagent` is working:

```bash
kagent version
```

## Current Version

This tap currently provides `kagent` version **v0.4.0**.

## Supported Platforms

- macOS (Intel and Apple Silicon)
- Linux (AMD64 and ARM64)

## Future Plans

This repository will eventually be moved to `https://github.com/kagent-dev` and users will be able to install with:

```bash
brew install kagent-dev/kagent
```

## About kagent

`kagent` brings Agentic AI to Cloud Native. Visit the main repository at [https://github.com/kagent-dev/kagent](https://github.com/kagent-dev/kagent).

## What's broken

Github Workflows are bananas
