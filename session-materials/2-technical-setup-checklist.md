# Technical Setup Checklist
## Complete before students arrive

### 1 Week Before
- [ ] Confirm HH216 has projector, screen, WiFi, and power outlets
- [ ] Confirm parents have subscribed to Claude Pro and installed Claude Code
- [ ] Send reminder email to parents with the web app link
- [ ] Prepare pre-test and post-test links (short URL or QR code)
- [ ] Prepare post-session attitude survey (Google Forms link)
- [ ] Print all handouts (see 4-printed-materials.md)

### Morning Of — Arrive 30 Min Early
- [ ] Test WiFi — load https://weihaoqu.github.io/learnai-course/ on your laptop
- [ ] Write WiFi network name and password on the whiteboard
- [ ] Set chairs in a U-shape (so you can see all screens)
- [ ] Place printed materials at each seat (reference card + project brief)
- [ ] Set up projector and connect your laptop

### On Your Projector Laptop — Open These Tabs
1. https://weihaoqu.github.io/learnai-course/ (main site)
2. Pre-test link
3. Post-test link
4. Post-session survey (Google Forms)
5. https://chatgpt.com (logged in — for live demo)

### On Your Projector Laptop — Clear Cache
Open browser Console (F12) and run:
```
localStorage.clear()
```
Then refresh — the consent form should appear fresh.

### As Students Arrive
- [ ] Confirm each student has a laptop with charger
- [ ] Confirm Claude Code is working: ask them to open Terminal and type `claude --version`
- [ ] If anyone doesn't have Claude Code, help them install on the spot:
  ```
  npm install -g @anthropic-ai/claude-code
  claude
  ```
- [ ] Have students open https://weihaoqu.github.io/learnai-course/ in their browser

### Backup Plan (WiFi Fails)
- Pre-download all HTML files to a USB drive
- Run a local server on your laptop: `python3 -m http.server 8080`
- Students connect to http://[your-laptop-IP]:8080
- Pre-download key YouTube videos using yt-dlp onto the laptop

### Accounts Needed
| Tool | Who Pays | Free Tier? | Notes |
|------|----------|------------|-------|
| Claude Pro | Parents ($20/mo) | No — required for Claude Code | Can cancel after session |
| ChatGPT | Optional | Yes — free tier works | Backup if Claude has issues |
| GitHub | Optional | Yes | Only needed if students want to deploy |
