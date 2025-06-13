# elasticnotebook_container

## コンテナ起動方法

### Docker Hub 経由でビルド済みのイメージを使ってコンテナを起動する方法

```
docker run -p 8888:8888 ryutarom/elasticnotebook
```

### ローカルでビルドしてコンテナを起動する方法

```
git clone https://github.com/MRyutaro/elasticnotebook_container
docker build -t elasticnotebook .
docker run -p 8888:8888 elasticnotebook
```

### ローカルでdocker composeコマンドを使ってコンテナを起動する方法
```
docker compose up
```

## Docker Hub へのアップロード方法（開発者向け）

```
docker tag elasticnotebook ryutarom/elasticnotebook
docker push ryutarom/elasticnotebook
```

## その他

- JupyterLab接続時のトークンを固定したい場合は環境変数`JUPYTER_TOKEN`の値を設定してください．
- ログレベルを設定したい場合は環境変数`ELASTIC_KERNEL_LOG_LEVEL`の値を`DEBUG`，`INFO`，`WARNING`，`ERROR`，`CRITICAL`から選んで設定してください．
