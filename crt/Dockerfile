FROM crt:base

MAINTAINER zhaohy "Wechat:4106807"
ENV REFRESHED_AT 2017-07-17

# install software
ADD scripts /home/ute/scripts

RUN rm -rf /tmp/.X* \
    && rm -f /home/ute/.vnc/*.log \
    && rm -f /home/ute/.vnc/*.pid \
    && rm -rf /sw/* \
    && rm -rf /var/Logs/* \
    && rm -rf /var/WiresharkLogs/* \
    && rm -rf /home/scpadm/Robot_Logs/* \
    && rm -rf /home/scpadm/BTS_SW/*.zip \
    && rm -rf /home/scpadm/BTS_SW/AICT/* \
    && rm -rf /home/scpadm/svn/Report/* \
    && rm -rf /home/ute/robot_logs/* \
    && rm -f /opt/iphy/latest/*.log \
    && rm -f /opt/iphy/latest/*.log.* \
    && rm -f /opt/iphy/latest/*.zip \
    && rm -f /opt/iphy/latest/logs/*.log \
    && apt-get autoclean \
    && apt-get clean \
    && chown ute:ute -R /home/ute/scripts \
    && chmod +x /home/ute/scripts/*.sh \
    && cat /dev/null>/root/.bash_history

EXPOSE 22

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901

USER ute
WORKDIR /home/ute

ENV DISPLAY :1
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1366x768
#ENV VNC_PW vncpassword

ENTRYPOINT ["/home/ute/scripts/service_startup.sh"]
CMD ["/sbin/init"]


