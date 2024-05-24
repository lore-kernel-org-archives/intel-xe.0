Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1E8C25B79
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 06:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2310E3ED;
	Fri, 24 May 2024 06:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYNtYdw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135110E3D8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716533842; x=1748069842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vJygBsO+T7vV3Pa2n8vcSc0luY2G9Wyg7mg9VnH5+JU=;
 b=VYNtYdw3nOO1PEQ2tzBKC/3tvaYpA4C1xsIuKsJuphCm+ZOtPJaeERn3
 u/1znxgku5ofwDHaP847gozRv9vFaxf4tKuy7wZcj/zgGAdsEzX92Hi5d
 MLeEEyHPO8oD1TjDCtIEqYC4PCbX3Lbo7uS3B4oOJaa1jZPFc65dJNtqu
 49nxmJaZdu8sLj77Hcz6P8BjS+wI9XlKNsabWz3+TitgDN8QYp8B8ifut
 HJfdTa2qiFNHIo+dN2f/klWnnq8roJJ2TRoWjiDD7sGE/pDEdenPJ/LFW
 EyeOrOc4dKeoO87ef2c/aVEyNc//Mh/AVfsFYxXs1dd/7V+FN4LvPc5s5 g==;
X-CSE-ConnectionGUID: GiuBFZO1TempbTzij4p8eg==
X-CSE-MsgGUID: K2Kp+U5XTHq2/Z4xzZooeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13014119"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13014119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:22 -0700
X-CSE-ConnectionGUID: DyBU/YKCSH+9UxVAgFf8Cw==
X-CSE-MsgGUID: Be7xEyfVR5CB632UCrQf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="65142149"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:19 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v4 2/2] drm/xe: Enable Coarse Power Gating
Date: Fri, 24 May 2024 12:39:16 +0530
Message-Id: <20240524070916.143022-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240524070916.143022-1-riana.tauro@intel.com>
References: <20240524070916.143022-1-riana.tauro@intel.com>
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

Enable power gating for all units and sub-pipes that
are disabled by default.

v2: change the init function name
    use symmetric calls for enable/disable pg
    re-pharase commit message (Rodrigo)
    modify the sub-pipe power gating condition

v3: set hysteresis value for render and media
    when GuC PC is disabled
    skip CPG for PVC (Vinay)

v4: rebase

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v2
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gt.c           | 12 ++++--
 drivers/gpu/drm/xe/xe_gt_idle.c      | 57 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h      |  4 +-
 4 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 7c173db7d585..d09b2473259f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -309,6 +309,8 @@
 #define   RC_CTL_RC6_ENABLE			REG_BIT(18)
 #define RC_STATE				XE_REG(0xa094)
 #define RC_IDLE_HYSTERSIS			XE_REG(0xa0ac)
+#define MEDIA_POWERGATE_IDLE_HYSTERESIS		XE_REG(0xa0c4)
+#define RENDER_POWERGATE_IDLE_HYSTERESIS	XE_REG(0xa0c8)
 
 #define PMINTRMSK				XE_REG(0xa168)
 #define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
@@ -317,6 +319,8 @@
 #define FORCEWAKE_GT				XE_REG(0xa188)
 
 #define POWERGATE_ENABLE			XE_REG(0xa210)
+#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
+#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6f4b59a6e710..34c1896807e9 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -366,10 +366,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
-	err = xe_gt_idle_sysfs_init(&gt->gtidle);
-	if (err)
-		goto err_force_wake;
-
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
 
@@ -554,6 +550,10 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_idle_init(&gt->gtidle);
+	if (err)
+		return err;
+
 	err = xe_gt_freq_init(gt);
 	if (err)
 		return err;
@@ -760,6 +760,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_gt_idle_disable_pg(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "suspended\n");
 
@@ -786,6 +788,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_gt_idle_enable_pg(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "resumed\n");
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 6790b5674965..0109d1d2e9c4 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 
@@ -93,6 +94,50 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 	return cur_residency;
 }
 
+void xe_gt_idle_enable_pg(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 pg_enable;
+	int i, j;
+
+	/* Disable CPG for PVC */
+	if (xe->info.platform == XE_PVC)
+		return;
+
+	xe_device_assert_mem_access(gt_to_xe(gt));
+
+	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
+
+	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
+		if ((gt->info.engine_mask & BIT(i)))
+			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
+				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
+	}
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	if (xe->info.skip_guc_pc) {
+		/*
+		 * GuC sets the hysteresis value when GuC PC is enabled
+		 * else set it to 25 (25 * 1.28us)
+		 */
+		xe_mmio_write32(gt, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
+	}
+
+	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+}
+
+void xe_gt_idle_disable_pg(struct xe_gt *gt)
+{
+	xe_device_assert_mem_access(gt_to_xe(gt));
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+
+	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+}
+
 static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr, char *buff)
 {
@@ -145,15 +190,18 @@ static const struct attribute *gt_idle_attrs[] = {
 	NULL,
 };
 
-static void gt_idle_sysfs_fini(void *arg)
+static void gt_idle_fini(void *arg)
 {
 	struct kobject *kobj = arg;
+	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+
+	xe_gt_idle_disable_pg(gt);
 
 	sysfs_remove_files(kobj, gt_idle_attrs);
 	kobject_put(kobj);
 }
 
-int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
+int xe_gt_idle_init(struct xe_gt_idle *gtidle)
 {
 	struct xe_gt *gt = gtidle_to_gt(gtidle);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -182,7 +230,9 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return err;
 	}
 
-	return devm_add_action_or_reset(xe->drm.dev, gt_idle_sysfs_fini, kobj);
+	xe_gt_idle_enable_pg(gt);
+
+	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
@@ -202,7 +252,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 75bd99659b1b..554447b5d46d 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -10,8 +10,10 @@
 
 struct xe_gt;
 
-int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
+int xe_gt_idle_init(struct xe_gt_idle *gtidle);
 void xe_gt_idle_enable_c6(struct xe_gt *gt);
 void xe_gt_idle_disable_c6(struct xe_gt *gt);
+void xe_gt_idle_enable_pg(struct xe_gt *gt);
+void xe_gt_idle_disable_pg(struct xe_gt *gt);
 
 #endif /* _XE_GT_IDLE_H_ */
-- 
2.40.0

