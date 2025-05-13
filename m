Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B1BC3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 14:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD5210E5BF;
	Tue, 13 May 2025 14:52:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594810E5BF;
 Tue, 13 May 2025 14:52:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EBuild=3A_success_for_drm/xe/vf=3A_Fail_migration_re?=
 =?utf-8?q?covery_if_fixups_needed_but_platform_not_supported?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 14:52:31 -0000
Message-ID: <174714795100.75033.9402869680727772908@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512230614.571026-1-tomasz.lis@intel.com>
In-Reply-To: <20250512230614.571026-1-tomasz.lis@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported
URL   : https://patchwork.freedesktop.org/series/148914/
State : success

== Summary ==

INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_mark.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_stp.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_dnat.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_vlan.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_arpreply.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_mark.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_redirect.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_snat.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_dnat.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_log.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_redirect.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_snat.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_nflog.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_log.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/bridge.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/br_netfilter.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sunrpc/sunrpc.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/netfilter/ebt_nflog.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/br_netfilter.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/kcm/kcm.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_core.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_ip.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_netlink.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/bridge/bridge.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/kcm/kcm.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_core.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_ip.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sunrpc/sunrpc.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_netlink.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_eth.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_debugfs.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_ip6.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_eth.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_debugfs.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/l2tp/l2tp_ip6.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp_ipv4.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp_ipv6.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp_diag.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sctp/sctp.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp_ipv4.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp_ipv6.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/dccp/dccp_diag.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sctp/sctp_diag.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/rds/rds.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/rds/rds_tcp.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet_fd.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet_xen.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sctp/sctp.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/sctp/sctp_diag.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/rds/rds.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/rds/rds_tcp.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet_fd.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet_xen.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet_virtio.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/psample/psample.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vsock.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vsock_diag.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vmw_vsock_vmci_transport.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/9p/9pnet_virtio.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/psample/psample.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vsock.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vsock_diag.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vmw_vsock_vmci_transport.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vmw_vsock_virtio_transport.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/hv_sock.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vmw_vsock_virtio_transport.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/hv_sock.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vsock_loopback.ko
  INSTALL debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/virt/lib/irqbypass.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/net/vmw_vsock/vsock_loopback.ko
  STRIP   debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+/kernel/virt/lib/irqbypass.ko
  DEPMOD  debian/linux-image-6.15.0-rc6-xe+/lib/modules/6.15.0-rc6-xe+
dpkg-deb: building package 'linux-headers-6.15.0-rc6-xe+' in '../linux-headers-6.15.0-rc6-xe+_6.15.0~rc6-gde5fafae7336-2_amd64.deb'.
dpkg-deb: building package 'linux-image-6.15.0-rc6-xe+' in '../linux-image-6.15.0-rc6-xe+_6.15.0~rc6-gde5fafae7336-2_amd64.deb'.
dpkg-deb: building package 'linux-image-6.15.0-rc6-xe+-dbg' in '../linux-image-6.15.0-rc6-xe+-dbg_6.15.0~rc6-gde5fafae7336-2_amd64.deb'.
 dpkg-genbuildinfo --build=binary -O../linux-upstream_6.15.0~rc6-gde5fafae7336-2_amd64.buildinfo
 dpkg-genchanges --build=binary -O../linux-upstream_6.15.0~rc6-gde5fafae7336-2_amd64.changes
dpkg-genchanges: info: binary-only upload (no source code included)
 dpkg-source --after-build .
dpkg-buildpackage: info: binary-only upload (no source included)
make[1]: Leaving directory '/kernel/build64-debug'
+ mkdir -p kernel-debug/ kernel-debug/deb
+ mv kernel-debug.tar.gz kernel-debug/
+ mv linux-headers-6.15.0-rc6-xe+_6.15.0~rc6-gde5fafae7336-2_amd64.deb linux-image-6.15.0-rc6-xe+_6.15.0~rc6-gde5fafae7336-2_amd64.deb linux-image-6.15.0-rc6-xe+-dbg_6.15.0~rc6-gde5fafae7336-2_amd64.deb linux-libc-dev_6.15.0~rc6-gde5fafae7336-2_amd64.deb kernel-debug/deb/
+ sync
[+] Finished building and packaging 'debug'!
+ echo '[+] Finished building and packaging '\''debug'\''!'
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


