# Homebrew formula for Tealstreet CLI
# This file should be published to a homebrew tap repo (e.g., homebrew-tap)

class Tealstreet < Formula
  desc "Trade crypto from your terminal - Tealstreet CLI"
  homepage "https://tealstreet.io"
  version "0.10.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-arm64"
      sha256 "5a7c55a0d19c13644987ebcd8ea3d9658f37bd71c57b9c2d526b207f46e6f95f"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-x64"
      sha256 "81c4d33fe2d9e91fa1c0159dba2d44770c85b5943a28437a0c840935c6a2df73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-arm64"
      sha256 "0fc7dec4bcbd5a927827fb1fecf5c89a2f55d0ebcb84dd64b944ebd3988d3073"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-x64"
      sha256 "5ef3f147bd198e46f4d5b0f2a182dde2c0ec243c464fa0ad93aab4a7148a50d1"
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
