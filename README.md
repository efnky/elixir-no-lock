# elixir-no-lock ⚠️

Bölüm 2 — Repo / proje yapısı. **Saf mix (Dockerfile YOK).**

`mix.exs` var ama **`mix.lock` YOK** (bilerek `.gitignore`'da). Bağımlılıklar (plug_cowboy)
pinlenmemiş → build sırasında `mix deps.get` en son uyumlu sürümü çeker. Beklenen ⚠️:
reproducible-build riski; komuta lock'suz build'i çalıştırır ama sürümler deterministik değil.

- Dil/Framework: Elixir 1.20 / Plug+Cowboy
- Bağımlılık: plug_cowboy (**mix.lock yok → pinsiz**)
- Mimari: Monolit
- Port: 4000
- Dockerfile: yok
