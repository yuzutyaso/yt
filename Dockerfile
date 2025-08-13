# 使用するベースイメージを指定
FROM python:3.9-slim

# 必要なシステム依存関係をインストール (ffmpegはyt-dlpが内部的に使用)
RUN apt-get update && apt-get install -y ffmpeg

# アプリケーションのコードをコンテナにコピー
COPY . /app

# 作業ディレクトリを設定
WORKDIR /app

# 必要なPythonパッケージをインストール
RUN pip install -r requirements.txt

# ポート5000を公開
EXPOSE 5000

# アプリケーションを起動 (Procfileを使用)
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
