Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41D7C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 09:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BA410E312;
	Mon, 15 Jul 2024 09:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWXhYfm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F9D10E312
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721036517; x=1752572517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1VwTJy52dRh5Q9odF6qpe1fyXiGVCAZ2NzJqjYHrdOI=;
 b=jWXhYfm2mGtOA4PmhQJ4SmrhE+C5yDcd5CWWJHq5flyPr8WiKs3iAKUV
 dXSiFP/71IuEyANKVY+uq43FYiGTx9A6Lf4G+DrIiPgmp+e37HplTRD7V
 J/HhRqnIlHzlXdAtNiyntptCeYBbwbvYhxXV9luhvkhhPpsi2cLzRr0s7
 KTNHcuOTrGeMyAcYHKJi6zPomDDnf8j+IZDj9OW3u3O0i2WOAKZKRvdwW
 hkDQD8DaORgVlr33s43MAODVeZn1q9+feFfIUvGimcTh1+h6Crse26d49
 XPbAMD3P/Yj4PGlG1TKgqFbkDraXmVnF/Iosj6J+xdwzBZk0SODJWawTT g==;
X-CSE-ConnectionGUID: StDiPwDCS/2KAyjT+LmwKg==
X-CSE-MsgGUID: rUvqLFeuR02MUuEvjdWMhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29798911"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29798911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 02:41:57 -0700
X-CSE-ConnectionGUID: c9FGbsp9TEykZ4rNu1O98w==
X-CSE-MsgGUID: hBiPCn1lR/yu69IRxV1Ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49528906"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 02:41:55 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH] RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs
 entries
Date: Mon, 15 Jul 2024 15:24:55 +0530
Message-Id: <20240715095455.4069296-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add coarse power gating sysfs interface under gtidle directory to
display the powergate properties.

powergate sysfs directory will be enumerated for render and media
if present.

The new entries will have the below layout

	tile<n>/gt<n>/gtidle/
			├── powergate0
			│   ├── enabled
			│   ├── status
			│   └── type
			└── powergate<n>
			    ├── enabled
			    ├── status
		    	    └── type

type:    type of powergate [Render or Media]
enabled: true if powergate is enabled for the type
status:  Indicates status of powergate [Up/Down]
	 For type media, status is "Up" if any of the media
	 slices are powered on.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   7 +
 drivers/gpu/drm/xe/xe_gt_idle.c       | 214 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_idle_types.h |  17 ++
 3 files changed, 237 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8a94a94d2267..8586c830bea6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -335,6 +335,13 @@
 #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
 #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
 
+#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
+#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
+#define   RENDER_AWAKE_STATUS			REG_BIT(1)
+#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
+#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
+#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
+
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..fca13e645d24 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -25,13 +25,26 @@
  * device/gt#/gtidle/name - name of the state
  * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
  * device/gt#/gtidle/idle_status - Provides current idle state
+ * device/gt#/gtidle/powergate<n>/
+ *                              ├── enabled - indicates whether powergate is enabled
+ *                              ├── status - status of powergate [Up / Down]
+ *                              └── type - type of powergate
  */
+static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
+{
+	return &kobj_to_gt(kobj->parent)->gtidle;
+}
 
 static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
 {
 	struct kobject *kobj = &dev->kobj;
 
-	return &kobj_to_gt(kobj->parent)->gtidle;
+	return kobj_to_gtidle(kobj);
+}
+
+static struct xe_gt_powergate *kobj_to_powergate(struct kobject *kobj)
+{
+	return container_of(kobj, struct xe_gt_powergate, kobj);
 }
 
 static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
@@ -129,6 +142,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
@@ -145,6 +159,70 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
+static void gt_idle_powergate_enabled(struct xe_gt_idle *gtidle,
+				      struct xe_gt_powergate *pg)
+{
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
+	u32 enabled;
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	if (pg->is_media)
+		enabled &= MEDIA_POWERGATE_ENABLE;
+	else
+		enabled &= RENDER_POWERGATE_ENABLE;
+
+	pg->enabled = !!enabled;
+}
+
+static void gt_idle_powergate_status(struct xe_gt_idle *gtidle,
+				     struct xe_gt_powergate *pg)
+{
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
+	u32 status, reg;
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	reg = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	if (pg->is_media) {
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
+			status = (reg & MEDIA_SLICE0_AWAKE_STATUS);
+
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS2)
+					    | BIT(XE_HW_ENGINE_VCS3)
+					    | BIT(XE_HW_ENGINE_VECS1)))
+			status |= (reg & MEDIA_SLICE1_AWAKE_STATUS);
+
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS4)
+					    | BIT(XE_HW_ENGINE_VCS5)
+					    | BIT(XE_HW_ENGINE_VECS2)))
+			status |= (reg & MEDIA_SLICE2_AWAKE_STATUS);
+
+		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS6)
+					    | BIT(XE_HW_ENGINE_VCS7)
+					    | BIT(XE_HW_ENGINE_VECS3)))
+			status |= (reg & MEDIA_SLICE3_AWAKE_STATUS);
+
+	} else {
+		status = reg & RENDER_AWAKE_STATUS;
+	}
+
+	pg->status = !!status;
+}
+
 static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr, char *buff)
 {
@@ -197,10 +275,130 @@ static const struct attribute *gt_idle_attrs[] = {
 	NULL,
 };
 
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
+	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	gt_idle_powergate_status(gtidle, pg);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return sysfs_emit(buff, "%s\n", pg->status ? "Up" : "Down");
+}
+static DEVICE_ATTR_RO(status);
+
+static ssize_t enabled_show(struct device *dev,
+			    struct device_attribute *attr, char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
+	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	gt_idle_powergate_enabled(gtidle, pg);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return sysfs_emit(buff, "%u\n", pg->enabled);
+}
+static DEVICE_ATTR_RO(enabled);
+
+static ssize_t type_show(struct device *dev,
+			 struct device_attribute *attr, char *buff)
+{
+	struct xe_gt_powergate *pg = kobj_to_powergate(&dev->kobj);
+
+	return sysfs_emit(buff, "%s\n", pg->is_media ? "Media" : "Render");
+}
+
+static DEVICE_ATTR_RO(type);
+
+static const struct attribute *powergate_attrs[] = {
+	&dev_attr_type.attr,
+	&dev_attr_enabled.attr,
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static void powergate_sysfs_release(struct kobject *kobj) {};
+
+static const struct kobj_type powergate_sysfs_kobj_type = {
+	.release = powergate_sysfs_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static int register_powergate_sysfs(struct kobject *gtidle_kobj, int idx,
+				    bool is_media)
+{
+	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+	struct xe_gt_powergate *pg = &gtidle->powergate[idx];
+	int ret;
+
+	kobject_init(&pg->kobj, &powergate_sysfs_kobj_type);
+
+	ret = kobject_add(&pg->kobj, gtidle_kobj, "powergate%d", idx);
+
+	if (ret) {
+		kobject_put(&pg->kobj);
+		drm_warn(&xe->drm, "Failed to create powergate%d sysfs directory\n", idx);
+		return ret;
+	}
+
+	ret = sysfs_create_files(&pg->kobj, powergate_attrs);
+	if (ret) {
+		drm_warn(&xe->drm, "Failed to create powergate%d attrs\n", idx);
+		kobject_put(&pg->kobj);
+		return ret;
+	}
+
+	pg->is_media = is_media;
+
+	return ret;
+}
+
+static int gt_idle_create_pg_attrs(struct kobject *gtidle_kobj)
+{
+	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
+	struct xe_device *xe  = gt_to_xe(gt);
+	int ret, idx = 0;
+
+	/* CPG is disabled for PVC */
+	if (xe->info.platform == XE_PVC)
+		return 0;
+
+	if (!xe_gt_is_media_type(gt)) {
+		ret = register_powergate_sysfs(gtidle_kobj, idx, false);
+		if (!ret)
+			idx++;
+	}
+
+	/*
+	 * Do not create media pg status if the entire first media slice
+	 * is absent (i.e., no VCS0 or VECS0).
+	 */
+	if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))) {
+		ret = register_powergate_sysfs(gtidle_kobj, idx, true);
+		if (!ret)
+			idx++;
+	}
+
+	return 0;
+}
+
 static void gt_idle_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+	struct xe_device *xe  = gt_to_xe(gt);
+	struct xe_gt_powergate *pg;
+	int n;
 
 	xe_gt_idle_disable_pg(gt);
 
@@ -210,6 +408,18 @@ static void gt_idle_fini(void *arg)
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	}
 
+	for (n = 0 ; n < 2; n++) {
+		if (xe->info.platform == XE_PVC)
+			break;
+
+		pg = &gtidle->powergate[n];
+
+		if (pg->kobj.state_initialized) {
+			sysfs_remove_files(&pg->kobj, powergate_attrs);
+			kobject_put(&pg->kobj);
+		}
+	}
+
 	sysfs_remove_files(kobj, gt_idle_attrs);
 	kobject_put(kobj);
 }
@@ -248,6 +458,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
 
 	xe_gt_idle_enable_pg(gt);
 
+	gt_idle_create_pg_attrs(kobj);
+
 	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
index f99b447534f3..603f7f6b509d 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_IDLE_SYSFS_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/kobject.h>
 
 struct xe_guc_pc;
 
@@ -17,6 +18,20 @@ enum xe_gt_idle_state {
 	GT_IDLE_UNKNOWN,
 };
 
+/**
+ * struct xe_gt_powergate - Powergate properties
+ */
+struct xe_gt_powergate {
+	/** @enabled: powergate enable */
+	bool enabled;
+	/** @status: status of powerwell*/
+	bool status;
+	/** @is_media: indicates media powergate */
+	bool is_media;
+	/** @kobj: kobject for powergate sysfs */
+	struct kobject kobj;
+};
+
 /**
  * struct xe_gt_idle - A struct that contains idle properties based of gt
  */
@@ -29,6 +44,8 @@ struct xe_gt_idle {
 	u64 cur_residency;
 	/** @prev_residency: previous residency counter */
 	u64 prev_residency;
+	/** @powergate: powergate properties */
+	struct xe_gt_powergate powergate[2];
 	/** @idle_status: get the current idle state */
 	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
 	/** @idle_residency: get idle residency counter */
-- 
2.40.0

