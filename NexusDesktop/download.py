#-*- coding: utf-8 -*-

import os, codecs, re, urllib, urllib2, cookielib, urlparse

DEFAULT_RESOLUTION = '1024x768'

def initial():
    # Config cookie
    cookie = cookielib.CookieJar()
    processer = urllib2.HTTPCookieProcessor(cookie)
    opener = urllib2.build_opener(processer)
    urllib2.install_opener(opener)

    # make wallpaper dir
    if not os.path.exists('wallpaper'):
        os.mkdir('wallpaper')

def get_pic_info(url):
    pic_id = url.split('/')[-2]
    html = urllib2.urlopen(url).read()
    pattern = r'<a href=\"\/get\/%s\/\?t=(?P<token>.*?)\"' % pic_id
    match = re.search(pattern, html, flags=re.I|re.M|re.S)
    if match:
        return { 'id': pic_id, 'token': match.group('token'), 'size': DEFAULT_RESOLUTION }

def get_pic_file(pic_info):
    redirect_url = 'http://www.desktopnexus.com/dl/inline/%(id)s/%(size)s/%(token)s' % pic_info
    request = urllib2.urlopen(redirect_url)
    return request.geturl()

def download_pic(url):
    print 'fetching picture info...'
    pic_info = get_pic_info(url)
    print 'fetching picture filename...'
    pic_file = get_pic_file(pic_info)
    print pic_file
    print 'saving file...'
    filename = urlparse.urlparse(pic_file).path
    open('./' +filename, 'wb').write(urllib2.urlopen(pic_file).read())
    print 'done'

if __name__ == '__main__':
    initial()
    download_pic('http://architecture.desktopnexus.com/wallpaper/1043620/')
