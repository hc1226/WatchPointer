# WatchPointer 部署进度

## 2026-11-22 最新状态

用户要求保存当前文档、相关记忆和自己的 Git 分支。桌面入口现为 `/Users/hc/Desktop/启动 WatchPointer.command`（链接至项目内同名脚本）；使用说明见 `使用说明-本机部署.md`。部署归档分支为 `codex/watchpointer-deployment-20261122`，用户仓库为 `https://github.com/hc1226/WatchPointer`，本地日志和签名产物不入库。

用户确认手表开发者模式已开启，重启后的再次开启确认也已完成。WatchPointer 已在全新的本机 DerivedData 目录签名构建成功，严格签名校验通过，内嵌描述文件经精确比对包含配对手表。有效产物：`/Users/hc/Library/Developer/Xcode/DerivedData/WatchPointer-Device-bk5h_h8n/Build/Products/Debug-watchos/WatchPointer.app`。

用户已完成手表与 Mac 的开发配对，CoreDevice 实时确认实体手表 Developer Mode enabled、paired、tunnel connected。WatchPointer 已成功安装并前台启动；设备应用列表精确回读确认版本 1.0（build 1）。Mac 接收器仍在运行，并已观察到手表蓝牙连接和动作数据，采样率最高记录为 31 samples/s。正在等待实际鼠标移动、点击等用户验收；尚未宣称完整功能验收。完整当前记录见 `/Users/hc/Desktop/WatchPointer/部署记录-20261122.md`。以下为历史过程，不能当作最新状态。

2026-11-21，来源设备为当前 MacBook Pro，执行者 Codex。

最新状态：用户已下载官方 Xcode 27.3 beta 2，现已安装到 `/Users/hc/Applications/Xcode-27.3-beta2.app`，实测版本 `27.3 / 27C5035i`。安装包 Apple 签名、应用标准深度签名检查和 Gatekeeper 评估通过；首次启动安装返回成功，watchOS 27.3 SDK 可用。额外 strict 检查曾因根目录 FinderInfo 元数据失败，未移除属性或重签名。新 SDK 的 WatchPointer 无签名构建通过，产物位于 `.local/DerivedData-Xcode27.3/Build/Products/Debug-watchos/WatchPointer.app`。原 `/Applications/Xcode.app` 27.2 保留，全局 `xcode-select` 未改；Apple 首次初始化更新了 CoreSimulator 服务。新 Xcode 和 DeviceHub 已打开。升级后首次检查仍无实体手表，等待用户确认信任/开发者模式；手表安装和真机控制尚未完成。下方记录为此前排查过程，关于“等待安装包”的描述已被此最新状态取代。

用户要求部署 https://github.com/umarz317/WatchPointer 到 MacBook Pro 和 Apple Watch Ultra 4。源码位于 `/Users/hc/Desktop/WatchPointer`，固定提交 `504137a1a8748e3560f1c203d06fbd4e0832d582`。

Mac Release 构建、二进制签名完整性检查、启动脚本语法检查通过。接收器已在 Terminal 启动并报告开始蓝牙广播；未验证实际鼠标事件。启动入口为 `/Users/hc/Desktop/WatchPointer/启动 WatchPointer.command`，在对应终端按 Control-C 停止，未配置自动启动。上游 Mac 接收器缺少连接确认，使用完应退出。

手表工程位于 `/Users/hc/Desktop/WatchPointer/Watch/WatchPointer.xcodeproj`，已备份原配置并改成本机团队和独立应用标识。备份为 `/Users/hc/Desktop/WatchPointer/.local/backups/20261121-221045/project.pbxproj`。watchOS SDK 的无签名 Debug 构建通过，尚未签名、安装或真机验收。

用户确认已连接的 iPhone 与 Ultra 4 配对。检查时 Xcode 仅识别手机，未识别实体手表；用户找不到手表开发者模式。已打开 Device Hub，说明按 Apple 官方文档从 `+ → Pair Nearby Device… → Apple Watch` 开始开发配对，之后开发者模式可能才显示。需用户在设备上完成开启、重启、信任确认。

下一步：确认实体手表出现和实际系统版本，完成签名安装，再测试蓝牙、移动、点击、拖拽、滚动、暂停。没有启动模拟器；没有修改全局代理、全局 Xcode 选择或现有服务。

详细记录：`/Users/hc/Desktop/WatchPointer/部署记录-20261121.md`。不含凭据、设备唯一标识或原始日志。历史验证仅代表上述日期状态。

后续排查：用户确认实体手表系统为 watchOS 27.3。只读设备元数据确认当前有线 iPhone 为实体设备、iOS 27.3，开发者模式 enabled，配对状态 paired。Device Hub 中显示 connected 的 Ultra 4 为模拟器（watchOS 27.2，reality=simulated），不能当作实体手表。通过辅助功能读取界面后，已退出 Waiting to pair 窗口并选择实体 iPhone；未修改配对关系、未重启设备，也未关闭用户打开的模拟器。实体手表未出现的原因尚未确定，下一步需核对实体手表隐私与安全性页面和手机 Watch 应用中的连接状态。

用户提供实体手表照片，确认隐私与安全性页面没有开发者模式。用户重新插拔手机数据线后，CoreDevice 和 Xcode 安装目标检查仍未发现实体手表。未确认根因；不能把 Xcode 27.2 与 watchOS 27.3 的版本差异直接断言为原因。

用户随后明确授权升级 Xcode 27.3。Apple 官方发布说明确认当前版本为 Xcode 27.3 beta 2，要求 macOS 26.6+，本机满足。计划独立安装并保留 `/Applications/Xcode.app`（27.2），不覆盖现有版本。检查时磁盘空闲约 31 GiB，现有 Xcode 约 4.0 GiB；新安装包大小和解压所需空间仍待核实。

官方下载安装包需要 Apple 账户网页登录；本次浏览器技能没有可用连接。已通过系统浏览器打开 `https://developer.apple.com/download/all/?q=Xcode%2027.3`，请用户自行登录并把官方 `.xip` 下载到 `/Users/hc/Downloads`。不采集登录凭据或 Cookies。截至本次记录，尚未下载、解压或安装新 Xcode。收到安装包后继续验证 Apple 签名、核对空间、独立安装、验证工具链并重查实体手表。
