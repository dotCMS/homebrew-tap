# Generated with JReleaser 1.8.0 at 2023-11-09T13:36:17.033576+01:00
class QcliJbang < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://www.dotcms.com"
  url "https://github.com/dotCMS/qcli-jbang/releases/download/v1.4.0/qcli-jbang-1.4.0.jar", :using => :nounzip
  version "1.4.0"
  sha256 "ca6f0c7029731748feec0bc767379636c343bf07b67a8e34492ce061819fd60d"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "qcli-jbang-1.4.0.jar"

    bin.mkpath
    File.open("#{bin}/qcli-jbang", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/qcli-jbang-1.4.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/qcli-jbang --version")
    assert_match "1.4.0", output
  end
end
