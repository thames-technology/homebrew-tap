class Apigen < Formula
  desc "Generate Protobuf service definitions conforming to popular design guides"
  homepage "https://github.com/thames-technology/apigen"
  url "https://github.com/thames-technology/apigen/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "6f4d2c2bb84dfe5619ddeb8b9546c78bf8180e0a79005e35e4485b5f04230ede"
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
