#!/usr/bin/env bash
# Install the Python dependencies into ./.pylibs so that the system
# environment is not modified.  Tested on Debian/Ubuntu with Python 3.14.
set -euo pipefail
cd "$(dirname "$0")"
python3 -m pip install --target .pylibs --no-cache-dir \
    --break-system-packages -r requirements.txt
echo "Done. Now run:"
echo "  export PYTHONPATH=\$PWD/.pylibs"
echo "  export MPLCONFIGDIR=/tmp/mplconfig"
