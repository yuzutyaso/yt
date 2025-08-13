from flask import Flask, render_template, request
import yt_dlp
import json

app = Flask(__name__)

def get_video_info(url):
    try:
        ydl_opts = {
            'noplaylist': True,
            'quiet': True,
            'no_warnings': True,
            'format': 'bestvideo+bestaudio/best',
            'skip_download': True,
        }
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info = ydl.extract_info(url, download=False)
            return info
    except Exception as e:
        print(f"Error: {e}")
        return None

@app.route('/', methods=['GET', 'POST'])
def index():
    video_info = None
    if request.method == 'POST':
        url = request.form['url']
        if url:
            video_info = get_video_info(url)
    return render_template('index.html', video_info=video_info)

# 開発用サーバーの起動コードは削除
# if __name__ == '__main__':
#     app.run(debug=True)
