Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E533C282C5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 12:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265EB10E2D0;
	Mon,  3 Mar 2025 12:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbDqC59X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BD910E2D0;
 Mon,  3 Mar 2025 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741004921; x=1772540921;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fl5pZ/HNVtahvvvB9GgLMSY/KUQSvF1UbxSvqKywxmQ=;
 b=RbDqC59XqUwSr0a9rhIfYs4YEFVRYLYB8zAU42f+e+9+r+0Lma7IuKjG
 2LkWcUA7PsqNLPBLJ41b+Lu26hxA3vJ3PrX0x3MihbnTHio5k7ce3ZaAd
 nCI6MqX0q69McwJmORU8X7EfpoxXMk6JY1mD4WFz4ZLayJEcEPWr8Kusi
 WjAlxYrshjb14X7QXXeVxkeExfOMFu82OHktcekvTLoCIrFTnvJXOQJN2
 yOOQRZPgPA/Gl3rAXwGWzyseWd7Ln4wZcD177Sm/vWEg6uEDpzz02mitA
 7eCkhtUMaTZLMNAB0Q0UcEjiHZPIPi3ZyL70aMELhdxJggnBfkY8z3EAq g==;
X-CSE-ConnectionGUID: fQGmNGIcTX+leYBmEl/Qag==
X-CSE-MsgGUID: KBOmgngLSXSSJ/O7amjSHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41730393"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41730393"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 04:28:41 -0800
X-CSE-ConnectionGUID: Z3p6lEAMQeKefVyl6d/cwg==
X-CSE-MsgGUID: +CEqCBCAQa6aNFN2YXtBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123208688"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 03 Mar 2025 04:28:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Mar 2025 14:28:37 +0200
Date: Mon, 3 Mar 2025 14:28:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLkJ1aWxkOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Message-ID: <Z8WgdR0W_P2QCPxQ@intel.com>
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
 <174099615126.85071.11536405173709166652@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174099615126.85071.11536405173709166652@b555e5b46a47>
X-Patchwork-Hint: comment
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 03, 2025 at 10:02:31AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
> URL   : https://patchwork.freedesktop.org/series/145706/
> State : failure
> 
> == Summary ==
> 
> LD [M]  net/ipv6/netfilter/nf_tproxy_ipv6.ko
>   LD [M]  net/ipv6/netfilter/nf_reject_ipv6.ko
>   LD [M]  net/ipv6/netfilter/nf_dup_ipv6.ko
>   LD [M]  net/ipv6/netfilter/nft_reject_ipv6.ko
>   LD [M]  net/ipv6/netfilter/nft_dup_ipv6.ko
>   LD [M]  net/ipv6/netfilter/nft_fib_ipv6.ko
>   LD [M]  net/ipv6/netfilter/ip6t_ah.ko
>   LD [M]  net/ipv6/netfilter/ip6t_eui64.ko
>   LD [M]  net/ipv6/netfilter/ip6t_frag.ko
>   LD [M]  net/ipv6/netfilter/ip6t_ipv6header.ko
>   LD [M]  net/ipv6/netfilter/ip6t_mh.ko
>   LD [M]  net/ipv6/netfilter/ip6t_hbh.ko
>   LD [M]  net/ipv6/netfilter/ip6t_rpfilter.ko
>   LD [M]  net/ipv6/netfilter/ip6t_rt.ko
>   LD [M]  net/ipv6/netfilter/ip6t_srh.ko
>   LD [M]  net/ipv6/netfilter/ip6t_NPT.ko
>   LD [M]  net/ipv6/netfilter/ip6t_REJECT.ko
>   LD [M]  net/ipv6/netfilter/ip6t_SYNPROXY.ko
>   LD [M]  net/ipv6/ah6.ko
>   LD [M]  net/ipv6/esp6.ko
>   LD [M]  net/ipv6/esp6_offload.ko
>   LD [M]  net/ipv6/ipcomp6.ko
>   LD [M]  net/ipv6/xfrm6_tunnel.ko
>   LD [M]  net/ipv6/tunnel6.ko
>   LD [M]  net/ipv6/mip6.ko
>   LD [M]  net/ipv6/ila/ila.ko
>   LD [M]  net/ipv6/ip6_vti.ko
>   LD [M]  net/ipv6/sit.ko
>   LD [M]  net/ipv6/ip6_tunnel.ko
>   LD [M]  net/ipv6/ip6_gre.ko
>   LD [M]  net/ipv6/fou6.ko
>   LD [M]  net/ipv6/ip6_udp_tunnel.ko
>   LD [M]  net/packet/af_packet_diag.ko
>   LD [M]  net/8021q/8021q.ko
>   LD [M]  net/llc/llc.ko
>   LD [M]  net/llc/llc2.ko
>   LD [M]  net/tls/tls.ko
>   LD [M]  net/key/af_key.ko
>   LD [M]  net/bridge/netfilter/nft_meta_bridge.ko
>   LD [M]  net/bridge/netfilter/nft_reject_bridge.ko
>   LD [M]  net/bridge/netfilter/nf_conntrack_bridge.ko
>   LD [M]  net/bridge/netfilter/ebtables.ko
>   LD [M]  net/bridge/netfilter/ebtable_broute.ko
>   LD [M]  net/bridge/netfilter/ebtable_filter.ko
>   LD [M]  net/bridge/netfilter/ebtable_nat.ko
>   LD [M]  net/bridge/netfilter/ebt_802_3.ko
>   LD [M]  net/bridge/netfilter/ebt_among.ko
>   LD [M]  net/bridge/netfilter/ebt_arp.ko
>   LD [M]  net/bridge/netfilter/ebt_ip.ko
>   LD [M]  net/bridge/netfilter/ebt_ip6.ko
>   LD [M]  net/bridge/netfilter/ebt_limit.ko
>   LD [M]  net/bridge/netfilter/ebt_mark_m.ko
>   LD [M]  net/bridge/netfilter/ebt_pkttype.ko
>   LD [M]  net/bridge/netfilter/ebt_stp.ko
>   LD [M]  net/bridge/netfilter/ebt_vlan.ko
>   LD [M]  net/bridge/netfilter/ebt_arpreply.ko
>   LD [M]  net/bridge/netfilter/ebt_mark.ko
>   LD [M]  net/bridge/netfilter/ebt_dnat.ko
>   LD [M]  net/bridge/netfilter/ebt_redirect.ko
>   LD [M]  net/bridge/netfilter/ebt_snat.ko
>   LD [M]  net/bridge/netfilter/ebt_log.ko
>   LD [M]  net/bridge/netfilter/ebt_nflog.ko
>   LD [M]  net/bridge/bridge.ko
>   LD [M]  net/bridge/br_netfilter.ko
>   LD [M]  net/sunrpc/sunrpc.ko
>   LD [M]  net/sunrpc/auth_gss/auth_rpcgss.ko
>   LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
>   LD [M]  net/kcm/kcm.ko
>   LD [M]  net/l2tp/l2tp_core.ko
>   LD [M]  net/l2tp/l2tp_ip.ko
>   LD [M]  net/l2tp/l2tp_netlink.ko
>   LD [M]  net/l2tp/l2tp_eth.ko
>   LD [M]  net/l2tp/l2tp_debugfs.ko
>   LD [M]  net/l2tp/l2tp_ip6.ko
>   LD [M]  net/dccp/dccp.ko
>   LD [M]  net/dccp/dccp_ipv4.ko
>   LD [M]  net/dccp/dccp_ipv6.ko
>   LD [M]  net/dccp/dccp_diag.ko
>   LD [M]  net/sctp/sctp.ko
>   LD [M]  net/sctp/sctp_diag.ko
>   LD [M]  net/rds/rds.ko
>   LD [M]  net/rds/rds_tcp.ko
>   LD [M]  net/9p/9pnet.ko
>   LD [M]  net/9p/9pnet_fd.ko
>   LD [M]  net/9p/9pnet_xen.ko
>   LD [M]  net/9p/9pnet_virtio.ko
>   LD [M]  net/psample/psample.ko
>   LD [M]  net/vmw_vsock/vsock.ko
>   LD [M]  net/vmw_vsock/vsock_diag.ko
>   LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.ko
>   LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.ko
>   LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
>   LD [M]  net/vmw_vsock/hv_sock.ko
>   LD [M]  net/vmw_vsock/vsock_loopback.ko
> make[1]: Leaving directory '/kernel/build64-default'
> make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
> make: *** [Makefile:251: __sub-make] Error 2

This mail is completely useless. Can someone fix the CI to report useful
things?

> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
> 

-- 
Ville Syrjälä
Intel
