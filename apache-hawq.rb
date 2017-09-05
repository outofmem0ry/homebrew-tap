class ApacheHawq < Formula
  desc "Apache Hawq"
  homepage "http://hawq.incubator.apache.org/"
  url "http://www.gtlib.gatech.edu/pub/apache/incubator/hawq/2.2.0.0-incubating/apache-hawq-src-2.2.0.0-incubating.tar.gz"
  sha256 "00343443f2aa47bb83de25def96f6c217452e9bdb5285f038e4d338d3280b92b"
  head "https://github.com/apache/incubator-hawq.git"

  depends_on "libyaml" => :build # --enable-mapreduce
  depends_on "json-c" => :build
  depends_on "json-c" => :build
  depends_on "Gsasl" => :build
  depends_on "bison" => :build
  depends_on "ccache" => :build
  depends_on "cpanm" => :build
  depends_on "maven" => :build
  depends_on "openssl" => :build
  depends_on "snappy" => :build
  depends_on "protobuf" => :build
  depends_on "protobuf-c" => :build
  depends_on "thrift" => :build
  depends_on "boost" => :build
  depends_on "iproute2mac" => :build
  depends_on "libevent" => :build # gpfdist
  depends_on "apr" => :build # gpperfmon
  depends_on "apr-util" => :build # gppermon

  depends_on "gporca" => :build # --enable-orca

  depends_on "python" => :run

  depends_on "go" => :optional
  depends_on "gdb" => :optional

  def install
    # additional pip dependencies to run
    system "pip", "install", "pycrypto"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"

  end
end
