# Ava Writing Quest — Offline edition 4.0

Standalone writing-practice app, separate from ../ava/ and Leo’s app.

Open once online and wait for Offline ready. Install from Safari’s Share > Add to Home Screen. Reopen the installed app once online and check Offline ready before using airplane mode.

A scoped service worker caches the app shell, icons and original task summaries. Its cache cleanup affects only this app’s scope. No external fonts or runtime API are needed. EPP PDF files are imported locally into IndexedDB; no purchased PDF is hosted or uploaded. The EPP dashboard and video explanations require internet.

Progress and awards are saved under ava-quest-v1 in localStorage, separate from the older apps’ keys. PDFs are saved under ava-quest-local-books in IndexedDB. Neither is cloud sync; clearing website data or browser eviction can remove local records. Export writing backups regularly and retain original PDFs. To move from chatgpt.site, export there and restore here; domains do not share browser storage.

Stars reward completion. Moons are entered by a parent/reviewer after assessment; the app does not automatically grade essays.

All HTML, assets, manifest and service-worker paths are relative or derived from the app’s URL, so this folder can run on GitHub Pages at a repository subpath without capturing other apps.
