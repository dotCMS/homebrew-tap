# Generated with JReleaser 1.7.0 at 2023-09-04T20:42:30.761725+02:00
class JreleaserCli < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://github.com/dotCMS/jreleaser-cli"
  url "https://github.com/dotCMS/jreleaser-cli/releases/download/1.1.0/jreleaser-cli-1.1.0-runner.jar", :using => :nounzip
  version "1.1.0"
  sha256 "73a092df45d99e69ede80dc233fa7e263398d75485cbe2fdf65266ce8d8a5157"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "jreleaser-cli-1.1.0-runner.jar"

    bin.mkpath
    File.open("#{bin}/jreleaser-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/jreleaser-cli-1.1.0-runner.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/jreleaser-cli --version")
    assert_match "1.1.0", output
  end
end
