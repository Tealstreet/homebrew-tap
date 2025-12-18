# Homebrew formula for Tealstreet CLI
# This file should be published to a homebrew tap repo (e.g., homebrew-tap)

class Tealstreet < Formula
  desc "Trade crypto from your terminal - Tealstreet CLI"
  homepage "https://tealstreet.io"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-arm64"
      sha256 "e5eaa0ba2119409d41cd5da10f10f14b5e0adb483b3a25a22dac854397ffe49c"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-x64"
      sha256 "1d95172289994be546baaea0c1f72775ab00d2b0096345e6f50f0c514c12e9bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-arm64"
      sha256 "48e87ebaec114781a0951b0358dfa3fa98665d8c0d2111e73ed7356ddca49ec1"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-x64"
      sha256 "9b9225743fb208f41d8b5b12848b1de73b7d5c63b126e0ba315737f9c1e2e49e"
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
