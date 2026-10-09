================================================================
AUDIT REPORT: finsight-agent
================================================================
Date: 2026-10-09T07:30:21Z
Branch: automatic-ai-hygiene
HEAD: 59b75d1
Tracked files: 217
Remote: origin	https://github.com/themanoj-025/FinSight.git (fetch)
Mode: audit-only | AUTONOMY: 1 | NETWORK: registry-readonly | RISK: conservative
================================================================
DETECTION SUMMARY (Phase B, Sec 10-18):
  AI residue (conversational/self-reference):  none found
  Debug artifacts (console.log/debugger):     none found (CLI print is contract)
  Focused/skipped tests (.only/.skip):        none found
  Truncation markers (Sec 10.3):              none found
  Commented-out code blocks:                    none found
  Template residue (lorem/changeme):            none found
  Credential literals (pass/secret/token=):     none found in tracked config
  Live secrets in working tree:                 NONE observed
Validation gates G1-G22:                        ALL NOT VERIFIED
Notes:
  - Python interpreter unavailable (0x80070003); all python analysis unrunnable.
  - No sandbox available (EXECUTION_POLICY=sandboxed); manual runs NOT VERIFIED.
  - ULTRA MASTER PROMPT v3.0 executed per Sec 3.6: unverified flagged.
================================================================
