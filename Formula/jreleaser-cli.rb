# Generated with JReleaser 1.7.0 at 2023-08-30T15:43:41.40911+02:00
class JreleaserCli < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://github.com/dotCMS/jreleaser-cli"
  url "https://github.com/dotCMS/jreleaser-cli/releases/download/1.0.0/jreleaser-cli-1.0.0-osx-aarch_64.zip"
  version "1.0.0"
  sha256 "d54067615cebbc537e747d129c866de46afee981230646fa8ed763cfb4806b5c"
  license "Apache-2.0"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/jreleaser-cli" => "jreleaser-cli"
  end

  test do
    output = shell_output("#{bin}/jreleaser-cli --version")
    assert_match "1.0.0", output
  end
end
