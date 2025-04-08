Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0294AC3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA5710E686;
	Tue,  8 Apr 2025 13:25:06 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCC410E237;
 Tue,  8 Apr 2025 13:25:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/xe=3A_Extend_WA_1401809469?=
 =?utf-8?q?1_to_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 13:25:06 -0000
Message-ID: <174411870636.48098.16793993602132407160@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408130702.679403-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250408130702.679403-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Extend WA 14018094691 to BMG
URL   : https://patchwork.freedesktop.org/series/147403/
State : failure

== Summary ==

CC [M]  net/netfilter/x_tables.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  AR      lib/built-in.a
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  net/netfilter/xt_TPROXY.o
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  drivers/mfd/mt6397.o
  LD [M]  drivers/mfd/si476x-core.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  AR      drivers/mfd/built-in.a
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  net/netfilter/xt_realm.o
  AR      fs/built-in.a
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  net/netfilter/xt_u32.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  AR      net/built-in.a
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2006: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-default'
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


