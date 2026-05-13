# PMAC Working Structure

Open `index.html` first. It is the admin login page and redirects to `admin.html` after Firebase authentication.

For a local preview, run this from the folder:

```powershell
node serve.cjs
```

Then open `http://127.0.0.1:8787/`.

## Pages

- `index.html` - Admin login page.
- `admin.html` - Main admin panel. This was supplied as `admim.html`; the working copy uses the expected `admin.html` name. Its page shortcuts open standalone pages in a new browser tab/window.
- `registration.html` - Public PMAF community hub with its own internal tabs for event registration, scrims, GFX results, lobby, public scoreboard, archive, and streamers.
- `scoreboard.html` - Public live scoreboard.
- `overlay.html` - OBS/browser-source overlay using the live teams and match scores.
- `scoreboard-gfx.html` - GFX/result image generator.
- `archive.html` - Tournament archive viewer and archive delete tool.
- `lobby.html` - Best teams lobby page and lobby admin functions.
- `screenshot-reader.html` - Screenshot score reader that can write extracted scores to Firebase.
- `promotions.html` - Event promotions page.
- `serve.cjs` - Tiny local preview server.

## Shared Firebase Paths

- `pmac/teams` - Main tournament team list.
- `pmac/matches` - Main tournament match scores.
- `pmac/archive` - Archived tournament results.
- `pmac/registrations` - PMAF event registrations.
- `pmac/event` - PMAF event settings.
- `pmac/scrim/registrations` - Daily scrim registrations.
- `pmac/scrim/event` - Daily scrim event settings.
- `pmac/lobby_teams` - Top teams lobby data.
- `pmac/gfx` - GFX result images shown in the community page.
- `pmac/streamers` - Live streamer data.
- `pmac/eventGroups` and `pmac/activeSession` - Admin event group/session data.
- `pmac/promotions` or promotion-related paths - Used by the event promotions page, depending on its configured runtime data.

## Flow

1. Admin signs in through `index.html`.
2. `admin.html` manages teams and scores in `pmac/teams` and `pmac/matches`.
3. Admin shortcuts open public/tool pages as standalone browser tabs/windows. They are not embedded inside the admin page.
4. `registration.html` is the public hub and keeps all of its internal tabs inside that one public page.
5. `scoreboard.html`, `overlay.html`, and `scoreboard-gfx.html` read the same live teams and match data.
6. `registration.html` collects public registrations; `admin.html` can import approved registrations into the main team list.
7. Finished tournaments can be archived from `admin.html`; `archive.html` and `registration.html` can display those archived results.

## Notes

- The original `admim.html` typo is fixed by naming the working admin file `admin.html`.
- Admin navigation now points to local files in this folder instead of hard-coded GitHub Pages URLs.
- The real `promotions.html` file is included. One GitHub Pages URL remains inside its share/WhatsApp message text because that is meant for public sharing.
- External Firebase, Google Fonts, and Firebase Storage links still require internet access in the browser.
