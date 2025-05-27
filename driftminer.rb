class Driftminer < Formula
  include Language::Python::Virtualenv

  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9d430e63390bc1091f7f1051953a1fa1b53e520a0e61873b8957eb9521f503ef"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Install pip first
    system "/opt/homebrew/opt/python@3.12/bin/python3.12", "-m", "ensurepip"
    system "/opt/homebrew/opt/python@3.12/bin/python3.12", "-m", "pip", "install", "--upgrade", "pip"
    virtualenv_install_with_resources
  end

  test do
    system bin/"driftminer", "--version"
  end
end
