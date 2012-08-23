require 'formula'

class Eigen2 < Formula
  homepage 'http://eigen.tuxfamily.org/'
  url 'http://bitbucket.org/eigen/eigen/get/2.0.17.tar.gz'
  sha1 '7e1674420a8eef7e90e1875ef5b9e828fb9db381'

  depends_on 'cmake' => :build

  option :universal

  def install
    ENV.fortran
    ENV.universal_binary if build.universal?
    mkdir 'eigen-build' do
      args = std_cmake_args
      args.delete '-DCMAKE_BUILD_TYPE=None'
      args << '-DCMAKE_BUILD_TYPE=Release'
      args << "-Dpkg_config_libdir=#{lib}" << '..'
      system 'cmake', *args
      system 'make install'
    end
  end
end
