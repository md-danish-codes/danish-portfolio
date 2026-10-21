# Danish — Cinematic Portfolio + Study Dashboard

Single-file website (`index.html`) — no build step, no dependencies, 100% free.

## Deploy (GitHub Pages, free)
1. Create a public repo named `danish-portfolio` on GitHub.
2. Upload `index.html`, `robots.txt`, `sitemap.xml`, `404.html` from this folder.
3. Repo → Settings → Pages → Source: Deploy from branch → `main` / root → Save.
4. Site goes live at https://md-danish-codes.github.io/danish-portfolio/
   (If you use a different repo name, update the canonical URL, `robots.txt` and `sitemap.xml` to match.)

## How to update content
All portfolio content lives in ONE place: the `CONFIG` object at the top of the
first `<script>` in `index.html` — skills, projects (name, description, tech,
status, live/repo links), future ideas, and the resume URL.

- **Profile photo:** Currently an initials avatar ("MD") on purpose — no fake
  photo. To use a real photo later, replace the `.avatar` div in the Hero
  section with an `<img>` tag pointing to your photo file.
- **Resume:** Paste a view-only link (e.g. a Google Drive "view" link) into
  `CONFIG.resumeUrl`. Until then the site honestly shows
  "My resume is being prepared. Check back soon." — there is deliberately
  NO download button. Note: no publicly viewable document can be made
  100% download-proof.
- **Certificates:** Add entries by editing the Certificates section, or ask
  naaz to add a certificates array to CONFIG.

## Dashboard — IMPORTANT (local-only prototype)
Secure server authentication is NOT configured yet. The dashboard therefore
stores data only in the browser's localStorage on the device being used:
- Data does NOT sync between phone and laptop.
- Data is lost if browser data is cleared — use Dashboard → Data → Export JSON
  regularly as your backup. Import validates the file and shows a preview
  before replacing anything.
- Anyone using the same browser can open the dashboard. Do NOT store
  passwords or sensitive information in it.

### Phase 4 (backend) — when you're ready
Connect Supabase (free) for real owner-only login + cloud sync:
1. You create a free Supabase project and owner account (your email + OTP).
2. naaz provides the SQL schema + Row Level Security policies and wires
   Supabase Auth into the dashboard.
3. Only then should private/sensitive records be stored, and only then will
   the "public progress" section be server-enforced instead of device-local.

## What was tested
- JavaScript syntax checked (both scripts pass `node --check`).
- All navigation anchors verified against section IDs (no dead links).
- ThinkRush site reachability checked 21 Oct 2026 (page loads); full gameplay
  NOT verified, so it is labelled "Prototype / Needs verification" with no
  live-demo button.
- Visual/responsive check must be done by opening the file on your phone and
  laptop — no headless browser was available in the build environment.
