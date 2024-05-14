Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E138C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 06:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE85B10E24D;
	Tue, 14 May 2024 06:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7b/S5bN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A76C10E24D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 06:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715668288; x=1747204288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8f8fPr05E35UpS1z5WW3MJSdFmwS2sqkUTjW4sUXvFo=;
 b=d7b/S5bNNop2phd07i1UAnJgCRrYaVuYuLPeGtezp1VQO8XPMYzIQtUx
 cp3w2ACegM3jbEOk2VCbrVTfDq+BYch8b52XyT26sg5eiihh6aE5Nujwi
 AfaMYQ6Z5x0tTbboUsoAiAMR/UfzCFPc7H3EBTqj2/SUp6Ey+yCqZXv79
 vu1Hn56V7FnElaVpbp4qPNpjJvWFDtZCr0aj8ii1F/xR0qY2Kqosy0FsE
 7U0nPyhOqz2haBEzNqPbWAEIbb+fIVU0YTcRf3sJYyQKLYQ4i5TxBrvDQ
 JiO8kxN/LSb9F4CggF8oSohi84UbfZ8Fk1iCB0MPKFooEtU98/fSCzusx Q==;
X-CSE-ConnectionGUID: mxtlPNfvS/yUeLwT3lPStQ==
X-CSE-MsgGUID: bD2cZykrRVCmv1+NVKGJ9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="23032510"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="23032510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:31:28 -0700
X-CSE-ConnectionGUID: br1R3bz3Ssy6YY7+aEa2CA==
X-CSE-MsgGUID: MkV1ACgpTFmx5osS/n8/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30623740"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:31:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH 2/2] RFC drm/xe: Enable Coarse Power Gating
Date: Tue, 14 May 2024 12:13:09 +0530
Message-Id: <20240514064309.3819722-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240514064309.3819722-1-riana.tauro@intel.com>
References: <20240514064309.3819722-1-riana.tauro@intel.com>
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

Coarse Power Gating (CPG), where Render and Media can enter C6
independent of the remaining GT. Enable render and media
power gating.

Also enable VD HCP/MFX sub-pipe power gating.
HCP/MFX power gating is disabled by default, turn it on for
the vd units available

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 10 +++++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 45 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h      |  2 ++
 4 files changed, 56 insertions(+), 3 deletions(-)

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
index 36c7b1631fa6..8a09630f5f38 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -567,6 +567,10 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_idle_enable_pg(gt);
+	if (err)
+		return err;
+
 	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 }
 
@@ -624,6 +628,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_idle_enable_pg(gt);
+	if (err)
+		return err;
+
 	for_each_hw_engine(hwe, gt, id) {
 		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 		xe_reg_sr_apply_whitelist(hwe);
@@ -720,6 +728,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
+	xe_gt_idle_disable_pg(gt);
+
 	xe_uc_stop_prepare(&gt->uc);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 4384f7e80258..f549bbb0e110 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 
@@ -93,6 +94,42 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 	return cur_residency;
 }
 
+int xe_gt_idle_enable_pg(struct xe_gt *gt)
+{
+	int ret, i;
+	u32 pg_enable;
+
+	xe_device_assert_mem_access(gt_to_xe(gt));
+
+	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
+
+	for (i = XE_HW_ENGINE_VCS0; i <= XE_HW_ENGINE_VCS7; i++) {
+		if ((gt->info.engine_mask & BIT(i)))
+			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(i) |
+				      VDN_MFXVDENC_POWERGATE_ENABLE(i));
+	}
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return ret;
+
+	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	return 0;
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
@@ -145,9 +182,12 @@ static const struct attribute *gt_idle_attrs[] = {
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
@@ -182,7 +222,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return err;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
@@ -202,7 +242,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 75bd99659b1b..ba7aa36348fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -13,5 +13,7 @@ struct xe_gt;
 int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
 void xe_gt_idle_enable_c6(struct xe_gt *gt);
 void xe_gt_idle_disable_c6(struct xe_gt *gt);
+void xe_gt_idle_disable_pg(struct xe_gt *gt);
+int  xe_gt_idle_enable_pg(struct xe_gt *gt);
 
 #endif /* _XE_GT_IDLE_H_ */
-- 
2.40.0

