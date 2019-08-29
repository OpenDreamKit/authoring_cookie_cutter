FROM sagemath/sagemath:latest

RUN sudo apt-get update -y 
RUN sudo apt-get install -y  build-essential git pandoc wget  texlive-xetex texlive-generic-extra

# sagemath sage its own python, we will use it
RUN /home/sage/sage/local/bin/pip3 install --upgrade pip


ADD requirements.txt requirements.txt
RUN /home/sage/sage/local/bin/pip3 install -r requirements.txt 

# option
# RUN sage -pip install jupyterlab

# Copy the contents of the repo in ${HOME}
RUN mkdir ${HOME}/notebooks
COPY --chown=sage:sage . ${HOME}/notebooks
WORKDIR ${HOME}/notebooks
