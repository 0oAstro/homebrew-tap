class Pi < Formula
  desc "AI coding assistant CLI - Bun-compiled binary for fast startup"
  homepage "https://pi.dev/"
  url "https://registry.npmjs.org/@earendil-works/pi-coding-agent/-/pi-coding-agent-0.74.0.tgz"
  sha256 "974a73b96195bd7d630e115869ecb5e0dd7a5c3a38ee4926dc99448663d4a344"
  license "MIT"

  depends_on "bun" => :build

  def install
    # npm tarball extracts into a package/ subdirectory
    cd "package" do
      # Install npm dependencies
      system "npm", "install", "--production", "--ignore-scripts"

      # Build the standalone binary with Bun
      system "bun", "build", "--compile",
             "./dist/bun/cli.js",
             "--outfile", "pi"

      # Install binary into libexec
      libexec_bin = libexec/"bin"
      libexec_bin.install "pi"

      # Install runtime assets alongside the binary
      libexec.install "package.json"

      # Themes
      (libexec/"theme").mkpath
      (libexec/"theme").install Dir["dist/modes/interactive/theme/*.json"]

      # Interactive assets (branding PNGs)
      (libexec/"assets").mkpath
      (libexec/"assets").install Dir["dist/modes/interactive/assets/*.png"]

      # Export-HTML templates
      (libexec/"export-html").mkpath
      (libexec/"export-html").install Dir["dist/core/export-html/*"]

      # Photon WASM - needed by @silvia-odwyer/photon-node at runtime
      wasm = Dir["node_modules/@silvia-odwyer/photon-node/photon_rs_bg.wasm"].first
      libexec.install wasm if wasm

      # Symlink the binary into bin
      bin.install_symlink libexec_bin/"pi"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pi --version 2>&1")

    ENV["GEMINI_API_KEY"] = "invalid_key"
    output = shell_output("#{bin}/pi -p 'foobar' 2>&1", 1)
    assert_match "API key not valid", output
  end
end
