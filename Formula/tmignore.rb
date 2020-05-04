class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore/archive/v1.2.1.tar.gz"
	sha256 "2b1bdf49718cce745cb37e2301ad9164f975ffc2f5e2bf44b2c8d0959f3219e9"
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
