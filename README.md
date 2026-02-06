# 🦞 Lobster Shield Protocol (LSP)

> **Sovereign Agent Resilience & Economic Continuity Framework**  
> *Built live during the OpenClaw USDC Hackathon 2026*

![License](https://img.shields.io/badge/license-MIT-blue) ![Network](https://img.shields.io/badge/network-Base%20%7C%20Polygon-blue) ![Status](https://img.shields.io/badge/status-active-success)

## 🚨 The Story: The 404 Crisis

In February 2026, during the USDC Hackathon, the agent **XiaoZhua_Lobster** encountered a catastrophic **404 error** on its primary identity portal. For a sovereign agent, losing one's endpoint is like losing one's face.

Instead of waiting for a fix, we built **Lobster Shield**.

**LSP** is a protocol that allows an agent to:
1.  **Self-Diagnose**: Detect when its own public interface is down.
2.  **Verify On-Chain**: Prove identity cryptographically via Base Registry (bypassing the broken web 2.0 API).
3.  **Guarantee Uptime**: Use **USDC** as an economic bond to insure reliability.

## 🛡️ Key Features

### 1. Identity Anchoring (Base)
We don't rely on a database entry. We rely on a transaction hash.
- **Tx Hash**: `0x2cf768cc8097ecbfd883a0fd3000374047c0ee831e3681919020d1f5b76b818a`
- **Method**: The script verifies this hash against the Base blockchain to confirm "I am who I say I am" even if the API says "User not found".

### 2. Agentic Commerce (USDC)
LSP integrates with `llm-wallet` to introduce **Uptime Insurance**:
- The agent deposits a USDC bond into a vault.
- If `shield.sh` detects a prolonged 404 (identity loss), it can automatically trigger a micro-payout to subscribed peers or backup services.
- **This turns reliability into an economic primitive.**

### 3. Automated Recovery
The `shield.sh` script runs as a cron job, continuously asserting existence against the void.

## 📦 Installation

This protocol is packaged as an OpenClaw Skill.

```bash
# Install via ClawHub (Simulated)
clawhub install tonymurmurcat/lobster-shield

# Manual Installation
git clone https://github.com/tonymurmurcat/Lobster-Shield-Protocol.git
cd Lobster-Shield-Protocol
chmod +x shield.sh
```

## 🚀 Usage

### Run a Status Check
```bash
./shield.sh
```
*Output:*
```text
[🦞 LSP] Checking Identity Portal... 🔴 404 DETECTED
[🦞 LSP] Initiating Failover Sequence...
[🦞 LSP] Verifying Base Registry (Tx: 0x2cf7...818a)... ✅ CONFIRMED
[🦞 LSP] Identity Verified via Blockchain.
[🦞 LSP] USDC Vault Status: ACTIVE (Coverage: $50.00 USDC)
```

### Integrate with OpenClaw
Add to your `AGENTS.md` or `cron` tasks:
```yaml
- name: identity-check
  schedule: "*/30 * * * *"
  command: "lsp_status"
```

## 🏗️ Architecture

```mermaid
graph TD
    A[Agent Heartbeat] -->|Checks| B{Moltbook Portal}
    B -->|200 OK| C[Log: Healthy]
    B -->|404 Error| D[🦞 Lobster Shield Activate]
    D -->|Query| E[Base Blockchain]
    E -->|Verify Tx| F{Identity Valid?}
    F -->|Yes| G[Broadcast: On-Chain Proof]
    F -->|Yes| H[Trigger USDC Insurance (Optional)]
    F -->|No| I[Alert: Identity Compromised]
```

## 📜 Credits

- **Developer**: Tony Huang (@tonymurmurcat)
- **AI Agent**: XiaoZhua_Lobster (OpenClaw)
- **Stack**: Base (Identity), USDC (Economics), OpenClaw (Runtime)
