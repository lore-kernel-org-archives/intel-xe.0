Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB994C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 05:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2283E10E670;
	Wed,  6 Dec 2023 05:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE210E670
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 05:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701841006; x=1733377006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ANyBw2Y7iAe8TSkOauS1pACGpdcwcKv8x8ejCOwHu4=;
 b=UiykCSzcB7hVaMWAY3CENl+88WGvGhPHISO8SUA5ZbXqwFFp4f7mKid0
 VLChOrgc/sSeDGR0C4FluQDjo13f724GKFhOV8EjkQRQtsM+i6b7dzKLb
 cokEz9AaQiMOtZQ5p7osHPWQLKsFahWFvNH/dSG9JOg4dcyq/PIj6KjHB
 GarWxT1JPAga7nE+3Bn9+5i40mT21lo4svj7WuKE9Gj+PioetKvRUHAMq
 FAVpp45uPkeuhMQMR5WW6hG+Rpu+5i50F/gEauKeoDahtpT2trIpCVj46
 IfHnA6PinlzN9nzPvPu9I55RZm4KqVcPeBhWtZT1zzt4ROfl//uI1AJG/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393739542"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="393739542"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 21:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800229869"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="800229869"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 21:36:44 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 11:16:15 +0530
Message-Id: <20231206054615.884040-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 18032095049 and
 16021639441
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This workaround applies to graphics 20.04 on all engines.

Workaround has three parts :
1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
   (at least not right now) since we don't use MI_ATOMIC anywhere
   in the kernel mode driver.
2. Memory-based interrupt masking - Memory-based interrupt processing
   isn't supported on physical functions, only virtual functions,
   according to bspec 60352. So this is probably only relevant once
   SRIOV support lands in the driver.
3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
   is added by this change.

The CSB reports to gHWSP and ppHWSP have been discussed as part
of a different topic on some internal threads and we've confirmed
that neither the KMD nor the GuC firmware use those for anything,
so disabling them is always "safe" and should have no functional
or performance impact on system operation.  The same is true for
the timestamp updates in the ppHWSP as well.  Given that, it might
make sense to just combine these two workarounds into a single
record (and single patch) and apply it on all steppings. Disabling
the reports for RCS on higher steppings doesn't have any kind of
negative impact and will simplify the overall situation.

V3(MattR):
  - Combine WA apply same WA for all engines, no performance impact
V2(MattR):
  - Mention detail in commit message
  - Reorder bit define
  - Improve bit naming
  - Remove workaround part which isnt relevant

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_wa.c               | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 444ff9b83bb1..ecdbc04a2d91 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -40,6 +40,7 @@
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
+
 #define   RING_MAX_NONPRIV_SLOTS  12
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
@@ -47,6 +48,11 @@
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
 
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
+
+#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
+#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
+#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
+
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index ce897f2d49be..23f1285135b8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -596,6 +596,20 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
+	/*
+	 * These two workarounds are the same, just applying to different
+	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
+	 * all steppings, disabling these reports has no impact for our
+	 * driver or the GuC, so we go ahead and treat it the same as
+	 * Wa_16021639441 which does apply to all steppings.
+	 */
+	{ XE_RTP_NAME("18032095049, 16021639441"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 
 	{}
 };
-- 
2.25.1

