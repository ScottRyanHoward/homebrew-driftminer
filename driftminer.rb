class Driftminer < Formula
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3"
    ENV["PYTHONPATH"] = lib/"python3.12/site-packages"

    resources.each do |r|
      r.stage do
        system python, "-m", "pip", "install", ".", "--target=#{lib}/python3.12/site-packages"
      end
    end

    system python, "-m", "pip", "install", ".", "--target=#{lib}/python3.12/site-packages"
    bin.install_symlink Dir["#{lib}/python3.12/site-packages/bin/*"]
  end

  test do
    system bin/"driftminer", "--version"
  end
end
