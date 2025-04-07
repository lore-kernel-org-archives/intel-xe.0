Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F1EC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887C810E472;
	Mon,  7 Apr 2025 13:51:14 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D204D10E472;
 Mon,  7 Apr 2025 13:51:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915/vrr=3A_Stop_writing_V?=
 =?utf-8?q?RR=5FCTL=5FIGN=5FMAX=5FSHIFT_for_LNL_onwards?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 13:51:13 -0000
Message-ID: <174403387385.43715.4850859797380293078@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407063758.3131498-1-jouni.hogander@intel.com>
In-Reply-To: <20250407063758.3131498-1-jouni.hogander@intel.com>
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

Series: drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for LNL onwards
URL   : https://patchwork.freedesktop.org/series/147307/
State : failure

== Summary ==

CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/xt_addrtype.o
  AR      drivers/ata/built-in.a
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC      lib/crc32.o
  CC [M]  net/netfilter/xt_comment.o
  CC      lib/crc64.o
  LD [M]  drivers/net/usb/asix.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  net/netfilter/xt_connbytes.o
  AR      kernel/built-in.a
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  AR      drivers/scsi/built-in.a
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  AR      lib/built-in.a
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  drivers/mfd/atc260x-i2c.o
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
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  net/netfilter/xt_u32.o
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  drivers/mfd/mt6397.o
  AR      drivers/mfd/built-in.a
  LD [M]  drivers/mfd/si476x-core.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  AR      net/built-in.a
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2006: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-default'
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


