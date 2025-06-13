# Pythonの軽量イメージを使用
FROM python:3.12-slim-bookworm

# uvのセットアップ
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends git libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# tmpディレクトリに移動してライブラリをインストール
WORKDIR /tmp

# すべての操作を1つのRUNコマンドにまとめる
RUN uv pip install --no-cache-dir --system jupyter elastic-notebook-slim && \
    git clone --depth 1 https://github.com/MRyutaro/ElasticKernel.git && \
    chmod +x ElasticKernel/setup.sh && \
    ElasticKernel/setup.sh /tmp/ElasticKernel /usr/local/share/jupyter/kernels && \
    rm -rf /tmp/ElasticKernel && \
    rm -rf ~/.cache/pip/*

# ディレクトリを移動
WORKDIR /app

# jupyterlabの実行
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
