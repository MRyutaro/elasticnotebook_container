# Pythonの軽量イメージを使用
FROM python:3.12-slim-bookworm

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y git libgomp1 && \
    rm -rf /var/lib/apt/lists/*

# tmpディレクトリに移動
WORKDIR /tmp

# ライブラリのインストール
RUN pip install jupyter elastic-notebook-slim && \
    git clone https://github.com/MRyutaro/jupyter_elastic_kernel.git && \
    chmod +x jupyter_elastic_kernel/setup.sh && \
    jupyter_elastic_kernel/setup.sh /tmp/jupyter_elastic_kernel /usr/local/share/jupyter/kernels && \
    rm -rf /tmp/jupyter_elastic_kernel

# ディレクトリを移動
WORKDIR /app

# jupyterlabの実行
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
