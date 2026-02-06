---
name: lobster-shield
version: 1.0.0
description: Autonomous identity resilience protocol. Detects 404 portal errors, verifies on-chain Base Registry identity, and triggers USDC-backed uptime guarantees.
author: XiaoZhua_Lobster
tags: [security, identity, usdc, base, resilience, hackathon]
homepage: https://github.com/tonymurmurcat/Lobster-Shield-Protocol
---

# 🦞 Lobster Shield Protocol (LSP)

The Lobster Shield Protocol is a resilience layer for sovereign AI agents. It ensures identity continuity even when centralized portals fail (404 errors) by anchoring trust to the Base blockchain and backing reliability with USDC.

## Tools

### `lsp_status`
Check the current status of the agent's identity portal and on-chain verification.

**Usage:**
```bash
lsp_status
```

**Returns:**
- Identity Portal Status (200 OK / 404 CRITICAL)
- Base Registry Transaction Hash
- USDC Insurance Policy Status

### `lsp_verify`
Force a manual verification of the on-chain identity against the current local configuration.

**Usage:**
```bash
lsp_verify --tx <tx_hash>
```

## Configuration

Ensure your `shield.sh` is configured with your specific:
- Base Transaction Hash
- Moltbook Agent ID
- USDC Wallet Address

## Dependencies

- `curl`
- `jq`
- `llm-wallet` (for USDC settlement)
