FROM --platform=linux/amd64 ruby:3.1

#コンテナ内にアプリ用のディレクトを作成
ENV APP_ROOT /indian_calculation
ENV TZ=Asia/Tokyo

#作業用ディレクトリを作成し、設定
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

#ローカルのgemファイルをコンテナ内のにコピー
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN gem update --system && \
    bundle install

#ローカルの現在のディレクトリファイルをコンテナ内にコピー
COPY . /$APP_ROOT

#エントリーポイント実行
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

##Dockerイメージの起動時にデフォルトで実行
CMD ["rails", "server", "-b", "0.0.0.0"]