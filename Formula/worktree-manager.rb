class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/v0.1.11/worktree-manager.tar.gz"
  sha256 "2f7b20ffe7e902a28139f0cfca92d918e4576cd45ce7c254c025b0a1098928bc"
  license "MIT"

  depends_on "babashka"

  def install
    libexec.install "src"
    bin.install "bin/wtm"
  end

  test do
    system "#{bin}/wtm", "--help"
  end
end
