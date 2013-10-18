require 'formula'

class RstProto < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-system-types'
  url 'https://code.cor-lab.de/git/rst.git.proto.git', :using => :git, :branch => '0.9'
  version '0.9'
  head 'https://code.cor-lab.de/git/rst.git.proto.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'rsc'
  depends_on 'protobuf'
  depends_on :python
  depends_on :python => ['google.protobuf' => 'protobuf']

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?

    system "cmake", ".", "-DPYTHON_EXECUTABLE=#{python.binary}", "-DBUILD_JAVA=OFF", "-DBUILD_MATLAB=OFF", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
    #rm "#{prefix}/lib/python2.7/site-packages/site.py"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsc`.
    system "false"
  end
end
