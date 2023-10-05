# my-im-select

MacOS 用のシェル上でIMを切り替えるツール。

[im-select](https://github.com/daipeihust/im-select) をベースにして作成している。
違いは現在と同じ input source が指定された場合に、変更を実行しない。

上記の変更は、同じ input source が指定された場合でも、変更を実行すると「A」や
「あ」と入ったアイコンがインライン上で表示されるため、これを抑制する目的で行った。


## 使い方
### 現在の Input Source ID を取得

```
$ my-im-select
com.apple.keylayout.ABC
```


### Input Source を変更

```
$ my-im-select com.apple.keylayout.ABC
com.apple.keylayout.ABC
```


## build方法

```
$ swift build -c release
```
