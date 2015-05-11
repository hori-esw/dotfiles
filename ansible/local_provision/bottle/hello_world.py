__author__ = 'hori'
# -*- coding: utf-8 -*-

# モジュールのimport
from bottle import route, get, post, run, template, request

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

@route('/show_header')
def show_header():
    #ヘッダ情報の表示
    headers_list = ["<p> %s = %s </p>" % (k, v) for k, v in request.headers.items()]
    return "".join(headers_list)

@route('/show_cookie')
def show_cookie():
    count = request.cookies.get('count')
    return template('count={{count}}', count=count)

@get('/show_query')
def show_query():
    keyword = request.query.keyword
    return template('keyword={{keyword}}', keyword=keyword)

@post('/show_form')
def show_form():
    name = request.forms.get('name')
    return template('name={{name}}', name=name)

# ビルトイン開発用サーバの起動
if __name__ == '__main__':
    run(host='0.0.0.0', port='8080', debug=True, reloader=True)
