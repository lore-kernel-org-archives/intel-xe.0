Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3681EEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 05:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F91010E5D3;
	Fri, 23 Jun 2023 05:21:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D9710E5D3
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687497704; x=1719033704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BIkOxy2AhYthizua9mKJQbRixZ7DcwNiDB9JwnG6/+g=;
 b=Uiqb1sUMuz623nMYWRrXrJogPhDaMinMhX1aELTGXM0RSGc8baZEgSd6
 8gDGpd749NfLXXXH4o6EzAintVfOYBaGZfB31fQSlKkAmjlK0fyWpgkex
 RaixyrD/lqAJ07c1XAzj8cb2s0BIgvXWPyKVGxlWhV0i8JmbjZ66u2kI+
 VDVQ0rSQal2uObRqB10GpnIHiRL+IoYMo9ySJbva6jxJxVYfjNuH3DNs0
 uYetV5PM2+Tvchm5R+DKuslXBtxE2iZ3Hz/Jh0diLj66BElZe22XsFqeY
 fCjb1DRPoEYM/zxz4rsyrCiLGx/jUdKLPhz3yVwM00AKeA4XJRRrk7AD2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359555532"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="359555532"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="692545743"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="692545743"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:21:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jun 2023 10:54:31 +0530
Message-Id: <20230623052431.75578-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230623052431.75578-1-riana.tauro@intel.com>
References: <20230623052431.75578-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/2] drm/xe/mtl: Add support to get C6
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
Cc: joonas.lahtinen@linux.intel.com, vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Badal Nilawar <badal.nilawar@intel.com>

Add the registers to get C6 residency of MTL SAMedia and
C6 status of MTL gts

v2:
   - move register definitions to regs header (Anshuman)
   - correct reg definition for mtl rc status
   - make idle_status function common (Badal)

v3:
   - remove extra line in commit message
   - use only media type check in initialization
   - use graphics ver check (Anshuman)

v4:
   - remove extra lines (Anshuman)

Bspec: 66300
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 11 +++++--
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 14 ++++++---
 drivers/gpu/drm/xe/xe_guc_pc.c        | 41 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_pc.h        |  3 +-
 4 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3f664011eaea..d654f3311351 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -16,6 +16,11 @@
 #define MEDIA_GT_GSI_OFFSET				0x380000
 #define MEDIA_GT_GSI_LENGTH				0x40000
 
+/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
+#define MTL_MIRROR_TARGET_WP1				XE_REG(0xc60)
+#define   MTL_CAGF_MASK					REG_GENMASK(8, 0)
+#define   MTL_CC_MASK					REG_GENMASK(12, 9)
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0					XE_REG(0xd00)
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
@@ -349,10 +354,12 @@
 #define   FORCEWAKE_USER			BIT(1)
 #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
 
+#define MTL_MEDIA_MC6				XE_REG(0x138048)
+
 #define GT_CORE_STATUS				XE_REG(0x138060)
 #define   RCN_MASK				REG_GENMASK(2, 0)
-#define   GT_RC0				0
-#define   GT_RC6				3
+#define   GT_C0					0
+#define   GT_C6					3
 
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
index ec77349dea76..7238e96a116c 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
@@ -142,11 +142,17 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return;
 	}
 
-	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
-	/* Multiplier for  RC6 Residency counter in units of 1.28us */
+	if (xe_gt_is_media_type(gt)) {
+		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
+		gtidle->idle_residency = xe_guc_pc_mc6_residency;
+	} else {
+		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
+		gtidle->idle_residency = xe_guc_pc_rc6_residency;
+	}
+
+	/* Multiplier for Residency counter in units of 1.28us */
 	gtidle->residency_multiplier = 1280;
-	gtidle->idle_residency = xe_guc_pc_rc6_residency;
-	gtidle->idle_status = xe_guc_pc_rc_status;
+	gtidle->idle_status = xe_guc_pc_c_status;
 
 	err = sysfs_create_files(kobj, gt_idle_attrs);
 	if (err) {
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f02bf1641380..3093cfeff0c2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -34,9 +34,6 @@
 #define GT_PERF_STATUS		XE_REG(0x1381b4)
 #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
 
-#define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
-#define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
-
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GEN9_FREQ_SCALER	3
 
@@ -568,22 +565,30 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(freq_max);
 
 /**
- * xe_guc_pc_rc_status - get the current Render C state
+ * xe_guc_pc_c_status - get the current GT C state
  * @pc: XE_GuC_PC instance
  */
-enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
+enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	u32 reg;
+	u32 reg, gt_c_state;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
-	reg = xe_mmio_read32(gt, GT_CORE_STATUS);
+
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
+		reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
+		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
+	} else {
+		reg = xe_mmio_read32(gt, GT_CORE_STATUS);
+		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
+	}
+
 	xe_device_mem_access_put(gt_to_xe(gt));
 
-	switch (REG_FIELD_GET(RCN_MASK, reg)) {
-	case GT_RC6:
+	switch (gt_c_state) {
+	case GT_C6:
 		return GT_IDLE_C6;
-	case GT_RC0:
+	case GT_C0:
 		return GT_IDLE_C0;
 	default:
 		return GT_IDLE_UNKNOWN;
@@ -606,6 +611,22 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
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
+	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	return reg;
+}
+
 static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_act.attr,
 	&dev_attr_freq_cur.attr,
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 976179dbc9a8..370353a40a17 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -12,6 +12,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 
-enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
+enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
+u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 #endif /* _XE_GUC_PC_H_ */
-- 
2.40.0

