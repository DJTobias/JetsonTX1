# copied from https://gist.github.com/jampekka/ec4a3f3a3748fd2a281d/

import numpy as np
import cv2
import gi
gi.require_version('Gst', '1.0')
from gi.repository import GObject, Gst


def gst_to_opencv(gst_buffer):
    return np.ndarray((480,640,3), buffer=gst_buffer.extract_dup(0, gst_buffer.get_size()), dtype=np.uint8)

Gst.init(None)

#pipe = Gst.parse_launch("""v4l2src device=/dev/video2 ! appsink sync=false max-buffers=2 drop=true name=sink emit-signals=true""")
pipe = Gst.parse_launch("""v4l2src device=/dev/video2 ! video/x-raw, width=640, height=480,format=(string)BGR ! appsink sync=false max-buffers=2 drop=true name=sink emit-signals=true""")

sink = pipe.get_by_name('sink')
pipe.set_state(Gst.State.PLAYING)

count = 0
while True:
    print count
    sample = sink.emit('pull-sample')
    if count % 100 == 0:
        print type(sample.get_buffer())
        print sample.get_buffer().get_size()
        print sample.get_buffer()
        print dir(sample.get_buffer())
        print type(sample.get_buffer().__str__())
        print sample.get_buffer().__str__()
        img = gst_to_opencv(sample.get_buffer())
        cv2.imwrite('./frame.jpg', img)
    count += 1

