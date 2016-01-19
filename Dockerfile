FROM ubuntu
RUN apt-get update
RUN apt-get install -y socat
ADD index.html /
CMD /bin/bash -c "socat -vv TCP-LISTEN:80,crlf,reuseaddr,fork SYSTEM:\"echo HTTP/1.0 200; echo Content-Type\: text/html; echo; cat /index.html;\""
EXPOSE 80
