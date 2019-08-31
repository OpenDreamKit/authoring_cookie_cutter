FROM continuumio/anaconda3

RUN sudo apt-get update -y 
RUN sudo apt-get install -y  build-essential git pandoc wget  texlive-xetex texlive-generic-extra


RUN conda install k3d -c conda-forge


#RUN mkdir ${HOME}/notebooks
#COPY --chown=sage:sage . ${HOME}/notebooks
#WORKDIR ${HOME}/notebooks
