class Driftminer < Formula
  desc "Drift Detection as Code"
  homepage "https://github.com/ScottRyanHoward/driftminer"
  url "https://github.com/ScottRyanHoward/driftminer/releases/download/v0.1.5/driftminer-0.1.5_darwin_arm64.tar.gz"
  sha256 "e472bee2733f73ac2e87e665559f65b38f2715e382e941b1843353f7a32898e6"
  version "0.1.5"

  depends_on "python@3.11"

  def install
    # First move the binary to a safe location
    mv buildpath/"driftminer", buildpath/"driftminer.bin"
    
    # Install the binary to libexec
    libexec.install buildpath/"driftminer.bin" => "driftminer"
    
    # Create a small shell script in bin
    (bin/"driftminer").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/driftminer" "$@"
    EOS
    chmod 0755, bin/"driftminer"
  end

  test do
    system "#{bin}/driftminer", "--help"
  end
end


