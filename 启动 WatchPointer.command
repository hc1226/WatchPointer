#!/bin/zsh
set -eu
set -o pipefail

PROJECT_DIR="${0:A:h}"
RECEIVER="$PROJECT_DIR/Mac/.build/release/WatchPointer"

if [[ ! -x "$RECEIVER" ]]; then
  print -u2 "未找到已编译的接收器：$RECEIVER"
  exit 1
fi

mkdir -p "$PROJECT_DIR/.local"
print "WatchPointer Mac 接收器"
print "首次启动请允许蓝牙访问，并在 系统设置 → 隐私与安全性 → 辅助功能 中允许终端。"
print "授权后如有需要，按 Control-C 停止，再双击本文件重新启动。"
print "用完请按 Control-C 退出；接收器运行时会接受附近兼容设备的鼠标控制。"
print "运行日志：$PROJECT_DIR/.local/mac-receiver.log"
print ""

"$RECEIVER" "$@" 2>&1 | /usr/bin/tee "$PROJECT_DIR/.local/mac-receiver.log"
