require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Rsc < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-systems-commons'
  url 'https://code.cor-lab.org/git/rsc.git', :using => :git, :tag => '0.7'
  version '0.7'
  head 'https://code.cor-lab.org/git/rsc.git', :using => :git

  depends_on 'cmake' => :build
  depends_on 'boost'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize

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
