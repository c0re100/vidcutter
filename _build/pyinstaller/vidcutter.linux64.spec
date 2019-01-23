#!/usr/bin/env python3
# -*- mode: python -*-

from PyQt5.QtCore import QLibraryInfo


block_cipher = None

a = Analysis(['../../vidcutter/__main__.py'],
             pathex=[
                 QLibraryInfo.location(QLibraryInfo.LibrariesPath),
                 QLibraryInfo.location(QLibraryInfo.PluginsPath),
                 '../..'
             ],
             # binaries=[
             #    ('/usr/lib/x86_64-linux-gnu/mesa/libGL.so.1.2.0', '.')
             # ],
             binaries=[
                 ('/home/ozmartian/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/' +
                 'libselinux.so.1', '.')
             ],
             datas=[
                 ('../../vidcutter/__init__.py', '.'),
                 ('../../vidcutter/libs/mpv.*.so', '.'),
                 ('../../bin/ffmpeg', './bin'),
                 ('../../bin/mediainfo', './bin'),
                 ('../../LICENSE', '.'),
                 ('../../README.md', '.')
             ],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=['numpy', 'PyQt5.QtWebEngineWidgets', 'PyQt5.QtMultimedia', 'PyQt5.QtBluetooth', 'PyQt5.QtDesigner', 'PyQt5.QtHelp', 'PyQt5.QtLocation', 'PyQt5.QtMultimediaWidgets', 'PyQt5.QtNetworkAuth', 'PyQt5.QtNfc', 'PyQt5.QtPositioning', 'PyQt5.QtPositioningQuick', 'PyQt5.QtQml', 'PyQt5.QtQuick', 'PyQt5.QtQuickControls2', 'PyQt5.QtQuickParticles', 'PyQt5.QtQuickTemplates2', 'PyQt5.QtQuickTest', 'PyQt5.QtQuickWidgets', 'PyQt5.QtSensors', 'PyQt5.QtSerialPort', 'PyQt5.QtSql', 'PyQt5.QtTest', 'PyQt5.QtWebChannel', 'PyQt5.QtWebEngine', 'PyQt5.QtWebEngineCore', 'PyQt5.QtWebSockets', 'PyQt5.QtXml', 'PyQt5.Qt5XmlPatterns'],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='VidCutter_HuskyVer',
          debug=False,  
          strip=True,
          upx=True,
          console=True )
