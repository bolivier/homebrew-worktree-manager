class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/v1.0.1/worktree-manager.tar.gz"
  sha256 "82aed39c5fc8f73f4b6d9ac03e7b1a767ad7248f2da54538bd88f05b6954cdcf"
  license "MIT"

  depends_on "borkdude/brew/babashka"

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
