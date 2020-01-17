#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

def print_list(printdirs, printfiles, newstring, padding, maxrecursive, recursive, mainlist):
    if maxrecursive > recursive:
        dirname = (padding * recursive) + mainlist['dir']

        print(dirname)

        for item in mainlist['childs']:
            print_list(printdirs, printfiles, newstring, padding, maxrecursive, recursive + 1, item)

        if printfiles == True and len(mainlist['files']) > 0:
            ftab = padding * (recursive + 1)

            if len(mainlist['childs']) > 0:
                print(ftab + "===")

            #print("\n" + ftab + mainlist['dir'] + " files:")

            for item in mainlist['files']:
                filename = ftab + item
                print(filename)

        if newstring == True and recursive == 1:
            print("")

def get_list(maxrecursive, basepath, dirname):
    childs = []
    files  = []

    recursive = maxrecursive - 1
    fullpath  = os.path.join(basepath, dirname)

    if recursive >= 0 and os.path.isdir(fullpath):
        for newfile in sorted(os.listdir(fullpath)):
            newpath = os.path.join(fullpath, newfile)
            if os.path.isfile(newpath):
                files.append(newfile)

            if os.path.isdir(newpath):
                childs.append(get_list(recursive, fullpath, newfile))

    files  = sorted(files)

    return {'path': basepath, 'dir': dirname, 'files': files, 'childs': childs}

if __name__ == "__main__":
    recursive  = 2
    basepath   = "/mnt/music/selected"
    dirname    = "The best of classic" #selected artists

    padding    = "    "

    printdirs  = True
    printfiles = True
    newstring  = False

    mainlist   = get_list(recursive, basepath, dirname)

    print_list(printdirs, printfiles, newstring, padding, recursive, 0, mainlist)

    print("Готово...")
