class Kagent < Formula
  desc "kagent: CLI agent for Cloud Native Agentic AI"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.7.1"
  license "Apache-2.0"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "0a5bf2e2a9516aee803e6743c501aef40cb1a50e42078e5b730f1422cf95ec8a"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "5b3d6ad538f61a197ab66a98f64bb78e2c8758a2f009394b0c42018ff23b4d22"
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "073977946dc96a31ce36c94441853edafc2b13e8d20b8b283a328efb760a1455"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "40bee716cd339fc7cfc4391fcc12d2b3ac9ee9b82611fd23eb56f3c065950e0b"
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
