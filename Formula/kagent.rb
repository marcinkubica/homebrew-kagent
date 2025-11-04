class Kagent < Formula
  desc "kagent: CLI agent for Cloud Native Agentic AI"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.7.4"
  license "Apache-2.0"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "9a4e06dddb5fd792699673a255513ac51d99b4eb4d2edc4ce0e7e73472dd132a"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "952e55194e6aab46e112f5e19e9e4ea2a492fba28aaf39fd1e656818a9b26831"
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "7a06a64ee5716ce6c18f246d9450b8dd2625cc684a13ac8b90b35caff19c7ca4"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "ff346bd8e99d4009ae2d41d93a563c718196c74cf7ccd07094c50e2f95400090"
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
