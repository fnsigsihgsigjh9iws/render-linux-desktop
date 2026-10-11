#!/bin/bash
set -e

# تنظیم رزولوشن و نمایشگر مجازی
export DISPLAY=:1
Xvfb :1 -screen 0 1280x720x16 &
sleep 2

# اجرای محیط گرافیکی XFCE
startxfce4 &
sleep 2

# اجرای VNC سرور داخلی بدون نیاز به پسورد اولیه
x11vnc -display :1 -nopw -listen localhost -xkb -forever &
sleep 2

# اجرای پل ارتباطی noVNC روی پورت رندر (10000)
websockify --web /usr/share/novnc 10000 localhost:5900
