Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691E3C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 09:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211F710E8D0;
	Thu,  1 Aug 2024 09:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSGH4Pnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EDF10E8CC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722505193; x=1754041193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SFDSWZYvot9J6VteJs4jFm8/maItf8ncYjCiCe33TwM=;
 b=QSGH4PnbfGuP7a7wXPyBohureixs0WMsDEiMBKbfsBnY8J5uBs/Bz0NC
 WmZRUoU+c+vBwBqklYwoVINmi0lKcuXOtJfkyzKSoV7fv3BbcIAKEOGPC
 FSouO2RaVNsWcS7GzHPpyps48AOyV4ysrfV1HoC8KDNF1d1FyIPNFJNa5
 lp+TzNG6YX0OYAc2fLVFQCLpcgyhGS45LQXETsuHopJLxacZ/wFVb6jbJ
 hM/3jejNXkBZ0KlvBjGGrIFjmGV+9e9VKiVskpf5JQQCR3UrFeaXotanU
 XJuLiQUD9hQKUrsyIsyThzaeohZ8kESRNn+CN1T0qiU47hMyW+0I8ZfpS w==;
X-CSE-ConnectionGUID: jQ1jwFurTzy45TiSOw3P/Q==
X-CSE-MsgGUID: xpsVpdxSRNW9N9RSwO9Fgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="45859385"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="45859385"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:39:53 -0700
X-CSE-ConnectionGUID: dvqfsqR4T1mQUfP0oAv5Qg==
X-CSE-MsgGUID: n9P78ehiTCK00bwaVbqhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55221577"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:39:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, matthew.d.roper@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v3 2/2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
Date: Thu,  1 Aug 2024 15:23:05 +0530
Message-Id: <20240801095305.1209046-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240801095305.1209046-1-riana.tauro@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
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

v3: fix return statement
    fix kernel-doc
    use loop for media slices
    use helper function for status (Michal)

v4: add pg prefix
    do not wake GT if in C6 (Badal)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
 4 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3b87f95f9ecf..279d862c306a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -337,6 +337,14 @@
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
index 5e7fd937917a..47e3a1ca2394 100644
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
@@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
+{
+	int ret;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	ret = xe_gt_idle_pg_print(gt, p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return ret;
+}
+
 static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
 	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
+	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 7188542aea43..2ab0eaafa7d7 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
 	return gt_to_xe(gt);
 }
 
+static inline const char *str_up_down(bool v)
+{
+	return v ? "up" : "down";
+}
+
 static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
 {
 	switch (state) {
@@ -147,6 +152,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
+/**
+ * xe_gt_idle_pg_print - Xe powergating info
+ * @gt: GT object
+ * @p: drm_printer.
+ *
+ * This function prints the powergating information
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+	struct xe_device *xe = gt_to_xe(gt);
+	enum xe_gt_idle_state state;
+	u32 pg_enabled, pg_status = 0;
+	u32 vcs_mask, vecs_mask;
+	int err, n;
+	/*
+	 * Media Slices
+	 *
+	 * Slice 0: VCS0, VCS1, VECS0
+	 * Slice 1: VCS2, VCS3, VECS1
+	 * Slice 2: VCS4, VCS5, VECS2
+	 * Slice 3: VCS6, VCS7, VECS3
+	 */
+	static const struct {
+		u64 engines;
+		u32 status_bit;
+	} media_slices[] = {
+		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
+		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
+
+		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
+		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
+
+		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
+		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
+
+		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
+		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
+	};
+
+	if (xe->info.platform == XE_PVC) {
+		drm_printf(p, "Power Gating not supported\n");
+		return 0;
+	}
+
+	state = gtidle->idle_status(gtidle_to_pc(gtidle));
+	pg_enabled = gtidle->powergate_enable;
+
+	/* Do not wake the GT to read powergating status */
+	if (state != GT_IDLE_C6) {
+		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (err)
+			return err;
+
+		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
+		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
+
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	}
+
+	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
+		drm_printf(p, "Render Power Gating Enabled: %s\n",
+			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
+
+		drm_printf(p, "Render Power Gate Status: %s\n",
+			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
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
+		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
+			if (gt->info.engine_mask & media_slices[n].engines)
+				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
+					   str_up_down(pg_status & media_slices[n].status_bit));
+	}
+	return 0;
+}
+
 static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr, char *buff)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 554447b5d46d..4455a6501cb0 100644
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
+int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
 
 #endif /* _XE_GT_IDLE_H_ */
-- 
2.40.0

