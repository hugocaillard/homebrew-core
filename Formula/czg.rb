require "language/node"

class Czg < Formula
  desc "Interactive Commitizen CLI that generate standardized commit messages"
  homepage "https://github.com/Zhengqbbb/cz-git"
  url "https://registry.npmjs.org/czg/-/czg-1.6.1.tgz"
  sha256 "0b9eb6ae047666b0601aa45e77bc615f0de88b60d3024ad1a35face3dfafd964"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9636f068250b27a600e24e3cb5a113cf546c84702ea994629d9d8963eb6c6e9b"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/czg --version")
    # test: git staging verifies is working
    system "git", "init"
    assert_match ">>> No files added to staging! Did you forget to run `git add` ?",
      shell_output("NO_COLOR=1 #{bin}/czg 2>&1", 1)
  end
end
