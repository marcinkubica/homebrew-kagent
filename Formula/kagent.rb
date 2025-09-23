class Kagent < Formula
  desc "kagent: CLI agent for Cloud Native Agentic AI"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.6.15"
  license "Apache-2.0"

  # URL and checksum will be updated per-release
  if OS.mac?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-arm64"
      sha256 "a286f4bcd58a79771765d7a126fd03ae7f03aa3a5162788323a2d7ce4d6589db"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-darwin-amd64"
      sha256 "f1af180c8dc598ce27d0be0cc23761ade96f01f22ed08f8224f6df275ee34938"
    end
  elsif OS.linux?
    on_arm do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-arm64"
      sha256 "1b436d8d1f99f249bca404b61bcd9ef306a4d4fd73ca9d1b76f90e5218b4e809"
    end

    on_intel do
      url "https://github.com/kagent-dev/kagent/releases/download/v#{version}/kagent-linux-amd64"
      sha256 "0fe630b64427f64d5f914e2de10b65e6e4ab897920c9b2f17ef2f501861fff3d"
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
