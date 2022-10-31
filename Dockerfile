FROM python
RUN apt-get update
RUN apt-get install -y python3 python3-pip apt-utils
ENTRYPOINT ["python3" , "time.py"]

