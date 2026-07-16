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
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/479559412",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "dd2858d05d32b7c31b6a29445dfeba79748afe15456b289236c199c39a356b83"
    else
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/479559427",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "dbbda32b41faa2d3a4a214581e78f07c1aa4f6692040850af173685ebfd7a980"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/479559402",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "4b3337c9c4227e8059ae0b50f4edc3dbd8d44b97f6b9d2e83fcba2a226632c0e"
    else
      url "https://api.github.com/repos/Seezo-io/cli/releases/assets/479559403",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "7f4faeeea6c221be3793990b83e818c97866e1d4b8b518c32a419d31d19750df"
    end
  end

  def install
    bin.install "seezo"
  end

  test do
    assert_match "seezo", shell_output("#{bin}/seezo version")
  end
end
