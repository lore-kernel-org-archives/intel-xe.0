Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA7AEE57C0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A8610E86D;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF5B10E861
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBxJqiObYpDOub+jeUgsBUCphJvO+HiwJDyOW4xPvM8=;
 b=ki7I4vb+h2X1qsXR2gCWxWY4kItpUBgb30AxG5goJI5H7R9nqeboy3lH
 QxYToXwpqDjwLbmGk6X4fqI0irLpUwhStqxRDN13w2Syvl5xktNkaEYBB
 BW9c4hYYN1rGWwJRtRlF7DAKly5ZrZdVmesw4e0YlVy2mIG8+/trZwZop
 K5JnWPDUKo9qJE0x3vFIrjgpk1lW+ugQGZ41xpJ3AfE4mErmSdsqnyZNx
 W7SLaMIzD2mGTWCPSoYuZ+Xgh19Qc3nzycthpu8VqR99xYMph8uh8HxIY
 wmvkKN8lqjbZEWb4+eQsjTfTzrbHzYuwl3L+xdicU5P7LG6yoDeBz1Ss9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935391"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200722"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200722"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:36 -0700
Message-ID: <20230908042348.1592535-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/17] drm/xe/oa: Add/remove config ioctl's
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

OA configurations consist of a set of event and counter select registers.
The add_config ioctl validates and stores such configurations and also
exposes them in the metrics sysfs. These configurations will be programmed
to OA unit HW when an OA stream using a configuration is opened. The OA
stream can also switch to other stored configurations.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   4 +
 drivers/gpu/drm/xe/xe_oa.c     | 379 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_oa.h     |   5 +
 3 files changed, 387 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 727bd354079d6..220e09512fdf7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -114,6 +114,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
+
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d44ef611c76eb..00b40b9e645ef 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -12,8 +12,8 @@
 #include <drm/drm_drv.h>
 
 #include "regs/xe_oa_regs.h"
-#include "xe_gt.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_oa.h"
 
 static u32 xe_oa_stream_paranoid = true;
@@ -33,6 +33,376 @@ static const struct xe_oa_format oa_formats[] = {
 
 static struct ctl_table_header *sysctl_header;
 
+static void xe_oa_config_release(struct kref *ref)
+{
+	struct xe_oa_config *oa_config =
+		container_of(ref, typeof(*oa_config), ref);
+
+	kfree(oa_config->flex_regs);
+	kfree(oa_config->b_counter_regs);
+	kfree(oa_config->mux_regs);
+
+	kfree_rcu(oa_config, rcu);
+}
+
+static void xe_oa_config_put(struct xe_oa_config *oa_config)
+{
+	if (!oa_config)
+		return;
+
+	kref_put(&oa_config->ref, xe_oa_config_release);
+}
+
+static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
+{
+	static const struct xe_reg flex_eu_regs[] = {
+		EU_PERF_CNTL0,
+		EU_PERF_CNTL1,
+		EU_PERF_CNTL2,
+		EU_PERF_CNTL3,
+		EU_PERF_CNTL4,
+		EU_PERF_CNTL5,
+		EU_PERF_CNTL6,
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(flex_eu_regs); i++) {
+		if (flex_eu_regs[i].addr == addr)
+			return true;
+	}
+	return false;
+}
+
+static bool xe_oa_reg_in_range_table(u32 addr, const struct xe_mmio_range *table)
+{
+	while (table->start || table->end) {
+		if (addr >= table->start && addr <= table->end)
+			return true;
+
+		table++;
+	}
+
+	return false;
+}
+
+static const struct xe_mmio_range xehp_oa_b_counters[] = {
+	{ .start = 0xdc48, .end = 0xdc48 },	/* OAA_ENABLE_REG */
+	{ .start = 0xdd00, .end = 0xdd48 },	/* OAG_LCE0_0 - OAA_LENABLE_REG */
+	{}
+};
+
+static const struct xe_mmio_range gen12_oa_b_counters[] = {
+	{ .start = 0x2b2c, .end = 0x2b2c },	/* GEN12_OAG_OA_PESS */
+	{ .start = 0xd900, .end = 0xd91c },	/* GEN12_OAG_OASTARTTRIG[1-8] */
+	{ .start = 0xd920, .end = 0xd93c },	/* GEN12_OAG_OAREPORTTRIG1[1-8] */
+	{ .start = 0xd940, .end = 0xd97c },	/* GEN12_OAG_CEC[0-7][0-1] */
+	{ .start = 0xdc00, .end = 0xdc3c },	/* GEN12_OAG_SCEC[0-7][0-1] */
+	{ .start = 0xdc40, .end = 0xdc40 },	/* GEN12_OAG_SPCTR_CNF */
+	{ .start = 0xdc44, .end = 0xdc44 },	/* GEN12_OAA_DBG_REG */
+	{}
+};
+
+static const struct xe_mmio_range mtl_oam_b_counters[] = {
+	{ .start = 0x393000, .end = 0x39301c },	/* GEN12_OAM_STARTTRIG1[1-8] */
+	{ .start = 0x393020, .end = 0x39303c },	/* GEN12_OAM_REPORTTRIG1[1-8] */
+	{ .start = 0x393040, .end = 0x39307c },	/* GEN12_OAM_CEC[0-7][0-1] */
+	{ .start = 0x393200, .end = 0x39323C },	/* MPES[0-7] */
+	{}
+};
+
+static bool xe_oa_is_valid_b_counter_addr(struct xe_oa *oa, u32 addr)
+{
+	return xe_oa_reg_in_range_table(addr, xehp_oa_b_counters) ||
+		xe_oa_reg_in_range_table(addr, gen12_oa_b_counters) ||
+		xe_oa_reg_in_range_table(addr, mtl_oam_b_counters);
+}
+
+/*
+ * Ref: 14010536224:
+ * 0x20cc is repurposed on MTL, so use a separate array for MTL.
+ */
+static const struct xe_mmio_range mtl_oa_mux_regs[] = {
+	{ .start = 0x0d00, .end = 0x0d04 },	/* RPM_CONFIG[0-1] */
+	{ .start = 0x0d0c, .end = 0x0d2c },	/* NOA_CONFIG[0-8] */
+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
+	{ .start = 0x38d100, .end = 0x38d114},	/* VISACTL */
+	{}
+};
+
+static const struct xe_mmio_range gen12_oa_mux_regs[] = {
+	{ .start = 0x0d00, .end = 0x0d04 },     /* RPM_CONFIG[0-1] */
+	{ .start = 0x0d0c, .end = 0x0d2c },     /* NOA_CONFIG[0-8] */
+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
+	{ .start = 0x20cc, .end = 0x20cc },	/* WAIT_FOR_RC6_EXIT */
+	{}
+};
+
+static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
+{
+	if (oa->xe->info.platform == XE_METEORLAKE)
+		return xe_oa_reg_in_range_table(addr, mtl_oa_mux_regs);
+	else
+		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
+}
+
+static u32 mask_reg_value(u32 reg, u32 val)
+{
+	/*
+	 * HALF_SLICE_CHICKEN2 is programmed with a the WaDisableSTUnitPowerOptimization
+	 * workaround. Make sure the value programmed by userspace doesn't change this.
+	 */
+	if (REG_EQUAL_MCR(reg, HALF_SLICE_CHICKEN2))
+		val = val & ~_MASKED_BIT_ENABLE(GEN8_ST_PO_DISABLE);
+
+	/*
+	 * WAIT_FOR_RC6_EXIT has only one bit fullfilling the function indicated by its
+	 * name and a bunch of selection fields used by OA configs.
+	 */
+	if (REG_EQUAL(reg, WAIT_FOR_RC6_EXIT))
+		val = val & ~_MASKED_BIT_ENABLE(HSW_WAIT_FOR_RC6_EXIT_ENABLE);
+
+	return val;
+}
+
+static struct xe_oa_reg *
+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
+		 u32 __user *regs, u32 n_regs)
+{
+	struct xe_oa_reg *oa_regs;
+	int err;
+	u32 i;
+
+	if (!n_regs || WARN_ON(!is_valid))
+		return NULL;
+
+	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
+	if (!oa_regs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < n_regs; i++) {
+		u32 addr, value;
+
+		err = get_user(addr, regs);
+		if (err)
+			goto addr_err;
+
+		if (!is_valid(oa, addr)) {
+			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
+			err = -EINVAL;
+			goto addr_err;
+		}
+
+		err = get_user(value, regs + 1);
+		if (err)
+			goto addr_err;
+
+		oa_regs[i].addr = XE_REG(addr);
+		oa_regs[i].value = mask_reg_value(addr, value);
+
+		regs += 2;
+	}
+
+	return oa_regs;
+
+addr_err:
+	kfree(oa_regs);
+	return ERR_PTR(err);
+}
+
+static ssize_t show_dynamic_id(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       char *buf)
+{
+	struct xe_oa_config *oa_config =
+		container_of(attr, typeof(*oa_config), sysfs_metric_id);
+
+	return sprintf(buf, "%d\n", oa_config->id);
+}
+
+static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
+					 struct xe_oa_config *oa_config)
+{
+	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
+	oa_config->sysfs_metric_id.attr.name = "id";
+	oa_config->sysfs_metric_id.attr.mode = 0444;
+	oa_config->sysfs_metric_id.show = show_dynamic_id;
+	oa_config->sysfs_metric_id.store = NULL;
+
+	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
+	oa_config->attrs[1] = NULL;
+
+	oa_config->sysfs_metric.name = oa_config->uuid;
+	oa_config->sysfs_metric.attrs = oa_config->attrs;
+
+	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
+}
+
+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct drm_xe_oa_config *arg = data;
+	struct xe_oa_config *oa_config, *tmp;
+	struct xe_oa_reg *regs;
+	int err, id;
+
+	if (!oa->xe) {
+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		return -ENODEV;
+	}
+
+	if (xe_oa_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
+		return -EACCES;
+	}
+
+	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
+	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
+	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
+		drm_dbg(&oa->xe->drm, "No OA registers given\n");
+		return -EINVAL;
+	}
+
+	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
+	if (!oa_config)
+		return -ENOMEM;
+
+	oa_config->oa = oa;
+	kref_init(&oa_config->ref);
+
+	if (!uuid_is_valid(arg->uuid)) {
+		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
+		err = -EINVAL;
+		goto reg_err;
+	}
+
+	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
+	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
+
+	oa_config->mux_regs_len = arg->n_mux_regs;
+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_mux_addr,
+				u64_to_user_ptr(arg->mux_regs_ptr),
+				arg->n_mux_regs);
+	if (IS_ERR(regs)) {
+		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
+		err = PTR_ERR(regs);
+		goto reg_err;
+	}
+	oa_config->mux_regs = regs;
+
+	oa_config->b_counter_regs_len = arg->n_boolean_regs;
+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_b_counter_addr,
+				u64_to_user_ptr(arg->boolean_regs_ptr),
+				arg->n_boolean_regs);
+	if (IS_ERR(regs)) {
+		drm_dbg(&oa->xe->drm, "Failed to create OA config for b_counter_regs\n");
+		err = PTR_ERR(regs);
+		goto reg_err;
+	}
+	oa_config->b_counter_regs = regs;
+
+	oa_config->flex_regs_len = arg->n_flex_regs;
+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_flex_addr,
+				u64_to_user_ptr(arg->flex_regs_ptr),
+				arg->n_flex_regs);
+	if (IS_ERR(regs)) {
+		drm_dbg(&oa->xe->drm, "Failed to create OA config for flex_regs\n");
+		err = PTR_ERR(regs);
+		goto reg_err;
+	}
+	oa_config->flex_regs = regs;
+
+	err = mutex_lock_interruptible(&oa->metrics_lock);
+	if (err)
+		goto reg_err;
+
+	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
+	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
+		if (!strcmp(tmp->uuid, oa_config->uuid)) {
+			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
+			err = -EADDRINUSE;
+			goto sysfs_err;
+		}
+	}
+
+	err = create_dynamic_oa_sysfs_entry(oa, oa_config);
+	if (err) {
+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
+		goto sysfs_err;
+	}
+
+	/* Config id 0 is invalid, id 1 for kernel stored test config. */
+	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 2, 0, GFP_KERNEL);
+	if (oa_config->id < 0) {
+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
+		err = oa_config->id;
+		goto sysfs_err;
+	}
+
+	mutex_unlock(&oa->metrics_lock);
+
+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
+
+	return oa_config->id;
+
+sysfs_err:
+	mutex_unlock(&oa->metrics_lock);
+reg_err:
+	xe_oa_config_put(oa_config);
+	drm_dbg(&oa->xe->drm, "Failed to add new OA config\n");
+	return err;
+}
+
+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_oa_config *oa_config;
+	u64 *arg = data;
+	int ret;
+
+	if (!oa->xe) {
+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		return -ENODEV;
+	}
+
+	if (xe_oa_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
+		return -EACCES;
+	}
+
+	ret = mutex_lock_interruptible(&oa->metrics_lock);
+	if (ret)
+		return ret;
+
+	oa_config = idr_find(&oa->metrics_idr, *arg);
+	if (!oa_config) {
+		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
+		ret = -ENOENT;
+		goto err_unlock;
+	}
+
+	WARN_ON(*arg != oa_config->id);
+
+	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
+
+	idr_remove(&oa->metrics_idr, *arg);
+
+	mutex_unlock(&oa->metrics_lock);
+
+	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
+
+	xe_oa_config_put(oa_config);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&oa->metrics_lock);
+	return ret;
+}
+
 void xe_oa_register(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
@@ -259,6 +629,12 @@ int xe_oa_init(struct xe_device *xe)
 	return 0;
 }
 
+static int destroy_config(int id, void *p, void *data)
+{
+	xe_oa_config_put(p);
+	return 0;
+}
+
 void xe_oa_fini(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
@@ -271,6 +647,7 @@ void xe_oa_fini(struct xe_device *xe)
 	for_each_gt(gt, xe, i)
 		kfree(gt->oa.group);
 
+	idr_for_each(&oa->metrics_idr, destroy_config, oa);
 	idr_destroy(&oa->metrics_idr);
 
 	oa->xe = NULL;
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index ba4ba80fd34cb..79f77f445deb0 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -12,7 +12,12 @@ int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
+int xe_oa_ioctl_version(struct xe_device *xe);
 int xe_oa_sysctl_register(void);
 void xe_oa_sysctl_unregister(void);
 
+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file);
+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file);
 #endif
-- 
2.41.0

