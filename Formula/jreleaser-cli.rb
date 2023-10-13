# Generated with JReleaser 1.8.0 at 2023-10-13T16:33:22.611666+02:00
class JreleaserCli < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://github.com/dotCMS/jreleaser-cli"
  url "https://github.com/dotCMS/jreleaser-cli/releases/download/23.09.3/jreleaser-cli-23.09.3.jar", :using => :nounzip
  version "23.09.3"
  sha256 "7d4f5b82055adcb29c384773a8197cda181f79944015f4584e58e60b191cd0b4"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "jreleaser-cli-23.09.3.jar"

    bin.mkpath
    File.open("#{bin}/jreleaser-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/jreleaser-cli-23.09.3.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/jreleaser-cli --version")
    assert_match "23.09.3", output
  end
end
