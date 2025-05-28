class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.5/driftminer-0.1.5_darwin_arm64.tar.gz"
  sha256 "e472bee2733f73ac2e87e665559f65b38f2715e382e941b1843353f7a32898e6"
  version "0.1.5"

  def install
    bin.install "driftminer"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


