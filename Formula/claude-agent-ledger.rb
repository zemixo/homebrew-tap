class ClaudeAgentLedger < Formula
  desc "Inspect Claude Code usage by agent, model, project, and session"
  homepage "https://github.com/zemixo/claude-agent-ledger"
  url "https://registry.npmjs.org/claude-agent-ledger/-/claude-agent-ledger-0.7.2.tgz"
  sha256 "c8aabff83da98008ce42115b88c96c4bb6cd970f7666107feb6340697d066163"
  license "MIT"

  depends_on "bun"

  def install
    inreplace "bin/agent-ledger.ts", "#!/usr/bin/env bun",
              "#!#{formula_opt_bin("bun")}/bun"
    libexec.install "bin", "src", "package.json"
    bin.install_symlink libexec/"bin/agent-ledger.ts" => "agent-ledger"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/agent-ledger --version").strip

    ENV["HOME"] = testpath
    ENV["TZ"] = "UTC"
    ENV["NO_COLOR"] = "1"
    ENV.delete "ANTHROPIC_API_KEY"

    log = testpath/".claude/projects/homebrew-test/session.jsonl"
    log.dirname.mkpath
    log.write <<~JSONL
      {"type":"assistant","timestamp":"#{Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")}","message":{"role":"assistant","model":"claude-sonnet-4-6","usage":{"input_tokens":11,"output_tokens":7}}}
    JSONL

    report = JSON.parse(shell_output("#{bin}/agent-ledger today --by model --json --anonymize"))
    assert_equal 11, report.dig("total", "inputTokens")
    assert_equal 7, report.dig("total", "outputTokens")
    assert_equal "claude-sonnet-4-6", report.dig("rows", 0, "subagent")
  end
end
