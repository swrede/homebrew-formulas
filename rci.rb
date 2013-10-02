require 'formula'

class Rci < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robot-control-interface'
  url 'https://code.cor-lab.org/svn/rci/tags/rci-0.4/rci', :using => :svn
  version '0.4'
  head 'https://code.cor-lab.org/svn/rci/trunk/rci', :using => :svn

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'nemomath'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?    

    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsc`.
    system "false"
  end
end
