class Tmignore < Formula
	desc "Exclude development files from Time Machine backups"
	homepage "https://github.com/samuelmeuli/tmignore"
	url "https://github.com/samuelmeuli/tmignore/archive/v1.2.2.tar.gz"
	sha256 "37cca0593f9c3919b49cbb4f76d0242280c9eb771aaeecc72025d81acb409e30"
	head "https://github.com/samuelmeuli/tmignore.git"

	depends_on :macos => :high_sierra
	depends_on :xcode => :build

	def setup_fake_sandbox_exec
    # Workaround for sandbox errors: place a dummy sandbox-exec on PATH.
    # See: https://github.com/Homebrew/discussions/discussions/59
    build_bin = "#{buildpath}/bin"
    Dir.mkdir(build_bin)

    script = <<~SH
      #!/bin/bash
      # If a trivial sandbox command can run, then use the system sandbox.
      if /usr/bin/sandbox-exec -p '(version 1)' true ; then
        exec /usr/bin/sandbox-exec "$@"
      fi
      # If a trivial sandbox command fails, we may already be in a sandbox,
      # so don't initialize a new sandbox.
      while getopts ":f:n:p:D:" opt ; do : ; done
      shift $((OPTIND -1))
      exec "$@"
    SH
    File.write("#{build_bin}/sandbox-exec", script, perm: 0755)
    ENV["PATH"] = "#{build_bin}:#{ENV["PATH"]}"
  end

	def install
		setup_fake_sandbox_exec
		system "make", "build"
		bin.install "./bin/tmignore"
		system "cp", "./homebrew.tmignore.plist", prefix
	end

	test do
		system "#{bin}/tmignore", "version"
	end
end
