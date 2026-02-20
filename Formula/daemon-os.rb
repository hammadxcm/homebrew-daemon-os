class DaemonOs < Formula
  desc "macOS MCP server for AI agent computer-use"
  homepage "https://github.com/hammadxcm/daemon-os"
  url "https://github.com/hammadxcm/daemon-os/releases/download/v3.0.0/daemon-os-v3.0.0-macos-universal.tar.gz"
  sha256 "0ab5c77642c77ff4599b0fd59444356d35232aa8a3295b77d58ca9ca69ef1928"
  version "3.0.0"
  license "MIT"

  def install
    bin.install "daemon"
    share.install "DAEMON-MCP.md"
    (share/"daemon-os/recipes").install Dir["recipes/*.json"]
  end

  def post_install
    ohai "Run 'daemon setup' to configure permissions and MCP clients"
  end

  test do
    assert_match "3.0.0", shell_output("#{bin}/daemon version")
  end
end
