class Kagent < Formula
  desc "kagent: CLI agent for Cloud Native Agentic AI"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.7.2"
  license "Apache-2.0"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "0f9ae864297ef6408dcf5d9dc357eb14728ad35f1b944de19aa1e90a050d15f7"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "656273a82c7e4d17a19e934e812d28577c593ddc2e41732ac12f93e678f0b275"
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "6dfb5836e672a1dcd0b5a1905bfc2608feaebdbeee81e92d3cdf60c14f5587cd"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "8af374728626212ab055e29172cb24148453e80eb31e7e816e6b3f15f150ab54"
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
