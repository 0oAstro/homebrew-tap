class LazydockerNg < Formula
  desc "A simple terminal UI for both docker and docker-compose (patched for Docker 29.x)"
  homepage "https://github.com/0oAstro/lazydocker-ng"
  version "0.25.1-patched"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/0oAstro/lazydocker-ng/releases/download/v0.25.1-patched/lazydocker-ng-darwin-arm64.tar.gz"
      sha256 "bef16cd7d968e00964f6e689fa3bf3e2372e7c4afa534b731223b000ec9fe375"

      def install
        bin.install "lazydocker-ng-darwin-arm64" => "lazydocker-ng"
      end
    end
    on_intel do
      url "https://github.com/0oAstro/lazydocker-ng/releases/download/v0.25.1-patched/lazydocker-ng-darwin-amd64.tar.gz"
      sha256 "8a13769e63710b13300430422086facc65917c8aa6ff3049bf1400fe4645d473"

      def install
        bin.install "lazydocker-ng-darwin-amd64" => "lazydocker-ng"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/0oAstro/lazydocker-ng/releases/download/v0.25.1-patched/lazydocker-ng-linux-amd64.tar.gz"
      sha256 "8aae4b8095137731381162dfbb098f205175b983cc8e5e64bb4caafab6934c20"

      def install
        bin.install "lazydocker-ng-linux-amd64" => "lazydocker-ng"
      end
    end
  end

  test do
    assert_match "version", shell_output("#{bin}/lazydocker-ng --version 2>&1", 1)
  end
end
