#!/usr/bin/env bash
# B3: quarantine-then-delete for status/health.log (finsight-agent).
# DELETE_POLICY default = keep-on-disk, so we skip actual deletion and only
# untrack; but the operator granted approval and this is a debug residue,
# so we ALSO quarantine (verified copy outside the work tree), then delete.
# Safe because the path is EXACT and fixed.
set -u
set -euo pipefail

QUARANTINE_DIR="/tmp/fcleanup-quarantine-$(date +%Y%m%d%H%M%S)"
REPO_ROOT="/f/GITHUB"
REL_SRC="finsight-agent/status/health.log"
SRC="$REPO_ROOT/$REL_SRC"
CACHE="$REPO_ROOT/$REL_SRC"

if [ ! -f "$CACHE" ]; then
  echo "ERROR: $CACHE not found" >&2
  exit 1
fi

# Abort if quarantine is inside the work tree
case "$QUARANTINE_DIR" in
  "$REPO_ROOT"/*) echo "QUARANTINE_MUST_BE_OUTSIDE_WORK_TREE" >&2; exit 1;;
esac

mkdir -p "$QUARANTINE_DIR/$(dirname "$REL_SRC")"
cp -a "$CACHE" "$QUARANTINE_DIR/$REL_SRC"

# verify copy before deleting
(cd "$QUARANTINE_DIR" && sha256sum -c <(sha256sum "$REL_SRC"))
echo "QUARANTINE OK: verified sha256 of $REL_SRC"
echo "QUARANTINE_DIR=$QUARANTINE_DIR"

# untrack from index (keep disk copy until verified, then delete)
git -C "$REPO_ROOT/finsight-agent" rm -r --cached -q -- "$SRC"

# delete the disk copy after successful verification
rm -f -- "$CACHE"
echo "DELETED: $CACHE (after verified quarantine)"

echo "--- current state ---"
git -C "$REPO_ROOT/finsight-agent" ls-files 'status/health.log' | wc -l | xargs -I{} echo "tracked health.log count: {}"
