class Driftminer < Formula
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3"
    site_packages = prefix/"lib/python3.12/site-packages"
    site_packages.mkpath

    ENV["PYTHONPATH"] = "#{buildpath}:#{site_packages}"
    ENV["PIP_VERBOSE"] = "1"
    
    # Ensure setup.py exists
    unless File.exist?("setup.py")
      raise "setup.py not found in #{buildpath}"
    end

    # Install in development mode with pip
    system python, "-m", "pip", "install", "-v", "-e", ".", "--prefix=#{prefix}"

    bin.install_symlink Dir["#{prefix}/bin/*"]
  end

  test do
    system bin/"driftminer", "--version"
  end
end
