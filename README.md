# Zemixo Homebrew Tap

<img src="https://raw.githubusercontent.com/zemixo/homebrew-tap/main/quiet-orbit-banner.svg" alt="Homebrew Tap: A small shelf for useful tools. Zemixo pixel robot workshop." width="100%">

A Homebrew tap for small tools from the Zemixo workshop.

[Availability](#availability) · [Using this tap](#using-this-tap) · [Release policy](#release-policy)

---

## Availability

There are currently **no installable formulae on `main`**.
[Draft PR #1](https://github.com/zemixo/homebrew-tap/pull/1) proposes a
checksum-pinned formula for the published `claude-agent-ledger` 0.7.2 release.

## Using this tap

You can register the tap with Homebrew:

```sh
brew tap zemixo/tap
```

After the formula is reviewed and merged, the installation command will be:

```sh
brew install zemixo/tap/claude-agent-ledger
agent-ledger --version
```

The formula reads the same local Claude Code logs as the npm package. Use
`--anonymize` and review subagent and tool names before sharing output.

To remove the installed formula, run `brew uninstall claude-agent-ledger`.
Homebrew may retain its download cache, the Tap checkout, and the shared `bun`
dependency. The formula does not create or remove Claude Code logs.

## Release policy

Formulae should point to stable, checksum-pinned upstream releases. Formula
changes and bottle publication require human review.

See [Homebrew's Tap documentation](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
for trust and installation details.

---

<sub>Made by [Zemixo](https://github.com/zemixo) · Small tools. Made with care.</sub>
