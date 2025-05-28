class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.2/driftminer-0.1.2.tar.gz"
  sha256 "40f9a6b82d16357d4e9cc32c4ea39c9e8631f5ef5dd4be71e8a65eb5ecae8c70"
  version "0.1.2"

  def install
    bin.install "driftminer"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


