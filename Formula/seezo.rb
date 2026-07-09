# typed: false
# frozen_string_literal: true

class Seezo < Formula
  desc "Run Seezo Security Design Reviews from the terminal or CI"
  homepage "https://seezo.io"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.0/seezo_0.1.0_darwin_arm64.tar.gz"
      sha256 "37a2256d625479d227f8e7d1cb2e5a2dd27e00dcb048ec06ae1adedc91eab330"
    else
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.0/seezo_0.1.0_darwin_amd64.tar.gz"
      sha256 "3c5beb4ae5653eb091ab1e7da458e2385fbdf8256231717bc83226911ad362ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.0/seezo_0.1.0_linux_arm64.tar.gz"
      sha256 "76281ce0bfbc2c88fee3bc8bc42699a984f1f8b2ca10698b3c0a4b7790f2fbb9"
    else
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.0/seezo_0.1.0_linux_amd64.tar.gz"
      sha256 "7c576a457c5c9b05befb3cfb536490a5a3db90a9543d7a8e1ac50501570bb49c"
    end
  end

  def install
    bin.install "seezo"
  end

  test do
    assert_match "seezo", shell_output("#{bin}/seezo version")
  end
end
