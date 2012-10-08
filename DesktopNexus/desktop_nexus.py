#-*- coding: utf-8 -*-
from optparse import OptionParser

import os, re, logging
import urllib2, cookielib, urlparse

RE_WALLPAPER = r'http\:\/\/[^\/\.]+\.desktopnexus\.com\/wallpaper\/\d+\/'
CHUNK_SIZE = 1024 * 1024

class DesktopNexus:
    def __init__(self, feed=None, page=None, size=None, output_dir=None):
        self.feed = feedurl
        self.page = page_url
        self.size = size
        self.output_dir = output_dir

    def start(self):
        print 'Making output directory:', self.output_dir
        if not os.path.exists(self.output_dir):
            os.mkdir(self.outout_dir)

        # Setup cookie
        cookie = cookielib.CookieJar()
        processer = urllib2.HTTPCookieProcessor(cookie)
        opener = urllib2.build_opener(processer)
        urllib2.install_opener(opener)

        self._read_page()

    def _get_pic_info(self, url):
        pic_id = url.split('/')[-2]
        html = urllib2.urlopen(url).read()
        pattern = r'<a href=\"\/get\/%s\/\?t=(?P<token>.*?)\"' % pic_id
        match = re.search(pattern, html, flags=re.I|re.M|re.S)
        if match:
            return { 'id': pic_id, 'token': match.group('token'), 'size': options.size }

    def _get_pic_file(self, pic_info):
        redirect_url = 'http://www.desktopnexus.com/dl/inline/%(id)s/%(size)s/%(token)s' % pic_info

        request = urllib2.urlopen(redirect_url)
        return request.geturl()

    def _download_pic(self, url):
        pic_info = self.get_pic_info(url)
        pic_file = self.get_pic_file(pic_info)
        filename = os.path.split(urlparse.urlparse(pic_file).path)[-1]
        print'  Saving file: %s' % filename)
        open(os.path.join(os.path.abspath(DOWNLOAD_DIR),filename), 'wb').write(urllib2.urlopen(pic_file).read())

    def _read_page(self):
        try:
            html = urllib2.urlopen(self.page_url).read()
            links = set(re.findall(RE_WALLPAPER, html, re.M|re.I))
            count = len(links)

            print 'Downloading wallpapers:'
            for i, link in enumerate(links):
                print '[%2d/%d]: %s' % (i + 1, count, link)
                try:
                    self._download_pic(link)
                except Exception as e:
                    print '  Error:', e.message
        except Exception as e:
            print e.message

if __name__ == '__main__':
    # Setup optparser
    parser = OptionParser()
    # parser.add_option('-f', '--feed', dest='feed', help='specific a feed url')
    parser.add_option('-p', '--page', dest='page', help='specific a page that includes wallpaper list')
    parser.add_option('-s', '--size', dest='size', help='specific the wallpaper size, default 1440x900', default='1440x900')
    parser.add_option('-o', '--output', desk='ouput_dir', help='specific the output directory, default to "wallpapers"', default='wallpapers')
    (options, args) = parser.parse_args()

    dn = DesktopNexus(**options)
    dn.start()
