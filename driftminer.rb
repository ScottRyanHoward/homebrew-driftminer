class Driftminer < Formula
  include Language::Python::Virtualenv
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  license "MIT"

  depends_on "python@3.12"

  def install
    system_command Formula["python@3.12"].bin/"pip3",
      args: ["install", "--prefix=#{prefix}", "--no-deps", buildpath]
  end

  test do
    system bin/"driftminer", "--version"
  end
end
