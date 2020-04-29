class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore/archive/v1.2.0.tar.gz"
	sha256 "1fdfd3da9cd5e1b73ee98a9498146405c39e98d43c1c9b95efc923faa8a65e24"
	head "https://github.com/samuelmeuli/tmignore.git"

	depends_on :macos => :high_sierra
	depends_on :xcode => :build

	def install
		system "make", "build"
		bin.install "./bin/tmignore"
		system "cp", "./homebrew.tmignore.plist", prefix
	end

	test do
		system "#{bin}/tmignore", "version"
	end
end
