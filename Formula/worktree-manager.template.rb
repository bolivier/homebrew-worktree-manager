class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/__VERSION__/worktree-manager.tar.gz"
  sha256 "__SHA__"
  license "MIT"

  depends_on "babashka"

  def install
    libexec.install "src"
    bin.install "bin/wtm"

    bash_completion.install "resources/autocomplete/wtm-completion.bash" => "wtm"
    zsh_completion.install  "resources/autocomplete/wtm-completion.zsh"  => "_wtm"
    fish_completion.install "resources/autocomplete/wtm.fish"
  end

  test do
    system "#{bin}/wtm", "--help"
  end
end
