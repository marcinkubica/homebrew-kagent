class Kagent < Formula
  desc "kagent: CLI agent for Kubernetes automation"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.4.0"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "82bdd439ef348c3298f1a81f334fa8bbf6cc7687eeaef13da34726667b5305b7" # darwin-arm64
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "80223d585ca55a81aa81e48b481ec5c25d226ec907dd3fbf9b4a86d59f087e12" # darwin-amd64
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "c761a3a39c59fd2ef6f680a299b7eaf914f3d21572319dde55a5fd4ae781e9df" # linux-arm64
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "5040aa847b2a328e502f9456ef6d10a5c3ddeb5f5e8e196bcf9c7e53c7c2f14d" # linux-amd64
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
