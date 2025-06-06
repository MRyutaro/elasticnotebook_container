# elasticnotebook_container

## 動かし方

### Docker Hub 経由での動かし方

```
docker run --name elasticnotebook -p 8888:8888 ryutarom/elasticnotebook
```

### ローカルでdockerコマンドを使った動かし方

```
git clone https://github.com/MRyutaro/elasticnotebook_container
docker build -t elasticnotebook .
docker run --name elasticnotebook -p 8888:8888 elasticnotebook
```

### ローカルでdocker composeコマンドを使った動かし方
```
docker compose up
```

## Docker Hub へのアップロード方法

```
docker tag elasticnotebook ryutarom/elasticnotebook
docker push ryutarom/elasticnotebook
```
