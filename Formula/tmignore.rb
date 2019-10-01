class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore.git",
		:tag => "v0.1.0",
		:revision => "e6242c5892786797157fc1fdfc93346d86021dd8"
	head "https://github.com/samuelmeuli/tmignore.git"

	depends_on :xcode => ["10.0", :build]

	def install
		system "make", "build"
		bin.install "./dist/tmignore"
		system "cp", "./homebrew.tmignore.plist", prefix
	end
end
