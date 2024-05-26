class Apigen < Formula
  desc "Generate standard Protobuf and ts-rest APIs following best-practice design patterns"
  homepage "https://github.com/thames-technology/apigen"
  url "https://github.com/thames-technology/apigen/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "e26c14588d59455dffdc92696a752954d43d011700d53886752ed5760322f89a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:)

    # generate_completions_from_executable(bin/"apigen", "completion")
  end

  test do
    output = shell_output("#{bin}/apigen --version")
    assert_match "apigen version #{version}", output

    # error_output = shell_output("#{bin}/apigen proto 2>&1", 1)
    # assert_match "Required flags \"resource, package\" not set", error_output
  end
end
