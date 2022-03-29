# use the `mongo` image
# copy the app directory and any files needed for your implementation from your local to the container
# equip it with all the packages and installs needed to run the flask app (packages are defined in app/requirements.txt. `pip install -r app/requirements.txt`)
# expose the port flask app will run on

FROM mongo

# FROM python:latest
# ADD . /app
# WORKDIR /app
COPY /app /app
# COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y python3 python3-pip 
RUN pip3 install -r /app/requirements.txt
CMD ["python3", "/app/app.py"]
EXPOSE 5001
