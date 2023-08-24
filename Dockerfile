FROM python:3.9-slim AS builder

WORKDIR /app

# https://github.com/pyinstaller/pyinstaller/issues/6358
RUN apt-get update && apt-get install binutils -y

COPY . ./

COPY requirements.txt .

RUN pip install -r /app/requirements.txt
RUN pip install pyinstaller --upgrade
RUN pyinstaller helm_tag_updater.py -n helm_tag_updater --onefile

FROM python:3.9-slim 

WORKDIR /

RUN apt-get update && apt-get install git -y
COPY --from=builder /app/dist/helm_tag_updater /usr/local/bin 
