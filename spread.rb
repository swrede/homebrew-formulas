require 'formula'

class Spread < Formula
  homepage 'http://www.spread.org/'
  url 'http://www.spread.org/download/spread-src-4.2.0.tar.gz?FILE=spread-src-4.2.0.tar.gz&name=McTester&company=homebrew&email=foo@example.org'
  sha1 '6052d39610ec27e856d601310f5b7a7b982d02dc'
  version '4.2.0'

  option :universal

  def install
    ENV.j1
    ENV.universal_binary if build.universal?

    system "./configure", "--prefix=#{prefix}"

    system "make"
    
    # Even though we specified HOMEBREW_PREFIX for configure,
    # we still want to install it in the Cellar location.
    system "make", "-j1", "install", "prefix=#{prefix}"     
    File.symlink("#{prefix}/sbin/spread", "#{prefix}/bin/spread") 
  end

  def test
    system "spuser"
  end
end
