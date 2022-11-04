ARG PYTHON
FROM python:${PYTHON}-slim-bullseye

ENV PATH="/root/.local/bin:$PATH" \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update \
    && apt-get install -yq curl git pandoc make vim wget \
    && apt-get -y upgrade \
    && curl -sSL https://install.python-poetry.org | python \
    && poetry config virtualenvs.create false

RUN useradd -u 111 -m netdevops

WORKDIR /home/netdevops

COPY --chown=netdevops:netdevops requirements.txt requirements.txt

USER netdevops:netdevops

RUN pip3 install --user --no-cache-dir -r requirements.txt

ENV PATH="/home/netdevops/.local/bin:${PATH}"

WORKDIR /opt/netdevops

CMD ["/bin/bash"]
