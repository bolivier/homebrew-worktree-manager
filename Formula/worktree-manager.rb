class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/v1.1.0/worktree-manager.tar.gz"
  sha256 "38b08b14942c0c16773388e7d5ac13ffcc0384cfbd6fc858a800cd5cf18f6d80"
  license "MIT"

  depends_on "borkdude/brew/babashka"
  depends_on "fzf"

  def install
    libexec.install "src"
    bin.install "bin/wtm"

    (share/"wtm").install "resources/shell-integration/wtm.fish", "resources/shell-integration/wtm.bash", "resources/shell-integration/wtm.zsh"

    bash_completion.install "resources/autocomplete/wtm-completion.bash" => "wtm"
    zsh_completion.install  "resources/autocomplete/wtm-completion.zsh"  => "_wtm"
    fish_completion.install "resources/autocomplete/wtm.fish"

    puts "In order to use the `switch` command you'll need to add the wtm function to your shell like this:
# ~/.bashrc or ~/.bash_profile
source $(brew --prefix)/share/wtm/wtm.bash

# ~/.zshrc
source $(brew --prefix)/share/wtm/wtm.zsh

# Fish
# Create a symlink or use `source` in config.fish
ln -s (brew --prefix)/share/wtm/wtm.fish ~/.config/fish/functions/wtm.fish
# OR
source (brew --prefix)/share/wtm/wtm.fish
"
  end

  test do
    system "#{bin}/wtm", "--help"
  end
end
