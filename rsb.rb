require 'formula'

class Rsb < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git, :branch => '0.7'
  version '0.7'
  head 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'spread' => :recommended
  depends_on 'rsc' 
  depends_on 'rsb-protocol'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?
    args = std_cmake_args

    if not build.with? 'spread'
      args << "-DBUILD_SPREAD_TRANSPORT=OFF" 
    end
    
    system "cmake", ".", *args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb`.
    system "false"
  end
end
