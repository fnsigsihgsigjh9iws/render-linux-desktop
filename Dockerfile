FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=10000

# نصب پکیج‌های پایه، محیط سبک XFCE و ابزارهای وب‌سوکت
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-terminal \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    curl \
    wget \
    git \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# کپی اسکریپت راه‌اندازی
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 10000

ENTRYPOINT ["/entrypoint.sh"]
