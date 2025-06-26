class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/v1.1.5/worktree-manager.tar.gz"
  sha256 "6a0ade7c86d495ffb47fead675bb19f0b885ed2780b337825a8396a0746c7aa1"
  license "MIT"

  depends_on "borkdude/brew/babashka"
  depends_on "fzf"
  depends_on "gum"

  def install
    libexec.install "src"
    libexec.install "bb.edn"
    bin.install "bin/wtm"

    (share/"wtm").install "resources/shell-integration/wtm.fish", "resources/shell-integration/wtm.bash", "resources/shell-integration/wtm.zsh"

    bash_completion.install "resources/autocomplete/wtm-completion.bash" => "wtm"
    zsh_completion.install  "resources/autocomplete/wtm-completion.zsh"  => "_wtm"
    fish_completion.install "resources/autocomplete/wtm.fish"
  end

  def caveats
    <<~EOS
In order to use the `switch` command you'll need to add the wtm function to your shell like this:
# ~/.bashrc or ~/.bash_profile
source $(brew --prefix)/share/wtm/wtm.bash

# ~/.zshrc
source $(brew --prefix)/share/wtm/wtm.zsh

# Fish
# Create a symlink or use `source` in config.fish
ln -s (brew --prefix)/share/wtm/wtm.fish ~/.config/fish/functions/wtm.fish
# OR
source (brew --prefix)/share/wtm/wtm.fish
  EOS
  end

  test do
    system "#{bin}/wtm", "--help"
  end
end
