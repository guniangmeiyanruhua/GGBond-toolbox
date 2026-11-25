# GG Toolbox 精简版

基于 [sistarry/toolbox](https://github.com/sistarry/toolbox) 的 `tool/vps-toolbox.sh` 裁剪复制，只保留 GG 需要的 4 个一级菜单，子功能执行代码与原仓库保持一致（运行时仍从原仓库拉取对应子脚本）：

- **m1 系统设置**（编号 1-19）：更新系统、系统信息、修改 root 密码、root 登录管理、修改 SSH 端口、修改时区、时间同步、切换 v4/V6、开放所有端口、更换系统源、DD Debian13 / Windows、NAT 重装、DD 飞牛、修改语言、修改主机名、DNS 优化、一键优化、VPS 重启
- **m2 网络代理**（编号 20-41）：代理工具箱、FRP、EasyTier、ShellCrash、CF WARP、Tcpfit、BBR+TCP 调参、Socks5/HTTP、VLESS Reality、Snell、Shadowsocks、VLESS Encryption、Hysteria2、Xray-Argo、AnyTLS、nftables、Realm、转发面板、DDNS、流媒体 DNS 解锁、流量狗、流量监控
- **m6 证书管理**（编号 67-71，原一级菜单 6）：NGINX v4 反代、NGINX v6 反代、Caddy 反代、Acme 申请证书、Lucky 反代
- **m7 系统管理**（编号 72-76、78-83，原一级菜单 7）：系统清理、重装系统、系统组件、开发环境、工作区管理、防火墙管理、Fail2ban、系统监控、添加 SWAP、DNS 管理、定时任务

主菜单在本精简版中重新排为 01-04 显示，子菜单编号保持原编号不变，避免与原脚本对照时错位。

## 运行

```bash
bash gg-toolbox.sh
```

安装到服务器后可自行软链接快捷键（会覆盖原 toolbox 的 m，请谨慎）：

```bash
cp gg-toolbox.sh /etc/gg-toolbox.sh && chmod +x /etc/gg-toolbox.sh
ln -sf /etc/gg-toolbox.sh /usr/local/bin/m
ln -sf /etc/gg-toolbox.sh /usr/local/bin/M
```

## 来源与许可

原项目：https://github.com/sistarry/toolbox （MIT License）。本仓库为个人精简复制版，子脚本版权归原作者所有。
