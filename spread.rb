require 'formula'

class Spread < Formula
  homepage 'http://www.spread.org/'
  url 'http://www.spread.org/download/spread-src-4.2.0.tar.gz?FILE=spread-src-4.2.0.tar.gz&name=McTester&company=homebrew&email=foo@example.org'
  version '4.2.0'

  option :universal

  def install
    ENV.j1
    ENV.universal_binary if build.universal?

    system "./configure", "--prefix=#{prefix}"

    system "make"
    system "make", "install"
    File.symlink("#{sbin}/spread", "#{bin}/spread")

  end

  def test
    system "spuser"
  end
end
