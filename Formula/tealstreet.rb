# Homebrew formula for Tealstreet CLI
# This file should be published to a homebrew tap repo (e.g., homebrew-tap)

class Tealstreet < Formula
  desc "Trade crypto from your terminal - Tealstreet CLI"
  homepage "https://tealstreet.io"
  version "0.10.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-arm64"
      sha256 "4ad9beb6a5accf0516ab7e18e78174ae18e83f640a0a496091b043999fd2930f"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-x64"
      sha256 "5e916c139ead1c7053f2ef583c42ad1f5708f5006ccbc06072fc38abd9272a02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-arm64"
      sha256 "919132149fe1a71822c3334abb8000e7015fd0159d77b22356f53faf30a5b382"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-x64"
      sha256 "e388ad5220cbf4963f3c93b89c323287f710518b4174e70355014c4042e263a9"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "tealstreet-darwin-arm64" : "tealstreet-darwin-x64"
    else
      Hardware::CPU.arm? ? "tealstreet-linux-arm64" : "tealstreet-linux-x64"
    end

    bin.install binary_name => "tealstreet"
  end

  test do
    assert_match "Tealstreet CLI", shell_output("#{bin}/tealstreet --version")
  end
end
