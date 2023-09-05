# Generated with JReleaser 1.8.0 at 2023-09-05T16:00:38.633312+02:00
class JreleaserCli < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://github.com/dotCMS/jreleaser-cli"
  url "https://github.com/dotCMS/jreleaser-cli/releases/download/v1.8.0/jreleaser-cli-1.8.0.jar", :using => :nounzip
  version "1.8.0"
  sha256 "918a43c7c36eddf87f37cee7caf7d7a37943d2a595c49772e0b94004bb171fce"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "jreleaser-cli-1.8.0.jar"

    bin.mkpath
    File.open("#{bin}/jreleaser-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/jreleaser-cli-1.8.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/jreleaser-cli --version")
    assert_match "1.8.0", output
  end
end
