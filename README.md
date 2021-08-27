# util
使いまわせそうなスクリプト

## multi_ssh.sh
複数マシンにssh接続を行い，キー入力の同期により，複数マシンへの一括操作を支援するスクリプト．
Tmux synchronize-panes を利用

### 使い方
`multi_ssh.sh session_name ip_array user_name private_key`
* session_name: Tmuxセッション名．
* ip_array: 接続先IPを格納した配列名を与える．配列は事前に定義するか，スクリプト内に書き込む．
* user_name: ssh ログインユーザ名．
* private_key: sshログインに用いる秘密鍵の場所．
