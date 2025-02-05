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

1. listed item
1. listed item
1. listed item
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

# 環境構築
<!-- _class: split32 -->

<div class=left>

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
</div>

# コンパイル
<!-- _class: split32 -->

<div class=left>

pdfにコンパイル
```
$ marp slide.md --pdf --theme-set ./styles/base.css -s
```

サーバモードで起動
```
$ marp -s . --pdf --theme-set ./styles/base.css
```
</div>

<div class=right>
</div>
