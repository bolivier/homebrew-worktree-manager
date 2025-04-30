class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/v1.0.0/worktree-manager.tar.gz"
  sha256 "860d914afa4b264952df3425aadd0f8971d7dd683f4be0fe4574184443d5664d"
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
