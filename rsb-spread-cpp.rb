require 'formula'

class RsbSpreadCpp < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.spread-cpp', :using => :git, :branch => '0.9'
  version '0.9'
  head 'https://code.cor-lab.org/git/rsb.git.spread-cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'spread' 
  depends_on 'rsb' 
  depends_on 'rsc'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?
    args = std_cmake_args
    
    system "cmake", ".", "-DBUILD_TESTS=OFF", "-DBUILD_EXAMPLES=OFF", *args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb`.
    system "false"
  end
end
