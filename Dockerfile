# Use an official Python runtime as a parent image
FROM python:3.9 AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Update apt repositories and install FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY "requirements.txt" "/usr/src/app/requirements.txt"
RUN pip install -r requirements.txt

#RUN alias /gcs-bucket /root/HealthData
COPY canadian_weather_ai.py /usr/src/app/canadian_weather_ai.py
COPY start.sh /usr/src/app
# RUN mkdir -p "/content/assets"
# RUN curl -o "/content/assets/WeatherNetwork.mp3" "https://storage.googleapis.com/can-weather-ai/assets/WeatherNetwork.mp3"

RUN sed -i '/^[ \t]*!pip/d' /usr/src/app/canadian_weather_ai.py
RUN sed -i '/^[ \t]*!curl/d' /usr/src/app/canadian_weather_ai.py
RUN sed -i '/^[ \t]*!display/d' /usr/src/app/canadian_weather_ai.py
RUN sed -i '/^[ \t]*!mkdir/d' /usr/src/app/canadian_weather_ai.py
RUN sed -i '/^[[:space:]]*from IPython.display/d' /usr/src/app/canadian_weather_ai.py
RUN sed -i '/^[ \t]*Image/d' /usr/src/app/canadian_weather_ai.py
RUN sed -i '/^[ \t]*display/d' /usr/src/app/canadian_weather_ai.py

RUN chmod +x "/usr/src/app/start.sh"
# Run script.py when the container launches
ENTRYPOINT ["/usr/src/app/start.sh"]
