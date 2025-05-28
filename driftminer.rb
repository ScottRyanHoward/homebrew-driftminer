class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.5/driftminer-0.1.5_darwin_arm64.tar.gz"
  sha256 "e472bee2733f73ac2e87e665559f65b38f2715e382e941b1843353f7a32898e6"
  version "0.1.5"

  depends_on "python@3.11"

  def install
    # Extract and verify the binary
    binary_path = "driftminer"
    ohai "Installing binary from #{binary_path}"
    chmod 0755, binary_path
    
    # Install the binary directly without a wrapper
    bin.install binary_path
    
    # Verify the installation
    system bin/binary_path, "--version" if build.with? "test"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


