FROM molab/spark-yarn

RUN apt-get install -y build-essential python-dev python-pip

RUN pip install jupyter

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8888

ENTRYPOINT [ "/start.sh" ]
