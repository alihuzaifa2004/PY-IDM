-- PyIDM Pro - SQLite Database Schema
-- Stores download tasks, progress, and app settings for persistence across restarts.

-- Download tasks (all HTTP/HTTPS and yt-dlp downloads)
CREATE TABLE IF NOT EXISTS downloads (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    filename TEXT NOT NULL,
    filepath TEXT NOT NULL,
    total_size INTEGER DEFAULT 0,
    downloaded_size INTEGER DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'queued',
    thread_count INTEGER DEFAULT 4,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    completed_at TEXT,
    error_message TEXT,
    is_video INTEGER DEFAULT 0,
    video_options TEXT,
    speed_limit_kb INTEGER DEFAULT 0
);

-- Chunk progress for resume (byte ranges per thread)
CREATE TABLE IF NOT EXISTS download_chunks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    download_id INTEGER NOT NULL,
    chunk_index INTEGER NOT NULL,
    start_byte INTEGER NOT NULL,
    end_byte INTEGER NOT NULL,
    downloaded_byte INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (download_id) REFERENCES downloads(id) ON DELETE CASCADE,
    UNIQUE(download_id, chunk_index)
);

-- Application settings (key-value)
CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS idx_downloads_status ON downloads(status);
CREATE INDEX IF NOT EXISTS idx_downloads_created ON downloads(created_at);
CREATE INDEX IF NOT EXISTS idx_chunks_download_id ON download_chunks(download_id);
