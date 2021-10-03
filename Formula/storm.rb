class Storm < Formula
  desc "Distributed realtime computation system to process data streams"
  homepage "https://storm.apache.org"
  url "https://www.apache.org/dyn/closer.lua?path=storm/apache-storm-2.3.0/apache-storm-2.3.0.tar.gz"
  mirror "https://archive.apache.org/dist/storm/apache-storm-2.3.0/apache-storm-2.3.0.tar.gz"
  sha256 "49c2255b26633c6fd96399c520339e459fcda29a0e7e6d0c8775cefcff6c3636"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "0b7ee5cb1ed1a1454bd11d0c62f0953214d689fb904b7abc14bc92ac9462f096"
  end

  depends_on "openjdk"

  conflicts_with "stormssh", because: "both install 'storm' binary"

  def install
    libexec.install Dir["*"]
    (bin/"storm").write_env_script libexec/"bin/storm", Language::Java.overridable_java_home_env
  end

  test do
    system bin/"storm", "version"
  end
end
