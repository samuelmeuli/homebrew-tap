class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore.git",
		:tag => "v1.0.0",
		:revision => "92477a13108a00bebda179127d484d06d6c58254"
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
