FROM pyiron/damask:2020-10-30

COPY . ${HOME}/
RUN rm ${HOME}/*.ipynb

USER root
RUN fix-permissions /home/$DOCKER_USER &&\
    fix-permissions $CONDA_DIR

# Switch back to pyiron to avoid accidental container runs as root
USER $DOCKER_UID

WORKDIR $HOME
