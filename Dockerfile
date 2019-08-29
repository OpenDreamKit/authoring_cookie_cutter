FROM sagemath/sagemath:latest

RUN apt-get update -y && apt-get install -y python3 python3-dev  git pandoc wget python3-pip texlive-xetex texlive-generic-extra
RUN pip3 install --upgrade pip
RUN pip install bookbook

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

# RUN sage -pip install jupyterlab

# Copy the contents of the repo in ${HOME}
COPY --chown=sage:sage . ${HOME}
