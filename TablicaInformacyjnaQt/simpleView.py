#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PySide2.QtWidgets import QApplication, QLCDNumber
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl, QTimer, QTime

import sys

class Clock(QLCDNumber) :
    def __init__(self) :
        super().__init__()

        title = "Digital Clock"
        top = 400
        left = 400
        width = 150
        height = 100

        self.setWindowTitle(title)
        self.setGeometry(top, left, width, height)

        self.setSegmentStyle(QLCDNumber.Filled)
        timer = QTimer(self)
        timer.timeout.connect(self.showTime)
        timer.start(1000)

        self.showTime()

    def showTime(self) :
        time = QTime.currentTime()
        text = time.toString('hh:mm')
        if (time.second() % 2) == 0 :
            text = text[:2] + ' ' + text[3:]

        self.display(text)

app = QApplication([])
# clock = Clock()
view = QQuickView()
url = QUrl("view.qml")

view.setSource(url)
view.show()
# clock.show()
app.exec_()
