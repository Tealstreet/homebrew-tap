# Homebrew formula for Tealstreet CLI
# This file should be published to a homebrew tap repo (e.g., homebrew-tap)

class Tealstreet < Formula
  desc "Trade crypto from your terminal - Tealstreet CLI"
  homepage "https://tealstreet.io"
  version "0.10.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-arm64"
      sha256 "7dd0949a14a355e7846122b696414dd32ff069372fe22babd0e942805756c393"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-darwin-x64"
      sha256 "53478e9725802a409ceb8711e0ef18f0a513d33adfbf88ad4893fa8b78e278c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-arm64"
      sha256 "5ee5f02b8bbb106a3aba66422bc1628e0d8ac99b69fff1bcb04daf841358fe10"
    else
      url "https://github.com/Tealstreet/cli/releases/download/v#{version}/tealstreet-linux-x64"
      sha256 "c7bb9d0127556512545d9095f58553ba7443ef3eba2382f0c018bf26b1b976d7"
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
