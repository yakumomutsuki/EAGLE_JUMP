# EAGLE_JUMP
- Rubyで動くslack用のbotです
- 某イーグルジャンプという会社で働く元気なかわいいお仕事が大好きな女の子の設定です

## 環境変数
当スクリプトには、以下の環境変数の設定が必要です。
- ENV['SLACK_API_TOKEN']    SlackのAPIキーを設定
- ENV['USER_LOCAL_API_KEY'] UserLocalというサービスで使用するAPIキーを設定

## 動かす
以下のコマンドを入力
```bash
$ git clone https://github.com/yakumomutsuki/EAGLE_JUMP.git
$ cd EAGLE_JUMP
$ bundle install
```

そのうえで
```bash
$ sh exec.sh
```

と入力すると、動いてくれるはずです。