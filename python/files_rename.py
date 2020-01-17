#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re

def rename_files(path, exts):
    for name in sorted(os.listdir(path)):
        ext = os.path.splitext(name)[1]
        for index in exts:
            if ext == index:
                #...
                newname = name
                print(newname)

                oldpath = os.path.join(path, name)
                newpath = os.path.join(path, newname)
                os.rename(oldpath, newpath)

def rename_dirs(path):
    for name in sorted(os.listdir(path)):
        fullpath = os.path.join(path, name)
        if os.path.isdir(fullpath):
            #...
            newname = name
            print(newname)

            newpath = os.path.join(path, newname)
            os.rename(fullpath, newpath)

if __name__ == "__main__":
    path = ""
    exts = [".mp3",".flac"]

    #rename_dirs(path)
    #rename_files(path, exts)
    print("Готово...")


