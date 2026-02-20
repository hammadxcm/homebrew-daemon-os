class DaemonOs < Formula
  desc "macOS MCP server for AI agent computer-use"
  homepage "https://github.com/hammadxcm/daemon-os"
  url "https://github.com/hammadxcm/daemon-os/releases/download/v1.0.1/daemon-os-v1.0.1-macos-universal.tar.gz"
  sha256 "0b6ca3269036c839b575bf061115a11364392896a6b8116e063f6d5731ae0576"
  version "1.0.1"
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
    assert_match "1.0.1", shell_output("#{bin}/daemon version")
  end
end
