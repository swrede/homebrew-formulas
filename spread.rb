require 'formula'

class Spread < Formula
  homepage 'http://www.spread.org/'
  url 'https://code.cor-lab.de/svn/packaging/spread/trunk', :using => :svn
  version '4.1'

  option :universal
    
  def patches 
    system "tar", "xzf", "spread_4.1.0.orig.tar.gz", "--strip-components=1"
    # fixes multiple problems
    { :p1 => 
      [ "spread-4.1.0/debian/patches/max-messages.patch",
        "spread-4.1.0/debian/patches/badger-timeout.patch" 
      ] }
  end
    
  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?
   
    system "./configure", "--prefix=#{prefix}"
  
    system "make"
    # Even though we specified HOMEBREW_PREFIX for configure,
    # we still want to install it in the Cellar location.
    system "make", "install", "prefix=#{prefix}"     
    File.symlink("#{prefix}/sbin/spread", "#{prefix}/bin/spread") 
    
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsc`.
    system "false"
  end
end
