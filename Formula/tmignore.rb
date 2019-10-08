class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore.git",
		:tag => "v0.2.0",
		:revision => "93bdc18b6d13ee9866d0adfb2a73f7a3f8879620"
	head "https://github.com/samuelmeuli/tmignore.git"

	depends_on :xcode => ["10.0", :build]

	def install
		system "make", "build"
		bin.install "./dist/tmignore"
		system "cp", "./homebrew.tmignore.plist", prefix
	end
end
