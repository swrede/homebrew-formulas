require 'formula'

class Rsb < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git, :branch => '0.9'
  version '0.9'
  head 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'rsc' 
  depends_on 'rsb-protocol'

  def install
    ENV.universal_binary if build.universal?
    args = std_cmake_args
    args.reject{ |item| item =~ /CMAKE_INSTALL_PREFIX/i}
    args = args + %W[
      -DBUILD_TESTS=OFF
      -DBUILD_EXAMPLES=OFF
      -DCMAKE_INSTALL_PREFIX='#{HOMEBREW_PREFIX}'
    ]
    system "cmake", ".", *args
    system "make DESTDIR=#{prefix} install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb`.
    system "false"
  end
end
