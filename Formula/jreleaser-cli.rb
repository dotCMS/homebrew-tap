# Generated with JReleaser 1.8.0 at 2023-09-08T18:53:02.954937+02:00
class JreleaserCli < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://github.com/dotCMS/jreleaser-cli"
  url "https://github.com/dotCMS/jreleaser-cli/releases/download/v23.09/jreleaser-cli-23.09.jar", :using => :nounzip
  version "23.09"
  sha256 "7746cbd90747a65c7d9297c7121aad283e42d9c476f9780c92424db3cbb3cb36"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "jreleaser-cli-23.09.jar"

    bin.mkpath
    File.open("#{bin}/jreleaser-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/jreleaser-cli-23.09.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/jreleaser-cli --version")
    assert_match "23.09", output
  end
end
