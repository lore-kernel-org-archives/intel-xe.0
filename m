Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF91C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC90D10E810;
	Tue, 25 Feb 2025 22:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecEHxml4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6465F10E810
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740523755; x=1772059755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8tlqnZYmrXwfKor3klAKUCM1XiErexXdHESWIEmQPDQ=;
 b=ecEHxml4YrFKBN+gUilBc2xX3/9YKdDwJdQl0QvobHVx0orRgOUUsewB
 rpHgp6nFqjOxgMhdZJ7v7xMeFjIMDW8NgtGMfWwwQJFubM+maSLrkpoI6
 UYtPxoOHbHeg7rKZ73tkivP5rFjJI+kOHppztGD0jjg33TUMdidf0jjWq
 W/Ja22QpCoCsnUFKWPLO8U0ea1Vy/5toibAuOgbfspxleTjb46n1IZh4G
 9ur1yiuyKwO0TnQAa4QKl3DKBiIuMxVuaO9Md6YAsz5EXPiEcjR3n2o5p
 xn3jPfWo2mbFAKNnmng5aNwIjLlccdVcg5xvXs1gYzH7VABx8aAuopxQn w==;
X-CSE-ConnectionGUID: VrgAVVYHSAuTVVhrRvDjyg==
X-CSE-MsgGUID: RUzrvS6ARJSAfXECdaulqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58777425"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="58777425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:49:15 -0800
X-CSE-ConnectionGUID: xpOAl3vNSLmtWp2JyKFCMg==
X-CSE-MsgGUID: KNa/DxQkThSnj25DKjwKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="139760877"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:49:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE
Date: Tue, 25 Feb 2025 14:49:09 -0800
Message-ID: <20250225224908.1671554-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Recent discussions with the hardware architects have revealed that
the TIMESTAMP_OVERRIDE register is never expected to hold a valid/useful
value on production hardware.  That register would only get used by
hardware workarounds (although there are none that use it today) or
during early internal hardware testing.

Due to lack of documentation it's not clear exactly what the driver
should be doing if CTC_MODE[0] is set (or even whether that's a setting
that would ever be encountered on real hardware), but it's definitely
not what Xe and i915 have been doing.  So drop the incorrect code trying
to use TIMESTAMP_REGISTER.  If the driver does encounter CTC_MODE[0] in
the wild, we'll print a warning and just continue trying to use the
crystal clock frequency since that's probably less incorrect than what
we're doing today.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h           |  4 --
 drivers/gpu/drm/xe/xe_gt_clock.c            | 53 ++++++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 --
 3 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 6cf282618836..3abb17d2ca33 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,10 +7,6 @@
 
 #include "regs/xe_reg_defs.h"
 
-#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
-
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
 #define   DRIVERINT_FLR_DIS			REG_BIT(31)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index cc2ae159298e..2a958c92d8ea 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -12,25 +12,10 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 
-static u32 read_reference_ts_freq(struct xe_gt *gt)
-{
-	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
-	u32 base_freq, frac_freq;
-
-	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
-				  ts_override) + 1;
-	base_freq *= 1000000;
-
-	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
-				  ts_override);
-	frac_freq = 1000000 / (frac_freq + 1);
-
-	return base_freq + frac_freq;
-}
-
 static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 {
 	const u32 f19_2_mhz = 19200000;
@@ -57,26 +42,30 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 
 int xe_gt_clock_init(struct xe_gt *gt)
 {
-	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
+	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 	u32 freq = 0;
 
-	/* Assuming gen11+ so assert this assumption is correct */
-	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
+	/*
+	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
+	 * platforms.  In theory it could be a valid setting for pre-Xe2
+	 * platforms, but there's no documentation on how to properly handle
+	 * this case.  Reading TIMESTAMP_OVERRIDE, as the driver attempted in
+	 * the past has been confirmed as incorrect by the hardware architects.
+	 *
+	 * For now just warn if we ever encounter hardware in the wild that
+	 * has this setting and move on as if it hadn't been set.
+	 */
+	if (xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC)
+		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
 
-	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
-		freq = read_reference_ts_freq(gt);
-	} else {
-		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
+	freq = get_crystal_clock_freq(c0);
 
-		freq = get_crystal_clock_freq(c0);
-
-		/*
-		 * Now figure out how the command stream's timestamp
-		 * register increments from this frequency (it might
-		 * increment only every few clock cycle).
-		 */
-		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
-	}
+	/*
+	 * Now figure out how the command stream's timestamp
+	 * register increments from this frequency (it might
+	 * increment only every few clock cycle).
+	 */
+	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
 
 	gt->info.reference_clock = freq;
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 6b5f849a0722..4efde5f46b43 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -114,7 +114,6 @@ static const struct xe_reg tgl_runtime_regs[] = {
 	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
 	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg ats_m_runtime_regs[] = {
@@ -127,7 +126,6 @@ static const struct xe_reg ats_m_runtime_regs[] = {
 	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
 	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg pvc_runtime_regs[] = {
@@ -140,7 +138,6 @@ static const struct xe_reg pvc_runtime_regs[] = {
 	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
 	CTC_MODE,			/* _MMIO(0xA26C) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg ver_1270_runtime_regs[] = {
@@ -155,7 +152,6 @@ static const struct xe_reg ver_1270_runtime_regs[] = {
 	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
 	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg ver_2000_runtime_regs[] = {
@@ -173,7 +169,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
 	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg ver_3000_runtime_regs[] = {
-- 
2.48.1

