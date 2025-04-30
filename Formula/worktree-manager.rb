#!/usr/bin/env ruby

class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "17269cf68804c0435bf256e598e5c621327e5979109e274cbfb34c4d275503ac"
  license "MIT"

  depends_on "babashka"

  def install
    bin.install "bin/wtm"
  end

  test do
    system "#{bin}/wtm", "--help"
  end
end
