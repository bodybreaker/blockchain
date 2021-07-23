FROM ubuntu:18.04

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# FROM으로 지정된 베이스 이미지로 설정하고 있지만 확인하는 의미로 재설정한다.
CMD ["/bin/bash"]
