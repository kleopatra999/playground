#!/usr/bin/env python
#-*- coding:utf-8 -*-

import sys
import urllib
import os
from shutil import copyfile
from datetime import datetime

HOST_START_FLAG = '#Hosts 开始'
HOST_END_FLAG = '#Hosts 结束'

SMARTHOSTS = 'https://smarthosts.googlecode.com/svn/trunk/hosts'
LOCALHOSTS = '/etc/hosts'

def get_udpate_time(line):
    return datetime.strptime(line, '#UPDATE:%y-%m-%d %H:%M')

def update_smart_hosts():
    # download smarthosts
    smarthosts = urllib.urlopen(SMARTHOSTS)
    localhosts = open(LOCALHOSTS, 'rw+')
    
    # move the cusor to smarthosts's start flag.
    smart_line = smarthosts.readline().decode('gb2312').encode('utf-8')
    while HOST_START_FLAG not in smart_line:
        smart_line = smarthosts.readline().decode('gb2312').encode('utf-8')
    
    # move the cursor to localhosts's start flag
    # if the flag not exists, move to the end
    local_line = localhosts.readline()# .decode('gb2312').encode('utf-8')
    while len(local_line) > 0 and HOST_START_FLAG not in local_line:
        local_line = localhosts.readline()# .decode('gb2312').encode('utf-8')
    
    localhosts.write(HOST_START_FLAG + os.linesep)
    for line in smarthosts:
        localhosts.write(line.strip().decode('gb2312').encode('utf-8') + os.linesep)
    print 'finished!'

    localhosts.close()
    smarthosts.close()
     
if __name__ == '__main__':
    # Backup old hosts file
    copyfile(LOCALHOSTS, 'hosts.bak')
    update_smart_hosts()
