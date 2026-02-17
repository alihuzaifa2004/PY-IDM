# PyIDM Pro – Smart Multi-Threaded Download Manager

A production-ready, UI-based Internet Download Manager (IDM-type) desktop application in Python for Windows. It supports multi-threaded HTTP/HTTPS downloads with resume, **video downloading via yt-dlp**, and a modern dark-themed CustomTkinter UI.

---

## Run from GitHub (clone and start downloading)

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/PyIDM-Pro.git
cd PyIDM-Pro
```

*(Replace `YOUR_USERNAME` with your GitHub username once you've pushed the project.)*

### 2. Install and run

**Option A – Double-click (Windows)**  
- Double-click **`run.bat`**. It will create a virtual environment, install dependencies, and start PyIDM Pro.

**Option B – Command line**

```powershell
pip install -r requirements.txt
python main.py
```

### 3. Start downloading (including videos)

1. **Dashboard** opens by default.
2. **Paste any URL** in the URL field:
   - **Video (YouTube, Vimeo, etc.)** → A video options dialog appears: choose quality (Best, 720p, 480p, audio-only, etc.) and click **Start Download**. Videos are downloaded via yt-dlp.
   - **Any other file** → Click **Start Download** (or **Suggest threads** first for faster downloads).
3. Use **Active Downloads** to see progress, pause, or resume. Use **Completed** to open the folder or remove entries.

That’s it — you can run it directly from the cloned repo and start downloading files and videos.

---

## Features

- **Multi-threaded downloads**: Split large files into 1–8 configurable chunks using HTTP Range headers; download in parallel and merge automatically.
- **Resume**: Persist progress in SQLite; resume from the last byte after restart or pause.
- **Real-time progress**: Percentage, speed (KB/s or MB/s), ETA, file size, and status (Queued, Downloading, Paused, Completed, Failed).
- **Queue and actions**: Pause, resume, cancel, retry, and manage multiple downloads.
- **Video downloads**: Integrated **yt-dlp** for supported platforms; choose resolution, video-only, audio-only, or best quality; thumbnail preview in the dialog.
- **Modern UI**: CustomTkinter, dark theme, sidebar navigation (Dashboard, Active Downloads, Completed, Settings, About).
- **Settings**: Default download folder, default thread count, speed limiter (KB/s), auto-start with Windows, clipboard monitoring.
- **Clipboard monitoring**: Detect copied URLs and offer a popup to start a download.
- **Smart thread suggestion**: “Suggest threads” analyzes the URL and suggests an optimal thread count.
- **System tray**: Minimize to tray; downloads continue in the background.
- **Desktop notification**: Toast when a download completes.
- **Local API**: Flask server on `http://127.0.0.1:47652` for browser extension integration.
- **Browser extension**: Right-click a link → “Download with PyIDM Pro” to send the URL to the app.

---

## Project structure

```
.
├── main.py                 # Entry point
├── run.bat                 # One-click run on Windows
├── requirements.txt
├── database_schema.sql     # Reference schema
├── BUILD_INSTRUCTIONS.md   # How to build the .exe
├── README.md
├── pyidm_pro/
│   ├── config.py
│   ├── database/            # SQLite layer
│   ├── engine/              # Multi-thread download engine
│   ├── services/            # yt-dlp video service
│   ├── ui/                  # CustomTkinter UI
│   └── utils/
└── browser_extension/      # Chrome extension (right-click → send to PyIDM Pro)
```

---

## Deploy this project to GitHub

1. **Create a new repository** on GitHub (e.g. `PyIDM-Pro`). Do **not** initialize with a README if you already have one locally.

2. **From your project folder:**

   ```powershell
   cd "e:\RajaCCP\New folder"
   git init
   git add .
   git commit -m "Initial commit: PyIDM Pro - Smart Multi-Threaded Download Manager"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/PyIDM-Pro.git
   git push -u origin main
   ```

3. **Replace `YOUR_USERNAME`** with your GitHub username. After pushing, anyone can run it with:

   ```bash
   git clone https://github.com/YOUR_USERNAME/PyIDM-Pro.git
   cd PyIDM-Pro
   pip install -r requirements.txt
   python main.py
   ```

   Or on Windows they can double-click **`run.bat`** after cloning.

---

## Building the Windows executable

See **BUILD_INSTRUCTIONS.md** for PyInstaller one-file build, hidden imports, and optional icon.

---

## License and use

Use only for publicly accessible content. Do not use to bypass DRM or download restricted content.
