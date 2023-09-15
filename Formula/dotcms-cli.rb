# Generated with JReleaser 1.8.0 at 2023-09-15T20:03:33.136185+02:00
class DotcmsCli < Formula
  desc "app -- DotCMS CLI"
  homepage "https://dotcms.com"
  url "https://github.com/dotCMS/core/releases/download/dotcli1.2.0/dotcli-1.2.0.jar", :using => :nounzip
  version "1.2.0"
  sha256 "858f506e5920cfcf9826bd9a255ef946720d29cda39fab409011f59bd09f20a2"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "dotcli-1.2.0.jar"

    bin.mkpath
    File.open("#{bin}/dotcms-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/dotcli-1.2.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/dotcms-cli --version")
    assert_match "1.2.0", output
  end
end
