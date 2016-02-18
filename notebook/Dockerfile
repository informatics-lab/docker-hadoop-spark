FROM molab/spark-yarn

RUN apt-get install -y build-essential python3-dev python3-pip

RUN pip3 install jupyter

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8888

ENTRYPOINT [ "/start.sh" ]
