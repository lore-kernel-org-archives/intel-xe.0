Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A135C369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82AB10E6B2;
	Tue,  8 Apr 2025 13:52:07 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4F10E6B2;
 Tue,  8 Apr 2025 13:52:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915/wm=3A_convert_to_stru?=
 =?utf-8?q?ct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 13:52:06 -0000
Message-ID: <174412032621.48086.10579168389902787365@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744119460.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744119460.git.jani.nikula@intel.com>
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

Series: drm/i915/wm: convert to struct intel_display (rev2)
URL   : https://patchwork.freedesktop.org/series/147192/
State : failure

== Summary ==

CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  drivers/mfd/tps6507x.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  drivers/mfd/tps65086.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  drivers/mfd/ocelot-spi.o
  AR      lib/built-in.a
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  AR      fs/built-in.a
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  drivers/mfd/max8907.o
  CC [M]  drivers/mfd/mp2629.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  net/netfilter/xt_u32.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  drivers/mfd/mt6397-irq.o
  CC [M]  drivers/mfd/mt6358-irq.o
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  AR      kernel/built-in.a
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  drivers/mfd/vx855.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  drivers/mfd/atc260x-i2c.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/mt6397.o
  AR      drivers/mfd/built-in.a
  LD [M]  drivers/mfd/ocelot-soc.o
  AR      net/built-in.a
  LD [M]  drivers/mfd/si476x-core.o
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2006: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-default'
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


