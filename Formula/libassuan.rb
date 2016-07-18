class Libassuan < Formula
  desc "Assuan IPC Library"
  homepage "https://www.gnupg.org/related_software/libassuan/"
  url "https://gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.3.tar.bz2"
  mirror "https://www.mirrorservice.org/sites/ftp.gnupg.org/gcrypt/libassuan/libassuan-2.4.3.tar.bz2"
  sha256 "22843a3bdb256f59be49842abf24da76700354293a066d82ade8134bb5aa2b71"

  bottle do
    cellar :any
    sha256 "f16eadc3c931b76eaebd8a99d84dadf0221d961b8d2086a47c4a01294667eaea" => :el_capitan
    sha256 "c32b2a92af1b9b9dbd19f0fef2357e178ab5fbd6d0ef5f65873db9f620e52b8b" => :yosemite
    sha256 "30fb2a811710def13ce920ce6a1edd8eccc0814ef8b6d442b33fdb47ea48c5a3" => :mavericks
  end

  depends_on "libgpg-error"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-static"
    system "make", "install"
  end

  test do
    system bin/"libassuan-config", "--version"
  end
end
