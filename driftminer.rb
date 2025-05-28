class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.3/driftminer-0.1.3.tar.gz"
  sha256 "36452857aba40330e057489952a47449b77f659c171e80ca21c5167a9fc514e2"
  version "0.1.3"

  def install
    bin.install "driftminer"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


