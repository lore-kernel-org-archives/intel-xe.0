Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E9C282C5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 10:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B3110E3B0;
	Mon,  3 Mar 2025 10:02:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337010E3B0;
 Mon,  3 Mar 2025 10:02:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/client=3A_Build_the_tests_?=
 =?utf-8?q?with_CONFIG=5FDRM=5FKUNIT=5FTEST=3Dm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 10:02:31 -0000
Message-ID: <174099615126.85071.11536405173709166652@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
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

Series: drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
URL   : https://patchwork.freedesktop.org/series/145706/
State : failure

== Summary ==

LD [M]  net/ipv6/netfilter/nf_tproxy_ipv6.ko
  LD [M]  net/ipv6/netfilter/nf_reject_ipv6.ko
  LD [M]  net/ipv6/netfilter/nf_dup_ipv6.ko
  LD [M]  net/ipv6/netfilter/nft_reject_ipv6.ko
  LD [M]  net/ipv6/netfilter/nft_dup_ipv6.ko
  LD [M]  net/ipv6/netfilter/nft_fib_ipv6.ko
  LD [M]  net/ipv6/netfilter/ip6t_ah.ko
  LD [M]  net/ipv6/netfilter/ip6t_eui64.ko
  LD [M]  net/ipv6/netfilter/ip6t_frag.ko
  LD [M]  net/ipv6/netfilter/ip6t_ipv6header.ko
  LD [M]  net/ipv6/netfilter/ip6t_mh.ko
  LD [M]  net/ipv6/netfilter/ip6t_hbh.ko
  LD [M]  net/ipv6/netfilter/ip6t_rpfilter.ko
  LD [M]  net/ipv6/netfilter/ip6t_rt.ko
  LD [M]  net/ipv6/netfilter/ip6t_srh.ko
  LD [M]  net/ipv6/netfilter/ip6t_NPT.ko
  LD [M]  net/ipv6/netfilter/ip6t_REJECT.ko
  LD [M]  net/ipv6/netfilter/ip6t_SYNPROXY.ko
  LD [M]  net/ipv6/ah6.ko
  LD [M]  net/ipv6/esp6.ko
  LD [M]  net/ipv6/esp6_offload.ko
  LD [M]  net/ipv6/ipcomp6.ko
  LD [M]  net/ipv6/xfrm6_tunnel.ko
  LD [M]  net/ipv6/tunnel6.ko
  LD [M]  net/ipv6/mip6.ko
  LD [M]  net/ipv6/ila/ila.ko
  LD [M]  net/ipv6/ip6_vti.ko
  LD [M]  net/ipv6/sit.ko
  LD [M]  net/ipv6/ip6_tunnel.ko
  LD [M]  net/ipv6/ip6_gre.ko
  LD [M]  net/ipv6/fou6.ko
  LD [M]  net/ipv6/ip6_udp_tunnel.ko
  LD [M]  net/packet/af_packet_diag.ko
  LD [M]  net/8021q/8021q.ko
  LD [M]  net/llc/llc.ko
  LD [M]  net/llc/llc2.ko
  LD [M]  net/tls/tls.ko
  LD [M]  net/key/af_key.ko
  LD [M]  net/bridge/netfilter/nft_meta_bridge.ko
  LD [M]  net/bridge/netfilter/nft_reject_bridge.ko
  LD [M]  net/bridge/netfilter/nf_conntrack_bridge.ko
  LD [M]  net/bridge/netfilter/ebtables.ko
  LD [M]  net/bridge/netfilter/ebtable_broute.ko
  LD [M]  net/bridge/netfilter/ebtable_filter.ko
  LD [M]  net/bridge/netfilter/ebtable_nat.ko
  LD [M]  net/bridge/netfilter/ebt_802_3.ko
  LD [M]  net/bridge/netfilter/ebt_among.ko
  LD [M]  net/bridge/netfilter/ebt_arp.ko
  LD [M]  net/bridge/netfilter/ebt_ip.ko
  LD [M]  net/bridge/netfilter/ebt_ip6.ko
  LD [M]  net/bridge/netfilter/ebt_limit.ko
  LD [M]  net/bridge/netfilter/ebt_mark_m.ko
  LD [M]  net/bridge/netfilter/ebt_pkttype.ko
  LD [M]  net/bridge/netfilter/ebt_stp.ko
  LD [M]  net/bridge/netfilter/ebt_vlan.ko
  LD [M]  net/bridge/netfilter/ebt_arpreply.ko
  LD [M]  net/bridge/netfilter/ebt_mark.ko
  LD [M]  net/bridge/netfilter/ebt_dnat.ko
  LD [M]  net/bridge/netfilter/ebt_redirect.ko
  LD [M]  net/bridge/netfilter/ebt_snat.ko
  LD [M]  net/bridge/netfilter/ebt_log.ko
  LD [M]  net/bridge/netfilter/ebt_nflog.ko
  LD [M]  net/bridge/bridge.ko
  LD [M]  net/bridge/br_netfilter.ko
  LD [M]  net/sunrpc/sunrpc.ko
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.ko
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
  LD [M]  net/kcm/kcm.ko
  LD [M]  net/l2tp/l2tp_core.ko
  LD [M]  net/l2tp/l2tp_ip.ko
  LD [M]  net/l2tp/l2tp_netlink.ko
  LD [M]  net/l2tp/l2tp_eth.ko
  LD [M]  net/l2tp/l2tp_debugfs.ko
  LD [M]  net/l2tp/l2tp_ip6.ko
  LD [M]  net/dccp/dccp.ko
  LD [M]  net/dccp/dccp_ipv4.ko
  LD [M]  net/dccp/dccp_ipv6.ko
  LD [M]  net/dccp/dccp_diag.ko
  LD [M]  net/sctp/sctp.ko
  LD [M]  net/sctp/sctp_diag.ko
  LD [M]  net/rds/rds.ko
  LD [M]  net/rds/rds_tcp.ko
  LD [M]  net/9p/9pnet.ko
  LD [M]  net/9p/9pnet_fd.ko
  LD [M]  net/9p/9pnet_xen.ko
  LD [M]  net/9p/9pnet_virtio.ko
  LD [M]  net/psample/psample.ko
  LD [M]  net/vmw_vsock/vsock.ko
  LD [M]  net/vmw_vsock/vsock_diag.ko
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.ko
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.ko
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
  LD [M]  net/vmw_vsock/hv_sock.ko
  LD [M]  net/vmw_vsock/vsock_loopback.ko
make[1]: Leaving directory '/kernel/build64-default'
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


