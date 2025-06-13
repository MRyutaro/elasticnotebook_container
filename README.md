# elasticnotebook_container

## コンテナ起動方法

### 方法 1. Docker Hub 上のビルド済みイメージ + `docker compose`コマンド

```
docker compose up
```

### 方法 2. ローカルでビルド + `docker compose`コマンド

```
docker compose -f docker-compose.local.yml up
```

### 方法 3. Docker Hub 上のビルド済みイメージ + `docker run`コマンド

```
docker run -p 8888:8888 ryutarom/elasticnotebook
```

### 方法 4. ローカルでビルド + `docker run`コマンド

```
git clone https://github.com/MRyutaro/elasticnotebook_container
docker build -t elasticnotebook .
docker run -p 8888:8888 elasticnotebook
```

## Docker Hub へのアップロード方法（開発者向け）

```
docker tag elasticnotebook ryutarom/elasticnotebook
docker push ryutarom/elasticnotebook
```

## その他

- JupyterLab 接続時のトークンを固定したい場合は環境変数`JUPYTER_TOKEN`の値を設定してください．
- ログレベルを設定したい場合は環境変数`ELASTIC_KERNEL_LOG_LEVEL`の値を`DEBUG`，`INFO`，`WARNING`，`ERROR`，`CRITICAL`から選んで設定してください．
