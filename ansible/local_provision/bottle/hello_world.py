__author__ = 'hori'

# モジュールのimport
from bottle import route, run, template

# ルーティングの設定
@route('/hello')
def hello():

    # テンプレートの描画
    return template('Hello {{string}}', string='World')

# 動的ルーティングの設定
@route('/greeting/<name>')
def greeting(name):
    # テンプレートの描画
    # try:
    #     name
    # except NameError:
    #     name = 'world'

    return template('Hello {{name}}.', name=name)

# ビルトイン開発用サーバの起動
if __name__ == '__main__':
    run(host='0.0.0.0', port='8080', debug=True, reloader=True)
