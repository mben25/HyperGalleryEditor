#!/bin/sh
# MiMediaEditor.apk is over GitHub's 100 MB file limit, so the repo stores it
# as 90 MB parts. Re-run this after replacing the apk, then commit .parts/.
cd "$(dirname "$0")/.." || exit 1
APK=system/priv-app/MiMediaEditor/MiMediaEditor.apk
rm -f .parts/MiMediaEditor.apk.part-*
split -b 90m "$APK" .parts/MiMediaEditor.apk.part-
shasum -a 256 "$APK" | cut -d' ' -f1 > .parts/MiMediaEditor.apk.sha256
