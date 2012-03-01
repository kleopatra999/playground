#!/usr/bin/env python
#-*- coding: utf-8 -*-
import sys
import os
import webbrowser

def js2marklet(jsfile):
    outfile = jsfile + '.html'
    name = os.path.basename(jsfile)
    print jsfile, '==>', outfile
    try:
        with open(outfile, 'w+') as fout:
            fout.write('<a href="javascript:')
            with open(jsfile) as fin:
                for line in fin.xreadlines():
                    fout.write(line.strip())
            fout.write('">%s</a> Drag me to the bookmark bar.' % name)
        webbrowser.open_new_tab(os.path.abspath(outfile))
    except Exception as e:
        print 'Fail!', e

if __name__ == '__main__':
    if len(sys.argv) > 1:
        js2marklet(sys.argv[1])
