class Driftminer < Formula
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9d430e63390bc1091f7f1051953a1fa1b53e520a0e61873b8957eb9521f503ef"
  license "MIT"

  depends_on "python@3.12"

  def install
    ENV["PYTHONPATH"] = libexec/"lib/python3.12/site-packages"
    system "python3.12", "-m", "pip", "install", ".", "--target=#{libexec}/lib/python3.12/site-packages"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", PYTHONPATH: ENV["PYTHONPATH"])
  end

  test do
    system bin/"driftminer", "--version"
  end
end
