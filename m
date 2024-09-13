Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A14FC6161
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 16:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C80310EB26;
	Fri, 13 Sep 2024 16:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTzhG2kK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2A710EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726244956; x=1757780956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=709EdEMSuhDdyuAH1AvDhh2XTa6r/+53ARco/R9IOJE=;
 b=YTzhG2kK2E+0+u92nKfKAdoDZm0mo8jTrpvWTXStKgydqAoi3yCQ5CbV
 QlDMmOKfD7gbaDwVbFI/eUUYgdxMeR3VOSRyAK1oaL1q88o9bfFzTcLfM
 3McYEwMIRrywoQEarZDRljL5RLK12joeOMtvBddsWNAWDXtnTPhWl5dJB
 W8kdG4MT4ZuOoLyAXharSgruNVo1b+29GDv5Pb/MFG8aP2D6yUP3V8up5
 YuWcj8OA2zouakwgl4hadK+AXYi5O7PDK6JPdzgY23grE2UuFIQZmYlK/
 Ic6aPHdvLliqk3iLsAcVLkpQVKCFvSvQ1AT5bwY3Kjs9m+AoUXlhFJh4t A==;
X-CSE-ConnectionGUID: xK84ibShSWuNeDP9b9hExg==
X-CSE-MsgGUID: yHeD+rvzSy2fMQF8koDcqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24692390"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="24692390"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:29:15 -0700
X-CSE-ConnectionGUID: OwP25Au6Q7+tUeT9q4T2Zw==
X-CSE-MsgGUID: J8biUvFESAy7snxkK9uGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68440203"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:29:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout to
 display/
Date: Fri, 13 Sep 2024 09:29:11 -0700
Message-ID: <20240913162910.4145142-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

It's quite unusual to read display registers as part of GT
initialization, but use of the display reference timestamp is one
approach to calculating the GT clock frequency on older platforms.
Rename the function that does this readout and move it to display/ to
make it more clear what's actually happening when this route is taken.
Also add an assert that we've probed display before calling this
function since we never expect this to be the route taken on platforms
that lack display.

In the future we may want to move to an intel_display implementation
that can be shared with i915, but we'll leave that for later.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
 drivers/gpu/drm/xe/xe_gt_clock.c        | 24 ++++++------------------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index a3131a67e5b1..ac6d08a5cc73 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -29,6 +29,7 @@
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 
 /* Xe device functions */
@@ -510,3 +511,20 @@ int xe_display_probe(struct xe_device *xe)
 	unset_display_features(xe);
 	return 0;
 }
+
+u32 xe_display_read_ref_ts_freq(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 ts_override = xe_mmio_read32(mmio, TIMESTAMP_OVERRIDE);
+	u32 base_freq, frac_freq;
+
+	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
+				  ts_override) + 1;
+	base_freq *= 1000000;
+
+	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
+				  ts_override);
+	frac_freq = 1000000 / (frac_freq + 1);
+
+	return base_freq + frac_freq;
+}
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 17afa537aee5..40030cac7fe9 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -43,6 +43,8 @@ void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
 
+u32 xe_display_read_ref_ts_freq(struct xe_device *xe);
+
 #else
 
 static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
@@ -76,5 +78,7 @@ static inline void xe_display_pm_resume(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
 
+static u32 xe_display_read_ref_ts_freq(struct xe_device *xe) { return 0; }
+
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index cc2ae159298e..886c071c10f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -7,6 +7,7 @@
 
 #include "xe_gt_clock.h"
 
+#include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
@@ -15,22 +16,6 @@
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
@@ -57,14 +42,17 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 
 int xe_gt_clock_init(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
 	u32 freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
+	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
 
 	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
-		freq = read_reference_ts_freq(gt);
+		xe_gt_assert(gt, xe->info.probe_display);
+
+		freq = xe_display_read_ref_ts_freq(xe);
 	} else {
 		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 
-- 
2.45.2

