FROM jupyter/scipy-notebook

USER root

RUN apt-get update -yq --no-install-recommends && \
  apt-get -y install \
  mecab \
  libmecab-dev \
  mecab-ipadic-utf8 \
  make \
  curl \
  xz-utils \
  file \
  htop \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd && \
  cd /tmp/neologd && \
  ./bin/install-mecab-ipadic-neologd -n -u -y && \
  rm -rf /tmp/neologd

RUN pip install natto-py tqdm bottle contexttimer

USER $NB_USER

EXPOSE 8081
