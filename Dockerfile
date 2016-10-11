FROM jupyterhub/jupyterhub
ADD containerScripts /scripts
RUN pip install dockerspawner jupyter_client oauthenticator
USER root