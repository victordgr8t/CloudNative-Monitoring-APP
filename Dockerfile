FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt .

# Update package manager and install required dependencies
RUN apt-get update && apt-get install -y gcc python3-dev

# Update pip
RUN python3 -m pip install --upgrade pip

#install the required python packages
RUN pip3 install --no-cache-dir -r requirements.txt

#copy the application code to the working directory
COPY . .

#set the environment variables for the flask app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the port on which the flask app wil run
EXPOSE 5000

# start the Flask app when the conainer is run
CMD [ "flask", "run"]