Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AEFC88CB2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 08:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89310E362;
	Tue, 13 Jun 2023 08:44:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E14310E357
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 08:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686645869; x=1718181869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnoU+25RJNXBcAlsY7cjqMYUF++qut2gpc/Zgud8qyU=;
 b=jXFFJLXHZulqI9iYKMGjytCKvD02FSWB/4sdOFfMm2Ohw2O6SJWL+ddI
 NoIQItGeJMzXNUSjOQ/97eDpE5S9j5c6iFDkJ/KL0ybJvHw4+GwbN6pF5
 H8YsAhNnPIAym+a5+jKwagbMmdPBz+kxm5m1KZ/1brIASXe4jd9p+Ae2r
 H9yZ/3rFotLOZOLR/pinEZVYaBEuOmbYtItDdxHGEUsDVTmC10HjXunba
 LuHwXCies6xVzZvhr1Cb4MjKbzrqcYOWcCWOsJcV8fuUIsBfMeGja7o0M
 NkjvYa/8bK0AcSF1S6tCSF9blnDOfepaae4nlT/oZcSohHbrM+w4mvMod g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386663345"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="386663345"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958330309"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="958330309"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:44:25 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 14:17:21 +0530
Message-Id: <20230613084721.3698818-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230613084721.3698818-1-riana.tauro@intel.com>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Badal Nilawar <badal.nilawar@intel.com>

Add the registers to get C6 residency of MTL SAMedia and
C6 status of MTL gts

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  2 ++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 16 +++++++---
 drivers/gpu/drm/xe/xe_guc_pc.c        | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h        |  2 ++
 4 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0f920175526e..7c3dd0a81b71 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -341,6 +341,8 @@
 #define   FORCEWAKE_USER			BIT(1)
 #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
 
+#define MTL_MEDIA_MC6				XE_REG(0x138048)
+
 #define GT_CORE_STATUS				XE_REG(0x138060)
 #define   RCN_MASK				REG_GENMASK(2, 0)
 #define   GT_RC0				0
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
index 1b2dcac46479..a75816a610ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
@@ -140,11 +140,19 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	if (!kobj)
 		return -ENOMEM;
 
-	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
-	/* Multiplier for  RC6 Residency counter in units of 1.28us */
+	if (xe->info.platform == XE_METEORLAKE &&
+	    gt->info.type == XE_GT_TYPE_MEDIA) {
+		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
+		gtidle->idle_residency = xe_guc_pc_mc6_residency;
+		gtidle->idle_status = xe_guc_pc_mc_status;
+	} else {
+		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
+		gtidle->idle_residency = xe_guc_pc_rc6_residency;
+		gtidle->idle_status = xe_guc_pc_rc_status;
+	}
+
+	/* Multiplier for Residency counter in units of 1.28us */
 	gtidle->residency_multiplier = 1280;
-	gtidle->idle_residency = xe_guc_pc_rc6_residency;
-	gtidle->idle_status = xe_guc_pc_rc_status;
 
 	err = sysfs_create_files(kobj, gt_idle_attrs);
 	if (err) {
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 72f49808918a..35ca4115dc96 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -36,6 +36,10 @@
 
 #define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
 #define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
+#define   MTL_CC_MASK		REG_GENMASK(12, 9)
+#define   MTL_C0		0
+#define   MTL_C6		3
+
 
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GEN9_FREQ_SCALER	3
@@ -598,6 +602,29 @@ enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
 	}
 }
 
+/**
+ * xe_guc_pc_mc_status - get the current Media C state
+ * @pc: XE_GuC_PC instance
+ */
+enum xe_gt_idle_state xe_guc_pc_mc_status(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	switch (REG_FIELD_GET(MTL_CC_MASK, reg)) {
+	case MTL_C6:
+		return GT_IDLE_C6;
+	case MTL_C0:
+		return GT_IDLE_C0;
+	default:
+		return GT_IDLE_UNKNOWN;
+	}
+}
+
 /**
  * xe_guc_pc_rc6_residency - rc6 residency counter
  * @pc: Xe_GuC_PC instance
@@ -615,6 +642,23 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
 	return reg;
 }
 
+/**
+ * xe_guc_pc_mc6_residency - mc6 residency counter
+ * @pc: Xe_GuC_PC instance
+ */
+u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u64 reg;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+
+	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
+
+	xe_device_mem_access_put(gt_to_xe(gt));
+	return reg;
+}
+
 static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_act.attr,
 	&dev_attr_freq_cur.attr,
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 976179dbc9a8..0d13c19b7b78 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -13,5 +13,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 
 enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
+enum xe_gt_idle_state xe_guc_pc_mc_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
+u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 #endif /* _XE_GUC_PC_H_ */
-- 
2.40.0

