class Kagent < Formula
  desc "kagent: CLI agent for Cloud Native Agentic AI"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.6.17"
  license "Apache-2.0"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "fbbe27b36f29d65e594719936fb171e0a8aacba4b9cdd3aacc606f4c047ef21f"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "518e112c5e24e5618eeed27614a89d6558aa911105d29a7ee79427613a6e05ae"
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "0d50592be14e0e210c883193f6c536a0ccfed7dfd6cee216b32327a03b4c64e1"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "ff54c091379cc9f1cb0fee18c204b3bf91b278789b1e7b6b129b89c938eecc44"
    end
  end

  def install
    # The downloaded file will have the platform-specific name, but we want to install it as just "kagent"
    downloaded_file = if OS.mac? && Hardware::CPU.arm?
      "kagent-darwin-arm64"
    elsif OS.mac? && Hardware::CPU.intel?
      "kagent-darwin-amd64"
    elsif OS.linux? && Hardware::CPU.arm?
      "kagent-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "kagent-linux-amd64"
    end

    bin.install downloaded_file => "kagent"
  end

  test do
    output = shell_output("#{bin}/kagent version")
    assert_match "\"kagent_version\":\"#{version}\"", output
  end
end 
