"""
PyIDM Pro - Smart Multi-Threaded Download Manager
Entry point for running the application.
"""
import sys
import os

# Ensure project root is on path
ROOT = os.path.dirname(os.path.abspath(__file__))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from pyidm_pro.ui.app import PyIDMApp

if __name__ == "__main__":
    app = PyIDMApp()
    app.mainloop()
