#!/bin/bash
# clipboard内のsamba形式のリモートファイルのパスをwindowsスタイルに変換します（逆もやります）

clipboard=$(xsel --clipboard --output)
smb_prefix='#### enter your samba prefix ####' # smb://user_name@192.168.1.1/
win_prefix='#### enter your UNC path prefix ####' # \\fileserver01\
win_prefix_escaped=$(echo -n $win_prefix | sed -e 's/\\/\\\\/g')

if [[ $(echo $clipboard | grep  "^smb") ]]; then
    # sambaパスが来た場合

    tmp_clipboard=$(echo -n $clipboard | sed -e "s%${smb_prefix}%%" -e 's%/%\\%g')
    echo -n ${win_prefix}${tmp_clipboard} |
    xsel --clipboard --input

elif [[ $(echo $clipboard | grep '^\\\\') ]]; then
    # windowsパスが来た場合

    tmp_clipboard=$(echo -n $clipboard | sed -e "s/${win_prefix_escaped}//i" -e 's%\\%/%g')
    echo -n ${smb_prefix}${tmp_clipboard} |
    xsel --clipboard --input
else
    # パスでない場合
    exit 1
fi

notify-send 'パス変換' $(xsel --clipboard --output)
exit 0
