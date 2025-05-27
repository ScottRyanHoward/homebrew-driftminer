class Driftminer < Formula
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    ENV["VIRTUAL_ENV"] = venv
    ENV.delete "PYTHONPATH"

    system Formula["python@3.12"].bin/"python3", "-m", "venv", venv
    ENV["PATH"] = "#{venv}/bin:#{ENV["PATH"]}"

    system "#{venv}/bin/pip", "install", "."
    system "#{venv}/bin/pip", "freeze", ">", "requirements.txt"
  end

  test do
    system bin/"driftminer", "--version"
  end
end
