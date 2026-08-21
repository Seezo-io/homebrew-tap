# typed: false
# frozen_string_literal: true

class GitHubPrivateReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise "Set HOMEBREW_GITHUB_API_TOKEN to a GitHub token with access to Seezo-io/cli" if token.blank?

    meta[:headers] = Array(meta[:headers]) + [
      "Accept: application/octet-stream",
      "Authorization: Bearer #{token}",
      "X-GitHub-Api-Version: 2022-11-28",
    ]
    super
  end
end

class Seezo < Formula
  desc "Run and manage Seezo security assessments"
  homepage "https://seezo.io"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/523842873",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "f660c8d9c528d861fb8cf1a93fe2139a710afe33ce9c1f5ae3eb7a5bed51fe85"
    else
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/523842871",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "5cdf3e97e3f5b23b2f1044046c2cf56aad7f2182ef7dd44cc705d68b1d6322a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/523842900",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "c38669527f32dccaba74355686ab7c4db3b0a220971cb33a97650a64c390dcd6"
    else
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/523842899",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "27e77da80c88cd2d9c8606c76d14d2e4f6d93785154c62a2ad9b2c2f179b70a7"
    end
  end

  def install
    bin.install "seezo"
  end

  test do
    assert_match "seezo", shell_output("#{bin}/seezo version")
  end
end
