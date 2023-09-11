# Generated with JReleaser 1.8.0 at 2023-09-11T18:20:18.392602+02:00
class DotcmsCli < Formula
  desc "app -- DotCMS CLI"
  homepage "https://dotcms.com"
  url "https://github.com/dotCMS/core/releases/download/dotcli1.0.0/cli-1.0.0.jar", :using => :nounzip
  version "1.0.0"
  sha256 "71befe42da9533b90ee59c8e9a7d82d478d14d1087bdcdd9d0ba5b93a6d513e1"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "cli-1.0.0.jar"

    bin.mkpath
    File.open("#{bin}/dotcms-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/cli-1.0.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/dotcms-cli --version")
    assert_match "1.0.0", output
  end
end
