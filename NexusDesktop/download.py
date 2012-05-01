#-*- coding: utf-8 -*-

import os, codecs, re, urllib, urllib2, cookielib

def initial():
    # Config cookie
    cookie = cookielib.CookieJar()
    processer = urllib2.HTTPCookieProcessor(cookie)
    opener = urllib2.build_opener(processer)
    urllib2.install_opener(opener)


if __name__ == '__main__':
    url = 'http://animals.desktopnexus.com/get/1042643/?t=n4vdpl65q4hi3oagpo2lt1v9j34f9e3d290fb9c'

