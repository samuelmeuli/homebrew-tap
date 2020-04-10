class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore/archive/v1.1.2.tar.gz"
	sha256 "df105e301a7b3f6f37025fb6674e67b9246fdd89f2dcb7ceb3862995bfb5483b"
	head "https://github.com/samuelmeuli/tmignore.git"

	depends_on :xcode => ["10.0", :build]

	def install
		system "make", "build"
		bin.install "./dist/tmignore"
		system "cp", "./homebrew.tmignore.plist", prefix
	end

	test do
		system "#{bin}/tmignore", "version"
	end
end
