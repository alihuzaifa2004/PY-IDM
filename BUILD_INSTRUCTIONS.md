# PyIDM Pro – Build Instructions (Windows .exe)

## Prerequisites

- Windows 10 or 11
- Python 3.10 or 3.11 (recommended)
- Virtual environment (optional but recommended)

## 1. Install Dependencies

```powershell
cd "e:\RajaCCP\New folder"
python -m venv venv
.\venv\Scripts\activate
pip install -r requirements.txt
```

## 2. Test Run

```powershell
python main.py
```

## 3. Package with PyInstaller (single-file .exe)

### 3.1 Create a spec file (optional, for icon and hidden imports)

Create `pyidm_pro.spec` in the project root:

```python
# pyidm_pro.spec
# Run: pyinstaller pyidm_pro.spec

a = Analysis(
    ['main.py'],
    pathex=[],
    binaries=[],
    datas=[],
    hiddenimports=[
        'yt_dlp',
        'PIL',
        'PIL._tkinter_finder',
        'pystray',
        'flask',
        'requests',
        'urllib3',
        'customtkinter',
        'packaging',
        'certifi',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)
pyz = PYZ(a.pure)
exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='PyIDM_Pro',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='icon.ico',
)
```

### 3.2 Build one-file executable with icon

1. **Add an application icon**  
   Place `icon.ico` in the project root (e.g. 256x256 or 48x48).  
   If you don’t have one, skip the `icon=` line in the spec or in the command below.

2. **Using the spec file:**

```powershell
pyinstaller pyidm_pro.spec
```

3. **Or using command line (no spec):**

```powershell
pyinstaller --onefile --windowed --name PyIDM_Pro ^
  --hidden-import=yt_dlp ^
  --hidden-import=PIL ^
  --hidden-import=pystray ^
  --hidden-import=flask ^
  --hidden-import=customtkinter ^
  --icon=icon.ico ^
  main.py
```

### 3.3 Output

- Executable: `dist\PyIDM_Pro.exe` (or `dist\PyIDM_Pro.exe` when using the spec name above).
- The first run may unpack to a temporary folder; allow a few seconds for startup.

## 4. Hidden imports (if you see “ModuleNotFoundError”)

If the exe fails with a missing module, add it to `hiddenimports` in the spec or with another `--hidden-import=...`:

- `yt_dlp`
- `PIL`, `PIL._tkinter_finder`
- `pystray`
- `flask`, `werkzeug`
- `requests`, `urllib3`, `certifi`
- `customtkinter`
- `packaging`

## 5. Database and settings

- The SQLite database `pyidm_pro.db` is created in the **current working directory** when you run the app (or next to the exe if you start it from that folder).
- To keep the DB and settings with the exe, run the exe from a fixed folder (e.g. `C:\Program Files\PyIDM Pro\`) or configure the app to use a dedicated data directory and point the code to it.

## 6. Browser extension

- The `browser_extension` folder contains a minimal Chrome Manifest V3 extension.
- Load it in Chrome: `chrome://extensions` → “Load unpacked” → select the `browser_extension` folder.
- Ensure PyIDM Pro is running so the local API on `http://127.0.0.1:47652` is available.
- Right-click a link → “Download with PyIDM Pro” to send the URL to the app.

## 7. Optional: create a simple 48x48 PNG for the extension

If you add `icon48.png` (48x48) in `browser_extension`, the context menu will show it. Otherwise you can remove the `icons` block from `manifest.json`.
