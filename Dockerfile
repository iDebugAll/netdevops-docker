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


RUN pip3 install --no-cache-dir \
    nornir \
    nornir_netmiko \
    nornir_napalm \
    nornir_paramiko \
    nornir_scrapli \
    nornir_netbox \
    nornir_ansible \
    netmiko \
    napalm \
    paramiko \
    scrapli \
    pexpect \
    pynetbox \
    textfsm \
    ntc-templates \
    ttp \
    numpy \
    pandas \
    flask \
    fastapi \
    "uvicorn[standard]" \
    gunicorn \
    python-zeep \
    psycopg2-binary \
    sqlalchemy \
    kafka-python \
    pika \
    redis \
    pytest \
    pylint \
    flake8 \
    yamllint \
    tabulate \
    rich \
    gitpython \
    openpyxl \
    scapy


RUN useradd -u 111 netdevops

WORKDIR /opt/netdevops

CMD ["/bin/bash"]

