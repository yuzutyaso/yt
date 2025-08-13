# 使用するベースイメージを指定
FROM python:3.9-slim

# 必要なシステム依存関係をインストール (yt-dlpが内部的に使用するffmpegなど)
RUN apt-get update && apt-get install -y ffmpeg

# アプリケーションのコードをコンテナにコピー
COPY . /app

# 作業ディレクトリを設定
WORKDIR /app

# 必要なPythonパッケージをインストール
RUN pip install -r requirements.txt

# アプリケーションを起動
CMD ["python", "app.py"]
