#-*- coding: utf-8 -*-
import re, os, urllib2

BASE = 'https://src.chromium.org'

def download(url):
    content = urllib2.urlopen(url).read()
    match = re.search(r'<a href=\"(.*?)\"><strong>download<\/strong><\/a>', content, flags=re.IGNORECASE|re.MULTILINE)
    if match:
        print BASE + match.group(0)

def fetch_resouces():
    print 'fetching page content'
    content = urllib2.urlopen('https://src.chromium.org/viewvc/chrome?view=rev&revision=126438').read()
    print 'parsing'
    for result in re.findall(r'<tr class=\"vc_row_(even|odd)\">\s*<td><a href="(?P<LINK>.*?)">', content, flags=re.IGNORECASE|re.MULTILINE):
        download(BASE + result[1])

if __name__ == '__main__':
    fetch_resouces()
