#!/usr/bin/env python

#: ix-config
#: to: #{{ configs.firefox }}/scripts
#: access: 777

# Author: 0x20F
# Original Author: blackhole89
#
# Modified version of the rofi-tab-switcher
# back-end from here:
# https://github.com/blackhole89/rofi-tab-switcher
#
# No major changes, mostly simplified things.
# Goes hand in hand with the 'rofi_interface.json' file
# and the rofi-tab-switcher extension for firefox:
# https://addons.mozilla.org/sv-SE/firefox/addon/rofi-tab-switcher


import json
import sys
import struct
import subprocess
import random
from xml.sax.saxutils import escape


rofi_theme = "#{{ configs.rofi }}/menus/tabs"


### JSON I/O for Firefox FFI from Mozilla websites
# Read a message from stdin and decode it.
def get_message():
    raw_length = sys.stdin.buffer.read(4)
    if not raw_length:
        sys.exit(0)
    message_length = struct.unpack('=I', raw_length)[0]
    message = sys.stdin.buffer.read(message_length)
    return json.loads(message)


# Encode a message for transmission, given its content.
def encode_message(message_content):
    encoded_content = json.dumps(message_content)
    encoded_length = struct.pack('=I', len(encoded_content))
    return {'length': encoded_length, 'content': encoded_content}


# Send an encoded message to stdout.
def send_message(encoded_message):
    sys.stdout.buffer.write(encoded_message['length'])
    sys.stdout.write(encoded_message['content'])
    sys.stdout.flush()


### main loop
while True:
    message = get_message()

    # spawn rofi and get selection
    rofi = subprocess.Popen(
        "rofi -dmenu -p 'Go to tab' -markup-rows -theme %s" % (
            message['active'],
            rofi_theme
        ),
        shell=True,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE
    )

    out, err = rofi.communicate(
        u''.join(
            map(
                lambda tab:u"<span>(%d)</span> %s <span alpha='50%%'>%s</span>\n" % (
                    tab['window'],
                    escape(tab['title']),
                    escape(tab['url'])),
                    message['tabs']
            )
        ).encode('utf-8')
    )

    # if anything was selected, tell browser side to switch to that tab
    if out != b'':
        send_message(encode_message(message['tabs'][int(out)]['id']))


