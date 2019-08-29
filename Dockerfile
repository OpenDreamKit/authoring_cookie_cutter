FROM sagemath/sagemath:latest

RUN sudo apt-get update -y 
RUN sudo apt-get install -y python3 python3-dev  git pandoc wget python3-pip texlive-xetex texlive-generic-extra

ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN sage -pip install jupyterlab

# Copy the contents of the repo in ${HOME}
COPY --chown=sage:sage . ${HOME}
