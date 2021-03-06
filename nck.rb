require 'formula'

class Nck < Formula
  ver = "1.9"
  pkgver = "1"

  homepage 'http://keckcaves.org/software/nck'
  url "https://github.com/KeckCAVES/NCK.git", :revision => "v#{ver}"
  version "#{ver}-#{pkgver}"

  depends_on 'KeckCAVES/keckcaves/vrui'

  def install
    args = []
    args << "INSTALLDIR=#{prefix}"
    args << "ETCINSTALLDIR=#{etc}/#{name}"
    args << "VRUI_MAKEDIR=#{HOMEBREW_PREFIX}/share/vrui/make"
    args << "JPEG_BASEDIR=#{HOMEBREW_PREFIX}"
    args << "TIFF_BASEDIR=#{HOMEBREW_PREFIX}"
    args << "LIBUSB1_BASEDIR=#{HOMEBREW_PREFIX}"
    args << "PNG_BASEDIR=#{MacOS::X11.prefix}"
    args << "X11_BASEDIR=#{MacOS::X11.prefix}"
    args << "GL_BASEDIR=#{MacOS::X11.prefix}"
    args << "GLU_BASEDIR=#{MacOS::X11.prefix}"
    args << "SHOWCOMMAND=1"
    system "make", *args
    system "make", *(args+["install"])
  end
end
