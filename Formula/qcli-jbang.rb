# Generated with JReleaser 1.8.0 at 2023-11-09T13:52:58.95692+01:00
class QcliJbang < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://www.dotcms.com"
  url "https://github.com/dotCMS/qcli-jbang/releases/download/qcli1.6.0/qcli-jbang-1.6.0.jar", :using => :nounzip
  version "1.6.0"
  sha256 "e3e48054e66256ee97c12696e445118d1d62d19be9ec6ee8208716ab3010589c"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "qcli-jbang-1.6.0.jar"

    bin.mkpath
    File.open("#{bin}/qcli-jbang", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/qcli-jbang-1.6.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/qcli-jbang --version")
    assert_match "1.6.0", output
  end
end
