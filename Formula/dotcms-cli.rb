# Generated with JReleaser 1.8.0 at 2023-09-11T14:39:39.219393+02:00
class DotcmsCli < Formula
  desc "app -- DotCMS CLI"
  homepage "https://dotcms.com"
  url "https://github.com/dotCMS/core/releases/download/23.09/cli-23.09.jar", :using => :nounzip
  version "23.09"
  sha256 "4ccd09082e5ab8df9132be465d4b1c1658e266a36a6a50e3be136eebe5796885"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "cli-23.09.jar"

    bin.mkpath
    File.open("#{bin}/dotcms-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/cli-23.09.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/dotcms-cli --version")
    assert_match "23.09", output
  end
end
