# typed: false
# frozen_string_literal: true

class Seezo < Formula
  desc "Run Seezo Security Design Reviews from the terminal or CI"
  homepage "https://seezo.io"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.2/seezo_0.1.2_darwin_arm64.tar.gz"
      sha256 "f964d112aa96b4012a34f051baef67dcf3def9a8244246329b44d48518ddfbb6"
    else
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.2/seezo_0.1.2_darwin_amd64.tar.gz"
      sha256 "3d42c1bab168d20891b6c479a56dec145f63090a1be8bcf95a8cbeed2fb68280"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.2/seezo_0.1.2_linux_arm64.tar.gz"
      sha256 "56ff7bfb9b4c06faf1b441117874b133699cc96d48fa37b6ce4e9348cb05d4af"
    else
      url "https://github.com/Seezo-io/cli/releases/download/v0.1.2/seezo_0.1.2_linux_amd64.tar.gz"
      sha256 "f70168577df53bf8ded9c536aa0cb0b456819d0d957dab67499a09af7faacafe"
    end
  end

  def install
    bin.install "seezo"
  end

  test do
    assert_match "seezo", shell_output("#{bin}/seezo version")
  end
end
