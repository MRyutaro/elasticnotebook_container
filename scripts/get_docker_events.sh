#!/bin/bash

# docker events の出力から最初の3フィールド（タイムスタンプ＋イベント種別＋アクション）を抽出
docker events \
    | awk '{print $1, $2, $3}'  # 例: 2025-06-16T16:32:55.717186178+09:00 container kill
