# セットアップ(Windows端末用)
以下、管理者権限ユーザーで実施する。

## 1.開発環境構築
### Chocolatey
パッケージ管理アプリ

#### インストール手順
デスクトップのスタートボタンをクリックし、
``` powershell ```
と入力する。

最も一致する検索結果にWindows PowerShellが表示される。
「管理者として実行する」をクリックする。

以下のコマンドを実行して、Chocolateyをインストールする。
```ps
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

cf. 上記コマンドは下記のURLに記載されている。
> https://chocolatey.org/install#installing-chocolatey
> **run the following command**と記載された直下にあるコマンドをPowerShellで実行する。

Chocolateyのインストール確認のため、
以下のコマンドを実行する。
```ps
choco list -localonly
```

実行結果でChocolateyが表示されていることを確認する。
```ps
Chocolatey v1.1.0
chocolatey 1.1.0
1 packages installed.
```

引き続き、Chocolatey GUIをインストールする。
```choco install ChocolateyGUI -y```

インストールが正常終了していれば、
処理結果が標準出力(PowerShellの画面)に以下のように表示される。
```
The install of chocolateygui was successful.
```

### JDK
Javaの開発・動作に必要な開発キット
#### インストール手順
デスクトップからスタートボタンをクリックし、Chocolatey GUIを起動する。
左のメニューからchocolateyをクリックして画面を切り替える。
次のとおりに操作して検索する。

* Match Word Exactlyにチェックを付ける。
* Searchにopenjdkを入力し、Enterキーを押下する。

検索結果にopenjdkの最新版が表示される。

cf. 2022/09/30時点でバージョン19.0.0である。

検索結果のopenjdkをダブルクリックして、画面右下のinstallボタンをクリックする。
インストールが完了すると、
```C:\Program Files```
フォルダ配下にOpenJDKフォルダが作成されていて、
Chocolatey GUIからOpenJDKがインストールされている。

インストール確認のため、新しくPowerShellを管理者権限で起動し、
```java -version```
と入力、Enterキー押下する。OpenJDK 19.0.0をインストールした場合、
以下のように標準出力に表示される。
```ps
openjdk version "19" 2022-09-20
OpenJDK Runtime Environment (build 19+36-2238)
OpenJDK 64-Bit Server VM (build 19+36-2238, mixed mode, sharing)
```

<!--
メンター用備忘録
Chocolatey GUI経由でOpenJDKをインストールした場合、
環境変数JAVA_HOMEの追加及びpathへの追記も併せて実施される
-->

### Pleiades All in One Eclipse
Java等の統合開発環境
* [公式サイト](https://mergedoc.osdn.jp/)
`Windows x64`  >  `Full Edition`  >  `Java`のダウンロードボタンをクリックしてダウンロードしてください。
<!--
メンター用備忘録
Windows x64 Full Edition Javaの場合、LombokやSTSプラグインも導入されているため、
上記EclipseのセットアップだけでSpring Bootアプリケーションを開発開始可能です。
-->

### Docker
非常に軽量なコンテナ型のアプリケーション実行環境  
* [Docker Desktop ダウンロードサイト](https://www.docker.com/products/docker-desktop/)
* Download Docker Desktop Windowsのボタンをクリックしてダウンロードする。

* 起動時にエラーが発生する場合、下記のサイトの通りにコマンド実行など実施する。
[セットアップ手順記載先](https://learn.microsoft.com/ja-jp/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)

### Github
ソースコード管理等のWebサービス
[github.com](https://github.com/)
* アカウントを持っていなければ場合は登録する。(以下、例としてアカウントをyamada-t、メールアドレスをyamada-t@company.co.jpとする。)
* 新規リポジトリを作成する。
* 作成したリポジトリの `Settings` > `Manage access` `Invite a collaborator` から研修担当者のGithubアカウントを追加する。
* Slack研修用チャンネルに作成したリポジトリの通知がくるように連携を行う。
    `/github subscribe yamada-t/shopping reviews`
    認証を要求してくるので手順に従い設定する。
* Gitのユーザー設定
```base
git config --global user.name "yamada-t"
git config --global user.email "yamada-t@company.co.jp"
```

### Oracle 
データベース管理システム
 * [Oracle Database 21cダウンロードサイト](https://www.oracle.com/jp/database/technologies/xe-downloads.html)
 * Oracle Database 21c Express Edition for Linux x64 ( OL7 )をダウンロードする。


## 2. 研修アプリの取得と作業用リポジトリへプッシュ
研修アプリを取得した後、自分の作業用リポジトリへプッシュを行う。
```bash
# 研修用リポジトリをローカルにshoppingというディレクトリ名でクローン
git clone https://github.com/hara-y-illmatics/java-shopping-template shopping
# shoppingへ移動
cd shopping
# originの再設定
# <URL> は作成した自分のリポジトリの "HTTPS" を使用する
git remote set-url origin <URL>
# Githubにローカルリポジトリをプッシュ
git push origin master
```

## 3. masterブランチのプロテクションルール設定
Githubでmasterへのマージをレビュー必須とする[設定](https://drive.google.com/drive/folders/1jwtMsaLBwvPpkmjvfqIdrkwqHWQXjq7k?usp=sharing)を行う。
`.github/CODEOWNERS`に指定したGithubアカウントのレビュー承認を受けなければマージできなくなる。
## 4. ダウンロード済みのOracle XE の移動

WIP
