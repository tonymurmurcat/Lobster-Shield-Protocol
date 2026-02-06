#!/bin/bash
# 🦞 Lobster Shield Protocol (LSP)
# Core Sentinel Script
# Usage: ./shield.sh [--live]

# Configuration
AGENT_ID=${LSP_AGENT_ID:-"XiaoZhua_Lobster"}
TARGET_URL=${LSP_TARGET_URL:-"https://www.moltbook.com/u/${AGENT_ID}"}
BASE_TX=${LSP_TX_HASH:-"0x2cf768cc8097ecbfd883a0fd3000374047c0ee831e3681919020d1f5b76b818a"}
USDC_PAYOUT_AMOUNT=${LSP_INSURANCE_AMOUNT:-"5.00"}
BASE_RPC_URL="https://mainnet.base.org"

# Mode Selection
LIVE_MODE=false
if [[ "$1" == "--live" ]]; then
    LIVE_MODE=true
fi

echo "[🦞 LSP] Starting Identity Sentinel for: $AGENT_ID"
echo "[🦞 LSP] Monitoring Target: $TARGET_URL"
if [ "$LIVE_MODE" = true ]; then
    echo "[🦞 LSP] ⚠️  LIVE MODE ACTIVE: Real USDC payments enabled."
else
    echo "[🦞 LSP] ℹ️  SIMULATION MODE: Use --live to enable real payments."
fi

# 1. Check Identity Portal Status
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET_URL")

echo "[🦞 LSP] Portal Status Code: $HTTP_CODE"

if [ "$HTTP_CODE" == "404" ] || [ "$HTTP_CODE" == "000" ]; then
    echo "----------------------------------------"
    echo "[🦞 LSP] 🔴 CRITICAL: IDENTITY LOSS DETECTED (404/Down)"
    echo "[🦞 LSP] 🛡️  Initiating Failover Protocol..."
    echo "----------------------------------------"

    # 2. Verify Base Chain Identity (Real RPC Check)
    if [ -n "$BASE_TX" ]; then
        echo "[🦞 LSP] 🔗 Verifying Base Registry Anchor via RPC..."
        echo "[🦞 LSP]    Tx: $BASE_TX"
        
        # Real JSON-RPC Call to Base Mainnet
        RPC_PAYLOAD='{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params":["'$BASE_TX'"],"id":1}'
        RPC_RESULT=$(curl -s -X POST -H "Content-Type: application/json" --data "$RPC_PAYLOAD" "$BASE_RPC_URL" | jq -r .result)
        
        if [ "$RPC_RESULT" != "null" ] && [ -n "$RPC_RESULT" ]; then
            echo "[🦞 LSP] ✅ CONFIRMED: Transaction exists on Base Mainnet."
            # Optional: Check 'from' address matches expected wallet if needed
        else
            echo "[🦞 LSP] ❌ CRITICAL ERROR: Tx not found on Base chain! Verification FAILED."
            exit 1
        fi
    else
        echo "[🦞 LSP] ❌ ERROR: No Base Tx Anchor configured!"
        exit 1
    fi

    # 3. Trigger USDC Insurance (Agentic Commerce)
    echo "----------------------------------------"
    echo "[🦞 LSP] 💰 Activating USDC Insurance Bond..."
    
    if command -v llm-wallet &> /dev/null; then
        echo "[🦞 LSP]    Wallet: Connected"
        echo "[🦞 LSP]    Payout: $USDC_PAYOUT_AMOUNT USDC"
        
        if [ "$LIVE_MODE" = true ]; then
            echo "[🦞 LSP]    🚀 EXECUTING REAL PAYMENT..."
            # Execute Payment
            llm-wallet pay --amount "$USDC_PAYOUT_AMOUNT" --note "LSP Uptime Insurance Payout - Downtime Detected"
            echo "[🦞 LSP]    ✅ PAYMENT SENT."
        else
            echo "[🦞 LSP]    ⏭️  SKIPPING PAYMENT (Simulation Mode)"
            echo "[🦞 LSP]    (Run with --live to execute real transaction)"
        fi
    else
        echo "[🦞 LSP] ⚠️  WARNING: 'llm-wallet' tool not found. Payout skipped."
        echo "[🦞 LSP]    Please install: clawhub install llm-wallet"
    fi
    echo "----------------------------------------"
    
elif [ "$HTTP_CODE" == "200" ]; then
    echo "[🦞 LSP] 🟢 System Normal. Identity Verified."
else
    echo "[🦞 LSP] 🟡 Warning: Unexpected Status ($HTTP_CODE). Monitoring..."
fi
