# Generated with JReleaser 1.8.0 at 2023-09-11T18:27:20.496382+02:00
class DotcmsCli < Formula
  desc "app -- DotCMS CLI"
  homepage "https://dotcms.com"
  url "https://github.com/dotCMS/core/releases/download/dotcli1.0.0/dotcli-1.0.0.jar", :using => :nounzip
  version "1.0.0"
  sha256 "4ef94d2183d79f043eba0927b063d9648ca6261b4ad957dab0f39eb332e21a34"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "dotcli-1.0.0.jar"

    bin.mkpath
    File.open("#{bin}/dotcms-cli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/dotcli-1.0.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/dotcms-cli --version")
    assert_match "1.0.0", output
  end
end
