FROM python:3.8-slim AS prod

WORKDIR /app
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

RUN pip install poetry;poetry config virtualenvs.create false
ADD poetry.lock pyproject.toml /app/
RUN poetry install --no-dev

ADD ./ /app
