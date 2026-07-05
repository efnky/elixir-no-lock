FROM hexpm/elixir:1.17.3-erlang-27.2-debian-bookworm-20241016-slim AS builder
WORKDIR /app
ENV MIX_ENV=prod
RUN mix local.hex --force && mix local.rebar --force
COPY mix.exs ./
RUN mix deps.get --only prod
COPY . .
RUN mix do compile, release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl3 \
    libncurses6 \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
WORKDIR /app
RUN groupadd -r appuser && useradd -r -g appuser -u 1001 appuser
COPY --from=builder /app/_build/prod/rel/elixir_no_lock ./
RUN chown -R appuser:appuser /app
EXPOSE 8080
USER 1001
CMD ["bin/elixir_no_lock", "start"]