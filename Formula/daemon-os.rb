class DaemonOs < Formula
  desc "macOS MCP server for AI agent computer-use"
  homepage "https://github.com/hammadxcm/daemon-os"
  url "https://github.com/hammadxcm/daemon-os/releases/download/v1.0.0/daemon-os-v1.0.0-macos-universal.tar.gz"
  sha256 "7e67704b79d674e5358081120a67a3cdef85ce9f819a2758d5b1bccf3713d133"
  version "1.0.0"
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
    assert_match "1.0.0", shell_output("#{bin}/daemon version")
  end
end
