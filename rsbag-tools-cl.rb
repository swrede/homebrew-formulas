require 'formula'

class RsbagToolsCl < Formula
  homepage 'https://code.cor-lab.org/projects/rsbag'
  url 'https://ci.cor-lab.org/view/rsb-0.9/job/rsbag-tools-cl-0.9-macos/label=MAC_OS_lion_64bit/lastSuccessfulBuild/artifact/build/bag', :using => :nounzip
  version '0.9'
  head 'https://ci.cor-lab.org/view/rsb-trunk/job/rsbag-tools-cl-trunk-macos/label=MAC_OS_lion_64bit/lastSuccessfulBuild/artifact/build/bag', :using => :nounzip

  def install
    bin.install 'bag'
    ln_s bin/'bag', bin/'bag-play'
    ln_s bin/'bag', bin/'bag-cat'
    ln_s bin/'bag', bin/'bag-info'
    ln_s bin/'bag', bin/'bag-merge'
    ln_s bin/'bag', bin/'bag-record'
  end

  def test
    system "bag-play", "-h"
  end
end
