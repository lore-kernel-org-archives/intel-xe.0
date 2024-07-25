Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D11C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 07:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E2210E0DD;
	Thu, 25 Jul 2024 07:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3kOAV/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593B210E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721892119; x=1753428119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=63nAyyPxqlCZ70UiJG7L1ymTRTqLE8026UlvnY8n17k=;
 b=H3kOAV/UsCpKn7BriHjziJTSNdOiP0t7LMJGQE4orrNL730urDKCZ7Yv
 qwz2s2P0HhTEq2LzXHxXFdFdZNExgEmtNi+GXv2IubfmUXlWkNAAa4aRo
 X1qCeXv7pnbas2cBVY0SuFJTYZzrbs10Xt+OclZ4F0O9EcDqnvehkrleC
 DC2vEDO7DJ4XJUj/FpIoIlEUCOYCrvo27Ph3mNg5MvO/N9/iEI9V59lRR
 /6e9fb8+Ue0rjycVU4jtShqHM63ye6CAPXNKI/y+TYaOSAzc3YoSfAvrN
 g9V0mbbjvppc5JVLGRuOThYdj5XgH940Mgw+Kjzc2D97MNOJMeTBZ8x1/ g==;
X-CSE-ConnectionGUID: IjW92la2RDajgzN3+dPE4Q==
X-CSE-MsgGUID: gWTpO7qfTduBIzS60vC2SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31000093"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="31000093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 00:21:58 -0700
X-CSE-ConnectionGUID: irW4wh/eSnSc8sO5cRiSHw==
X-CSE-MsgGUID: iXWqZjMjRCawcwemw64BkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="57646037"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 00:21:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe_gt_idle: add debugfs entry for powergating info
Date: Thu, 25 Jul 2024 13:05:07 +0530
Message-Id: <20240725073507.723568-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Coarse Powergating is a power saving technique where Render and Media
can be power-gated independently irrespective of the rest of the GT.

For debug purposes, it is useful to expose the powergating information.

v2: move to debugfs
    add details to commit message
    add per-slice status for media
    define reg bits in descending order (Matt Roper)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 80 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
 4 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8a94a94d2267..fe774d0894fa 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -336,6 +336,14 @@
 #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
 
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
+
+#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
+#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
+#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
+#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
+#define   RENDER_AWAKE_STATUS			REG_BIT(1)
+#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
+
 #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
 #define FORCEWAKE_GSC				XE_REG(0xa618)
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..5ba153aac577 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -15,6 +15,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_vf_debugfs.h"
 #include "xe_gt_topology.h"
@@ -107,6 +108,15 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_gt_idle_print(gt, p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -277,6 +287,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
 	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
+	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..c8dd4b732658 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -145,6 +145,86 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
+/**
+ * xe_gt_idle_print - Xe gt idle print
+ * @gt: GT object
+ * @p: drm_printer.
+ *
+ * This function prints the powergating information
+ */
+int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 pg_enabled, pg_status;
+	u32 vcs_mask, vecs_mask;
+	int err;
+
+	if (xe->info.platform == XE_PVC) {
+		drm_printf(p, "Power Gating Enabled: no\n");
+		return 0;
+	}
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return err;
+
+	pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
+	pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
+		drm_printf(p, "Render Power Gating Enabled: %s\n",
+			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
+
+		drm_printf(p, "Render Power Gate Status: %s\n",
+			   (pg_status & RENDER_AWAKE_STATUS) ? "Up" : "Down");
+	}
+
+	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
+	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
+
+	/* Print media CPG status only if media is present */
+	if (vcs_mask || vecs_mask) {
+		drm_printf(p, "Media Power Gating Enabled: %s\n",
+			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
+
+		/*
+		 * Media Slices
+		 *
+		 * Slice 0: VCS0, VCS1, VECS0
+		 * Slice 1: VCS2, VCS3, VECS1
+		 * Slice 2: VCS4, VCS5, VECS2
+		 * Slice 3: VCS6, VCS7, VECS3
+		 */
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0)
+					    | BIT(XE_HW_ENGINE_VCS1)
+					    | BIT(XE_HW_ENGINE_VECS0)))
+			drm_printf(p, "Media Slice0 Power Gate Status: %s\n",
+				   (pg_status & MEDIA_SLICE0_AWAKE_STATUS) ? "Up" : "Down");
+
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS2)
+					    | BIT(XE_HW_ENGINE_VCS3)
+					    | BIT(XE_HW_ENGINE_VECS1)))
+			drm_printf(p, "Media Slice1 Power Gate Status: %s\n",
+				   (pg_status & MEDIA_SLICE1_AWAKE_STATUS) ? "Up" : "Down");
+
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS4)
+					    | BIT(XE_HW_ENGINE_VCS5)
+					    | BIT(XE_HW_ENGINE_VECS2)))
+			drm_printf(p, "Media Slice2 Power Gate Status: %s\n",
+				   (pg_status & MEDIA_SLICE2_AWAKE_STATUS) ? "Up" : "Down");
+
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS6)
+					    | BIT(XE_HW_ENGINE_VCS7)
+					    | BIT(XE_HW_ENGINE_VECS3)))
+			drm_printf(p, "Media Slice3 Power Gate Status: %s\n",
+				   (pg_status & MEDIA_SLICE3_AWAKE_STATUS) ? "Up" : "Down");
+	}
+
+	return 0;
+}
+
 static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr, char *buff)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 554447b5d46d..4b8192d3aee0 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -8,6 +8,7 @@
 
 #include "xe_gt_idle_types.h"
 
+struct drm_printer;
 struct xe_gt;
 
 int xe_gt_idle_init(struct xe_gt_idle *gtidle);
@@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
 void xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
+int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p);
 
 #endif /* _XE_GT_IDLE_H_ */
-- 
2.40.0

