class Kommit < Formula
  desc "More detailed commit messages without committing!"
  homepage "https://github.com/bilgi-webteam/kommit"
  url "https://github.com/bilgi-webteam/kommit/archive/v1.0.0.tar.gz"
  sha256 "d079ba1dcfdf31a35e3d42dbd6adf2450d305e998adb679fb9dc8ea68fa23c22"

  bottle do
    cellar :any_skip_relocation
    sha256 "aa29f910aeabcacfd983a71079429d76a2cf9a7c6fb05e1a016b0e98cdb28ee1" => :el_capitan
    sha256 "de33756a9282dfb3730f98734c4fc3866241e96203be19519caed9a75e2efcff" => :yosemite
    sha256 "8d6df0933386b06b6495d9143167bcc5db02460915602c858ccaca7902f1e99c" => :mavericks
  end

  def install
    bin.install "bin/git-kommit"
  end

  test do
    system "git", "init"
    system "#{bin}/git-kommit", "-m", "Hello"
    assert_match /Hello/, shell_output("#{bin}/git-kommit -s /dev/null 2>&1")
  end
end
