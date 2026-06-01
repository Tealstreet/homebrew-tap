# Homebrew formula for Tealstreet CLI
# This file should be published to a homebrew tap repo (e.g., homebrew-tap)

class Tealstreet < Formula
  desc "Trade crypto from your terminal - Tealstreet CLI"
  homepage "https://tealstreet.io"
  version "0.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-arm64"
      sha256 "6ff1459207647e0f1a7bd01862a844ff5482bee4f52c83e9520834909d17894a"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-x64"
      sha256 "b6ea16e3c72aef4a2c05df3d97ab51c6553c4ef0e44cd4169f7c5aa8def3437f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-arm64"
      sha256 "e89b4c3f94b75f41aa5db69e2b5ad461431b1df92789bdd04cba95d9c5c06354"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-x64"
      sha256 "abd879cb74efb06b52721ef8399a137806e3d5cd82325a16104c0b628cf0a5de"
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
