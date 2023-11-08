# Generated with JReleaser 1.8.0 at 2023-11-08T18:47:34.631276+01:00
class QcliJbang < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://www.dotcms.com"
  url "https://github.com/dotCMS/qcli-jbang/releases/download/v1.2.0/qcli-jbang-1.2.0.jar", :using => :nounzip
  version "1.2.0"
  sha256 "448ff4f7ac3b3aac098d2f45a4b8112ca2f86ce35e906de59dc0210b59341c39"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "qcli-jbang-1.2.0.jar"

    bin.mkpath
    File.open("#{bin}/qcli-jbang", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/qcli-jbang-1.2.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/qcli-jbang --version")
    assert_match "1.2.0", output
  end
end
