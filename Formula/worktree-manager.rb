class WorktreeManager < Formula
  desc "A CLI tool for managing Git worktrees"
  homepage "https://github.com/bolivier/worktree-manager"
  url "https://github.com/bolivier/worktree-manager/releases/download/v1.1.2/worktree-manager.tar.gz"
  sha256 "8d5b110f343f6512fdf53f74a3da9a02cf563967c217f66fbdaaecfd15d4b8dc"
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
