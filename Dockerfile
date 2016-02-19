FROM ytnobody/alpine-perl
MAINTAINER ytnobody <ytnobody@gmail.com>

WORKDIR /usr 
RUN cpm install https://github.com/colon-limited/p5-Amagi.git

ENV PERL5LIB=/usr/local/lib/perl5
ENV PATH=/usr/local/bin:$PATH

WORKDIR /

