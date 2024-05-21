Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A6C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB6910E156;
	Tue, 21 May 2024 09:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUQ4mTeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF65110E132
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282613; x=1747818613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hnUEA7HCtcUOqwPjXyOTLmfz6hDdNEl+QIKUng9Vnlg=;
 b=LUQ4mTeOH7sDl6qFeIWtcF9wFJima39o7BPiwVymRQqn3DIImIkUzTwU
 1Sx2ofDr7yFxA+V7cWmkVOtp7uy8IWBk0eN82KFLjwLBXXnHSmsWuYeq0
 cs8hmzh8MvG9QBkcyATBf1irjnIDsMj8dGaHyGRRjZnTWl33SZSXyqCOX
 uLOg/ij0Q2OgyHOkhFSK6qX6hUoHaWQtIsN1/oWvL0jAMk6fW35M8jSMj
 QQw5lo4hF0g9mlChbg1aBhDvjPbo9ICkact58cLHGg3eJ3C9EzqrzVJTn
 xohSSQskVJaW9d3pN2SPcdaL5zDsqA0onfJwAeMMNTl0ojNywdn7t7yp3 g==;
X-CSE-ConnectionGUID: 7vsoRRrnTN6QTE+0puG/Jw==
X-CSE-MsgGUID: TVxtG0q4TAOstkZnl6ocCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23130758"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23130758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:10:12 -0700
X-CSE-ConnectionGUID: c16I8TiQTLmbskqzlD0+YA==
X-CSE-MsgGUID: SK76WoIERMKiguysbiX/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="33018252"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:10:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v2 2/2] drm/xe: Enable Coarse Power Gating
Date: Tue, 21 May 2024 14:52:01 +0530
Message-Id: <20240521092201.4183305-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240521092201.4183305-1-riana.tauro@intel.com>
References: <20240521092201.4183305-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 12 +++++---
 drivers/gpu/drm/xe/xe_gt_idle.c      | 43 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++-
 4 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 7c173db7d585..1cb0343ab581 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -317,6 +317,8 @@
 #define FORCEWAKE_GT				XE_REG(0xa188)
 
 #define POWERGATE_ENABLE			XE_REG(0xa210)
+#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
+#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e69a03ddd255..1ed6309270cb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -362,10 +362,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
-	err = xe_gt_idle_sysfs_init(&gt->gtidle);
-	if (err)
-		goto err_force_wake;
-
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
 
@@ -550,6 +546,10 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_idle_init(&gt->gtidle);
+	if (err)
+		return err;
+
 	err = xe_gt_freq_init(gt);
 	if (err)
 		return err;
@@ -733,6 +733,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_gt_idle_disable_pg(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "suspended\n");
 
@@ -759,6 +761,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_gt_idle_enable_pg(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "resumed\n");
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 4384f7e80258..a056e00b4ab9 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 
@@ -93,6 +94,36 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 	return cur_residency;
 }
 
+void xe_gt_idle_enable_pg(struct xe_gt *gt)
+{
+	int i, j;
+	u32 pg_enable;
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
@@ -145,15 +176,18 @@ static const struct attribute *gt_idle_attrs[] = {
 	NULL,
 };
 
-static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
+static void gt_idle_fini(struct drm_device *drm, void *arg)
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
@@ -182,7 +216,9 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return err;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	xe_gt_idle_enable_pg(gt);
+
+	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
@@ -202,7 +238,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
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

