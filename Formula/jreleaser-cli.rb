# Generated with JReleaser 1.8.0 at 2023-09-10T10:19:15.426931+02:00
class JreleaserCli < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://github.com/dotCMS/jreleaser-cli"
  url "https://github.com/dotCMS/jreleaser-cli/releases/download/23.09.1/jreleaser-cli-23.09.1.jar", :using => :nounzip
  version "23.09.1"
  sha256 "15547195480cb23f7bde77cd2ab5f28ad265e500f063e5431ab4b58449cdd725"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "jreleaser-cli-23.09.1.jar"

    bin.mkpath
    File.open("#{bin}/jreleaser-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/jreleaser-cli-23.09.1.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/jreleaser-cli --version")
    assert_match "23.09.1", output
  end
end
