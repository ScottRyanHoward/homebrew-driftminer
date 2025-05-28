class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.4/driftminer-0.1.4.tar.gz"
  sha256 "76fb5f3de7046452ef2fe837a9c5ad65df3bf5bfd317ad79643be273b632ec2f"
  version "0.1.4"

  def install
    bin.install "driftminer"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


