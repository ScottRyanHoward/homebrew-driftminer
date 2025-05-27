class Driftminer < Formula
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  license "MIT"

  depends_on "python@3.12"

  resource "virtualenv" do
    url "https://files.pythonhosted.org/packages/d6/45/cf2c3c08348a6bd6a2b7f3c1347f0d40f36df0f2f7980dd9c3a27b9dc4c6/virtualenv-20.25.0.tar.gz"
    sha256 "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b86959257378aef020e1f1b"
  end

  def install
    python = Formula["python@3.12"].opt_bin/"python3"
    venv = libexec

    # Install virtualenv
    resource("virtualenv").stage do
      system python, "-m", "pip", "install", ".", "--target=#{libexec}"
    end

    # Create virtualenv
    ENV.prepend_path "PYTHONPATH", libexec
    system python, "-m", "virtualenv", "#{venv}"
    venv_python = venv/"bin/python"

    # Install driftminer in virtualenv
    system venv_python, "-m", "pip", "install", "."

    # Create symlinks
    bin.install_symlink Dir["#{venv}/bin/*"]
  end

  test do
    system bin/"driftminer", "--version"
  end
end
