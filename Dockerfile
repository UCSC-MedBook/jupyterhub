FROM jupyterhub/jupyterhub
RUN useradd -m -p `perl -e 'printf("%s\n", crypt($ARGV[0], "password"))' "asdasd"` -s /bin/bash medbook
RUN pip install dockerspawner jupyter_client oauthenticator
