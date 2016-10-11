FROM jupyterhub/jupyterhub
ADD containerScripts /scripts
RUN pip install jupyter_client oauthenticator
ADD dockerspawner /dockerspawner
RUN cd /dockerspawner && pip install .