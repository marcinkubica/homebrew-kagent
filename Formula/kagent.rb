class Kagent < Formula
  desc "kagent: CLI agent for Cloud Native Agentic AI"
  homepage "https://github.com/kagent-dev/kagent"
  version "0.7.4"
  license "Apache-2.0"

  disable! date: "2025-11-17", because: "Tap retired; use homebrew/core formula"

  def caveats
    <<~EOS
      This tap has been retired. Please switch to the official Homebrew/core
      formula with the following commands:

        brew untap marcinkubica/kagent
        brew install kagent
    EOS
  end

end 
