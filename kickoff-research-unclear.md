# (o4-mini) Kickoff Research for Homebrew Tap: kagent - Unclear to User

_Date: 7 July 2025_

This document summarizes research and recommendations for publishing `kagent` binaries via a custom Homebrew tap.

---

## 1. Brew Tap & Install Script

### 1.1 Tap Repository Structure
- Create a repository named `homebrew-kagent` under your GitHub account (e.g., `marcinkubica/homebrew-kagent`).
- Standard layout:
  ```
  homebrew-kagent/
  ├── Formula/
  │   └── kagent.rb      # Ruby formula file
  ├── README.md          # Tap documentation
  └── .github/workflows/ # CI for publishing formula updates
  ```

### 1.2 Sample Formula (`Formula/kagent.rb`)
```ruby
class Kagent < Formula
  desc "kagent: CLI agent for Kubernetes automation"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.3.19"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "<darwin-arm64-sha256>"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "<darwin-amd64-sha256>"
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "<linux-arm64-sha256>"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "<linux-amd64-sha256>"
    end
  end

  def install
    bin.install "kagent-*" => "kagent"
  end

  test do
    assert_match "kagent version #{version}", shell_output("#{bin}/kagent version")
  end
end
```

### 1.3 Installation Command
After tapping:
```shell
brew tap marcinkubica/kagent
brew install kagent
```

---

## 2. Integration with kagent Release Process

Leverage the existing `tag.yaml` workflow in the upstream `kagent-dev/kagent` repo to automate formula updates.

### 2.1 GitHub Workflow Extension
- Add a step after tagging and binary upload to:
  1. Checkout the `homebrew-kagent` repo.
  2. Run a script to bump `version`, update `url` and `sha256` fields in `Formula/kagent.rb`.
  3. Commit and open a pull request (or push directly) to `homebrew-kagent`.

Example using `Homebrew/bump-formula-action`:
```yaml
- name: Bump Homebrew formula
  uses: Homebrew/bump-formula-action@v1
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
    formula: kagent
    version: ${{ github.ref_name }}  # e.g., v0.3.19
    url: https://github.com/kagent-dev/kagent/releases/download/${{ github.ref_name }}/kagent-darwin-amd64
    sha256: ${{ steps.compute_darwin_amd64_sha.outputs.sha256 }}
```

### 2.2 SHA Computation Steps
- Add workflow steps to download each release asset and compute `sha256sum echo`.
- Export outputs for each platform/arch.

---

## 3. Handling SHAs for Multiple Platforms

### 3.1 Required SHA Files
For each release, there are four primary binaries (darwin-amd64, darwin-arm64, linux-amd64, linux-arm64). Each has a SHA file published alongside the binary.

Example (v0.3.19):
- `kagent-darwin-amd64` — SHA: `c953cab57...` (15.7 MB)
- `kagent-darwin-amd64.sha256` — SHA: `6cf293f98b0...` (90 B)
- `kagent-darwin-arm64` — SHA: `c03434d409...` (15 MB)
- `kagent-darwin-arm64.sha256` — SHA: `3e01dca48d...`

### 3.2 Formula Bottle Blocks
- Instead of manual `on_intel`/`on_arm` blocks, consider using `bottle` DSL:
  ```ruby
  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "..."
    sha256 cellar: :any_skip_relocation, big_sur:       "..."
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "..."
    sha256 cellar: :any_skip_relocation, arm64_linux:   "..."
  end
  ```
- Bottles are precompiled Homebrew packages; generating bottles requires building on CI and uploading to Bintray/GitHub Releases. If you prefer distributing raw binaries, stick with URL blocks.

---

## 4. Dynamic vs Static SHA Updates

### 4.1 Static SHA in Formula
- Homebrew formulas require a static SHA at commit time for auditability. Dynamic lookups at install time are not permitted.

### 4.2 Automating Updates
- Use a CI step (`bump-formula-action` or custom script) to regenerate and commit updated SHA values each time a new `kagent` version is released.
- This keeps the tap up-to-date without manual edits.

---

## 5. Action Items & Next Steps

1. **Create tap repo** `marcinkubica/homebrew-kagent` with `Formula/kagent.rb` and `README.md`.
2. **Draft GitHub Actions** in `homebrew-kagent/.github/workflows/` to:
   - Lint the formula (`brew audit --strict --online`).
   - Run `brew test` or smoke tests.
3. **Extend upstream tag workflow** to bump the tap formula.
4. **Test end-to-end**: Tag a dummy release, verify that the tap PR/update is opened, merge, and install via `brew install`.
5. Document on README how to enable tap and install `kagent`.


---

*Research complete.*
