require 'formula'

class RstConverters < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-system-types'
  url 'https://code.cor-lab.de/git/rst.git.converters.git', :using => :git, :branch => '0.7'
  version '0.7'
  head 'https://code.cor-lab.de/git/rst.git.converters.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'rci' => :recommended
  depends_on 'opencv' => :optional
  #FIX-ME: https://github.com/swrede/homebrew-formulas/issues/8
  #depends_on 'rsb' 
  depends_on 'rst-proto'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?  
    
    system "cmake", "./cpp", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsc`.
    system "false"
  end
end
