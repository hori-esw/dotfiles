#!/usr/bin/env python
__author__ = 'hori'

# datetime
from datetime import datetime

# bottle
import bottle
from bottle import get, post, run
from bottle import request, template, redirect
from bottle import HTTPError

# sqlalchemy
from sqlalchemy import create_engine, Column, Integer, Unicode, DateTime, UnicodeText
from sqlalchemy.ext.declarative import declarative_base

# bottle-sqlalchemy
from bottle.ext import sqlalchemy

# WTForms
from wtforms.form import Form
from wtforms import validators
from wtforms import StringField, IntegerField, TextAreaField



Base = declarative_base()
engine = create_engine('sqlite:///:memory:', echo=True)

# bottle-sqlalchemyの設定
plugin = sqlalchemy.Plugin(
    engine,
    Base.metadata,
    keyword='db',
    create=True,
    commit=True,
    use_kwargs=False
)

bottle.install(plugin)

# モデルの作成

class Book(Base):

    # booksテーブルを使用
    __tablename__ = 'books'

    # カラムの定義
    id = Column(Integer, primary_key=True)
    title = Column(Unicode(100), nullable=False)
    price = Column(Integer, nullable=False)
    memo = Column(UnicodeText)
    created_at = Column(DateTime, default=datetime.now)

    def __repr__(self):
        return "<Book('%s','%s','%s','%s')>" % (self.title, self.price, self.memo, self.created_at)

