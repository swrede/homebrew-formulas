require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class RsbProtocol < Formula
  homepage ''
  url 'https://ci.cor-lab.de/view/RSB/job/rsb-protocol-0.6-src/6/label=ubuntu_precise_64bit/artifact/rsb-protocol-0.6-src.tar.gz'
  sha1 'd353da2d7cf79dda2ef177706173f417ade00de7'

  depends_on 'cmake' => :build
  depends_on 'protobuf'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize

    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb-protocol`.
    system "false"
  end
end
