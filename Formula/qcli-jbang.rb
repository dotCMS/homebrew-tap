# Generated with JReleaser 1.8.0 at 2023-10-18T13:30:20.588194+02:00
class QcliJbang < Formula
  desc "app -- Sample Quarkus CLI application"
  homepage "https://www.dotcms.com"
  url "https://github.com/dotCMS/qcli-jbang/releases/download/v1.0.0/qcli-jbang-1.0.0.jar", :using => :nounzip
  version "1.0.0"
  sha256 "997d50e21849ff4e08c14ed604e02728b765ffcb8952aa0e0068e6d2e780798c"
  license "Apache-2.0"

  depends_on "openjdk@11"

  def install
    libexec.install "qcli-jbang-1.0.0.jar"

    bin.mkpath
    File.open("#{bin}/qcli-jbang", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/qcli-jbang-1.0.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/qcli-jbang --version")
    assert_match "1.0.0", output
  end
end
