FROM jupyter/minimal-notebook:python-3.11
ENV EG_PORT=10100

USER root

RUN apt update && apt install -yq gcc python3-dev curl fd-find ack-grep
RUN ln -s /usr/bin/fdfind /usr/local/bin/fd

USER jovyan

RUN pip install poetry

ENV PATH="/root/.local/bin:$PATH" \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  # Poetry's configuration:
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_CACHE_DIR='/var/cache/pypoetry' \
  POETRY_HOME='/usr/local' \
  POETRY_VERSION=1.7.1

COPY taskmates_enterprise_gateway taskmates_enterprise_gateway
COPY etc/ipython_config.py ~/.ipython/profile_default/ipython_config.py
COPY pyproject.toml .
COPY poetry.lock .
COPY README.md .

RUN poetry install

EXPOSE $EG_PORT

CMD poetry run jupyter enterprisegateway --port=$EG_PORT --EnterpriseGatewayApp.list_kernels=True
