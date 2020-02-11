## 自分用のinit.el

パッケージのインストールは以下の２つの方法
1. `M-x package-list-packages`から検索して選ぶ
1. `M-x package-refresh-contents`で綺麗にしてから、`M-x package-install`でパッケージ名を入力する

設定ファイルの基本は[ここ](https://wakaba-mafin.hatenablog.com/entry/setup-init-file-emacs)を参考

>Emacsの基本設定を変更するには、Emacsの設定ファイルを使いやすいように編集すればOKです！そして、Emacsの設定ファイルは次の4つのうち、上から順に優先的に読み込まれます（ただし、読み込まれるのは1つだけ）
>
> ~/.emacs.el
>
> ~/.emacs
>
> ~/.emacs.d/init.el
>
> ~/.emacs.d/init

・普通の補完は[auto-complete](https://github.com/auto-complete/auto-complete)で、公式マニュアルが[こちら](https://github.com/auto-complete/auto-complete/blob/master/doc/manual.md)、解説記事は[こちら](http://keisanbutsuriya.hateblo.jp/entry/2015/02/08/175005)

（この際、あいまい検索をするために[fuzzy](https://github.com/auto-complete/fuzzy-el)も入れる）

・バッファ切り替えとファイル名補完は[ido](https://www.gnu.org/software/emacs/manual/html_node/ido/index.html)を使用
(この際、[ido-vertical-mode](https://github.com/creichert/ido-vertical-mode.el)も使用)

・ディレクトリ内の全文検索は`M-x grep-find`（もしくは`M-x find-grep`）を使って、そのまま検索ワードを打てば良い（宣言や参照移動もこれで十分っぽい、シェルで検索するときは`grep xxxx -rl ./`で良さそう）

## 使用方法

ホームディレクトリで`git clone https://github.com/minnsou/.emacs.d.git`するだけ

すでに`~/.emacs.d`があるときは消しておく

#### 小ネタ

- cloneしてすぐは`emacs -q`で初期設定のまま起動できる
- 設定を試したい時は、行末で`C-c C-e`すれば即座に反映される
- `Meta`は`C-[`を使えば、キーボードの割り当て変更をしなくても良い
- 単純置換は`M-x replace-string`（ただし現在の位置から前方のみ）
- 問い合わせ置換は`M-x query-replace`（デフォルトで`M-%`）
- 任意の行に飛ぶには`M-x goto-line`（デフォルトで`M-g g`）

## 参考文献

qiitaの補完まとめ
- https://qiita.com/tadsan/items/33ebb8db2271897a462b
- https://qiita.com/blue0513/items/c0dc35a880170997c3f5

うわっ...私のEmacs、使いにくすぎ？だったら...ｶｽﾀﾏｲｽﾞｼﾔｯｾｰ!!ﾀﾞｧﾀﾞｧｼｴﾘｲｪｯｽｯｼｪｰｼｮｰﾍｲﾍｲ!!!
- https://sandai.hatenadiary.org/entry/20120304/p2

Helmについての記事（TAB補完じゃないとのことでHelmは諦めた）
- https://qiita.com/jabberwocky0139/items/86df1d3108e147c69e2c