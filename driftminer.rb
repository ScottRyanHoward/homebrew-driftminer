class Driftminer < Formula
  desc "Drift Detection as Code - Define custom infrastructure drift detection rules"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  license "MIT"

  depends_on "python@3.12"

  resource "virtualenv" do
    url "https://files.pythonhosted.org/packages/0b/84/f44ceb8d98d7c5a14b9cfe7069f9d30dcbee2b7b8ea2eebd3430c573a1b8/virtualenv-20.24.7.tar.gz"
    sha256 "69050ffb42419c91f6c1284a7b24e0475d793447e35929b488bf6a0aade39353"
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
