---
marp: true
theme: "base"
headingDivider: 1
paginate: true
size: 16:9
math: katex
---

<!-- beamerはレイアウトが難しい -->
<!-- marpは使いやすくていいね -->
<!-- marpはレイアウトをcssでいじれる -->
<!-- 画像配置もできる -->

# Marpができること
<!-- _class: lead -->

## 岩島楓也(IWASHIMA Fuya)<br>2025,02,01

# もともとbeamerだった
<!-- _class: witht -->

<div class=text>

Latexのbeamerでスライドを作っていたが不具合がおきた．

- Latexがスライドに不向きなこと．
- 画像の調整がめんどくさいこと．
- コンパイルしないとレイアウトが確認できないこと．

スライド作成ではレイアウト調整にできるだけ時間を割きたくない．
しかし，beamerを使用するとかなり無駄な時間ができてしまう．
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. **スライド作成ツールに求めること**
1. 環境構築
1. markdown
1. CSS
1. 自作スタイル
1. 画像の挿入
</div>

# スライド作成ツールに求めること
<!-- _class: split32 -->
<div class=left>

そこで新たなスライド作成ツールを探し始めた．

- オフラインで使えること
- コンパイルがいらないこと
- WYSIWYGではないこと
- レイアウトの自由度が高いこと
</div>

# Marpにした
<!-- _class: split32 -->

<div class=left>

Marpの強み

- MarkDown記法が使える
- cssでレイアウトを整えられる
- pdfに出力可能
- コンパイルしなくてもレイアウトの確認が可能
</div>

<div class=right>

![Marp](./figs/marp.png)
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. スライド作成ツールに求めること
1. **環境構築**
1. markdown
1. CSS
1. 自作スタイル
1. 画像の挿入
</div>

# 環境構築
<!-- _class: split32 -->

<div class=left>

1. Marpをダウンロード
    ```
    $ cd /tmp
    $ curl https://github.com/marp-team/marp-cli/releases/download/v4.1.1/marp-cli-v4.1.1-linux.tar.gz
    $ tar xvfz marp-cli-v4.1.1-linux.tar.gz
    ```
1. パスを通す
    ```
    $ cp marp /usr/local/bin/
    ```
1. 実行確認
    ```
    $ marp -v
    ```
</div>

<div class=right>

実行環境

| 項目 | バージョン |
|-------|--------------------------|
| Ubuntu | 22.04.3 LTS |
| marp-cli | 4.1.1 |
</div>

# コンパイル
<!-- _class: split32 -->

<div class=left>

リポジトリをクローン
```
$ git clone git@github.com:Fuuya1102668/dotfiles.git
$ cd dotfiles/markdown
```

pdfにコンパイル
```
$ marp slide.md --pdf --theme-set ./styles/base.css
```
サーバモードで起動
```
$ marp -s . --theme-set ./styles/base.css
```
</div>

<div class=right>

ファイル構成
```
├── figs/
│   └── marp.png
├── slide.md
├── slide.pdf
└── styles/
    ├── base.css
    └── gaia.scss
```
- サーバモードで起動し，`localhost:8080`にアクセスするとコンパイルしなくてもレイアウトを確認できる．
- 環境変数`PORT`を変更することでアクセスポートを変えられる．
- サーバアドレスは変更できないそう．
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. スライド作成ツールに求めること
1. 環境構築
1. **markdown**
1. CSS
1. 自作スタイル
1. 画像の挿入
</div>

# markdown
<!-- _class: split32 -->

<div class=left>

markdown記法を用いて記述する．
- 箇条書き
- 表
- コードブロック
- 画像
</div>

<div class=right>

| 日本語 | English |
|---|---|
|こんにちは|Hello|
|世界|World|
```
print("Hello World")
```
![width:300px](./figs/Ticon.png)
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. スライド作成ツールに求めること
1. 環境構築
1. markdown
1. **CSS**
1. 自作スタイル
1. 画像の挿入
</div>

# CSS
<!-- _class: witht -->

<div class=text>

レイアウトはCSSで記述する．
デフォルトの`gaia`をもとに，いくつかレイアウトを作成した．
- lead
- contents
- witht
- split32 
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. スライド作成ツールに求めること
1. 環境構築
1. markdown
1. CSS
1. **自作スタイル**
1. 画像の挿入
</div>

# lead
<!-- _class: lead -->

## 名字名前(MYOUJI Namae)<br>yyyy/mm/dd

# leadの記述
<!-- _class: witht -->

<div class=text>

h1(#)にスライド全体のタイトルを書く．

h2(##)に作者と日付を書く．
作者と日付は`<br>`で改行するとよい．

```
# lead
<!-- _class: lead -->
## 名字名前(MYOUJI Namae)<br>yyyy/mm/dd
</div>
```
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. ここに目次を
1. 書くとよい
1. **ボールドで**
1. 現在のスライドを示す
</div>

# contentsの記述
<!-- _class: witht -->

<div class=text>

`---`をいれて明示的に改ページする．

`<div class=title>`は`## contents`が入り，
`content`はスライドによって変更し，次のスライドはボールド．

```
---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. ここに目次を
1. 書くと良い
1. **ボールドで**
1. 現在のスライドを示す
</div>
```
</div>

# witht
<!-- _class: witht -->

<div class=text>

`<!-- _class: witht -->`は垂直方向に中央揃えでコンテンツを配置する．
`<div class=text>`を作成し，その中にスライドの内容を記述する．

`<div>`のすぐ下に記述すると，markdown記法が反映されないので注意したい．
```
# witht 
<!-- _class: witht -->

<div class=text>

`<!-- _class: witht -->`は垂直方向に中央揃えでコンテンツを配置するためのクラスである．
`<div class=text>`を作成し，その中にスライドの内容を記述する．

`<div>`のすぐ下に記述すると，markdown記法が反映されないので注意したい．
</div>
```
</div>

# split32 
<!-- _class: split32 -->

<div class=left>

画面を縦に3:2で分割し，
左右にコンテンツを展開する．

主に左側にはテキストを書く．

- `<div class=left>`に左側のコンテンツ
- `<div class=right>`に右側のコンテンツ
`right`の文字はフォントサイズが20pxになる．

</div>

<div class=right>

主に右側には画像やコードを書く．
```
# split32 
<!-- _class: split32 -->
<div class=left>

画面を縦に3:2で分割し，
左右にコンテンツを展開する．

主に左側にはテキストを書く．
</div>

<div class=right>

主に右側には画像を置く．
</div>
```
</div>

---
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. スライド作成ツールに求めること
1. 環境構築
1. markdown
1. CSS
1. 自作スタイル
1. **画像の挿入**
</div>

# 画像の挿入
<!-- _class: split32 -->

<div class=left>

画像の挿入はmarkdownで記法できる．
`![画像の説明](ファイルパス)`

![width:300px](./figs/Ticon.png)
</div>

<div class=right>

`[]`にはフィルターを指定することができる．

| フィルター | 効果 |
|---|---|
|blur||
|brightness||
|contrast||
|drop-shadow||
|grayscale||
|hue-rotate||
|invert||
|opacity||
|saturate||
|sepia||
|bg cover||
</div>

# blur
![blur width:500px](./figs/Ticon.png)
`![blur width:500px](./figs/Ticon.png)`
# brightness
![brightness width:500px](./figs/Ticon.png)
`![brightness width:500px](./figs/Ticon.png)`
# contrast
![contrast width:500px](./figs/Ticon.png)
`![contrast width:500px](./figs/Ticon.png)`
# drop-shadow
![drop-shadow width:500px](./figs/Ticon.png)
`![drop-shadow width:500px](./figs/Ticon.png)`
# grayscale 
![grayscale width:500px](./figs/Ticon.png)
`![grayscale width:500px](./figs/Ticon.png)`
# hue-rotate
![hue-rotate width:500px](./figs/Ticon.png)
`![hue-rotate width:500px](./figs/Ticon.png)`
# invert
![invert width:500px](./figs/Ticon.png)
`![invert width:500px](./figs/Ticon.png)`
# opacity
![opacity width:500px](./figs/Ticon.png)
`![opacity width:500px](./figs/Ticon.png)`
# saturate
![saturate width:500px](./figs/Ticon.png)
`![saturate width:500px](./figs/Ticon.png)`
# sepia
![sepia width:500px](./figs/Ticon.png)
`![sepia width:500px](./figs/Ticon.png)`
# bg
![bg](./figs/Ticon.png)
`![bg](./figs/Ticon.png)`
# bg 横並び
![bg](./figs/Ticon.png)
![bg](./figs/Ticon.png)
![bg](./figs/Ticon.png)
```
![bg](./figs/Ticon.png)
![bg](./figs/Ticon.png)
![bg](./figs/Ticon.png)
```
# bg 縦並び
![bg vertical](./figs/Ticon.png)
![bg](./figs/Ticon.png)
![bg](./figs/Ticon.png)
```
![bg vertical](./figs/Ticon.png)
![bg](./figs/Ticon.png)
![bg](./figs/Ticon.png)
```
# bg 右
![bg right](./figs/Ticon.png)
`![bg right](./figs/Ticon.png)`
# bg 左
![bg left](./figs/Ticon.png)
`![bg left](./figs/Ticon.png)`

