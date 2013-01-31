require 'formula'

class RsbOpencv < Formula
  #homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/tools/rsb-gstreamer-integration'
  url 'https://code.cor-lab.de/svn/rsbvideoreceiver/branches/0.7-withkinectsupport', :using => :svn
  version '0.7'
  head 'https://code.cor-lab.org/svn/rsbvideoreceiver/trunk', :using => :svn

  option :universal

  depends_on 'cmake' => :build
  depends_on 'opencv'
  depends_on 'rsb'
  depends_on 'rst-proto'
  depends_on 'rst-converters'

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
