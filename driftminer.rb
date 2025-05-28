class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.3/driftminer-0.1.3.tar.gz"
  sha256 "d55da981c65acc102eb9f3de4a675ff07a0216305e5d50bd3504059b58a63236"
  version "0.1.3"

  def install
    bin.install "driftminer"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


