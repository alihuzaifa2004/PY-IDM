# PyIDM Pro - PyInstaller spec
# Run: pyinstaller pyidm_pro.spec
# Omit icon=... if you don't have icon.ico

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
)
# Add icon='icon.ico' to EXE() when you have an icon file
