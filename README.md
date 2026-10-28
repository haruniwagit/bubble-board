# Bubble Board

A personal organiser built as a tiling "bubble screen": resizable, draggable bubbles that always fill the page, each holding a list, notes, goals or a feed of upcoming deadlines. Sign in from any device and your board follows you.

## Features
- **Tiling layout**: bubbles fill the screen with no overlaps; drag dividers to resize, drag edges to span rows or columns, drag a bubble to move or swap it
- **White groups**: outline related bubbles together and even out their sizes in one click
- **Per-bubble properties**: tick-boxes, bullets, numbering, due dates, detail lines, note style, daily habit reset, upcoming-deadline feeds
- **Items**: drag to reorder, between subsections or into other bubbles; calendar picker with Today / Tomorrow shortcuts
- **Accounts**: email + password sign-up, password reset, live sync across devices, JSON backup and import
- Text scales with each bubble's size; phones get a single-column layout

## How it works
- **Front end**: one HTML file, vanilla JavaScript, no build step. The layout is a tree of row and column splits whose leaves are bubbles; every drag, resize or stretch rewrites that tree, which is why nothing can overlap.
- **Back end**: [Supabase](https://supabase.com) for authentication and a Postgres table holding one JSON document per user. Row-level security policies ensure a signed-in user can only read or write their own row. Realtime pushes changes to your other open devices.
- **Sync**: edits save after a short pause; the newest version wins by timestamp, and a local copy keeps the board usable offline.

## Set up your own copy
1. Create a free Supabase project. In **SQL Editor**, run `supabase-setup.sql`.
2. Copy the project URL and publishable key into `config.js`.
3. Host the folder on any static host (GitHub Pages, Netlify, etc.).
4. In Supabase → **Authentication → URL Configuration**, set the Site URL to your site's address.

## Credits
Uses [supabase-js](https://github.com/supabase/supabase-js) v2.117.3 (MIT), bundled in `vendor/`.
