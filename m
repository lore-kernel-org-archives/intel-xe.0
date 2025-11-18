Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE22CEE347
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442A110E513;
	Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpAZsWsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F210E4FB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484232; x=1795020232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WLb9QvEeSlvzTAlebm7ZC36H1XFDrq889eJZVZQhpXM=;
 b=VpAZsWsb7GjrchEQXWP2o90Qa4dIV4Xw6ZpZ8pOZDWbxu8BEiKGh8E/x
 wamHfl6M7Mmwe65IaLEqN8Wn8K77LNSvHdZM3goPsqFaK3flaHmEl1fx1
 3T0vOzGjMiip2eKHxwpHqknr1esmQeeTTxZBoY0bhSKLX+yn6hLMwP7Z7
 YJkztIh5ThOKhbFp1D1tozpUsVrakuYeVB5ZUaVmUkpCBAJww5CvI0R8W
 +EBIkdpy2GVnNpVSdWD6iHDMniRfhHShQd+3L7GEvGDSS9/AyLI/QEnem
 f1M68z4U5ct5l2g+FQgh0z3aAEs69TNLG4sOkbJK8syGV0mvR7f9OHg3/ w==;
X-CSE-ConnectionGUID: cstBAOP8TCCs1Vat2cDm9g==
X-CSE-MsgGUID: /WUwe48vTqmTM5DUtKQf2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544793"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:52 -0800
X-CSE-ConnectionGUID: d7kwD110RhStklI+4JkpHw==
X-CSE-MsgGUID: c4smI6VzThC1fw0ohBMn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952277"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 26/27] drm/xe/sysfs: Use scope-based runtime power management
Date: Tue, 18 Nov 2025 08:44:05 -0800
Message-ID: <20251118164338.3572146-55-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Switch sysfs to use scope-based runtime power management to slightly
simplify the code.

v2:
 - Drop unnecessary local variables.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 33 ++++++++-----------
 drivers/gpu/drm/xe/xe_gt_freq.c               | 27 +++++----------
 drivers/gpu/drm/xe/xe_gt_throttle.c           |  9 ++---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 16 ++++-----
 4 files changed, 31 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index ec9c06b06fb5..a73e0e957cb0 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -57,9 +57,8 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
-	xe_pm_runtime_put(xe);
 
 	return ret ?: count;
 }
@@ -84,33 +83,31 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
 	u16 major = 0, minor = 0, hotfix = 0, build = 0;
 	int ret;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
 			    &cap, NULL);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
 				    &ver_low, NULL);
 		if (ret)
-			goto out;
+			return ret;
 
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
 				    &ver_high, NULL);
 		if (ret)
-			goto out;
+			return ret;
 
 		major = REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low);
 		minor = REG_FIELD_GET(MINOR_VERSION_MASK, ver_low);
 		hotfix = REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high);
 		build = REG_FIELD_GET(BUILD_VERSION_MASK, ver_high);
 	}
-out:
-	xe_pm_runtime_put(xe);
 
-	return ret ?: sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, build);
+	return sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, build);
 }
 static DEVICE_ATTR_ADMIN_RO(lb_fan_control_version);
 
@@ -123,33 +120,31 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
 	u16 major = 0, minor = 0, hotfix = 0, build = 0;
 	int ret;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
 			    &cap, NULL);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
 				    &ver_low, NULL);
 		if (ret)
-			goto out;
+			return ret;
 
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
 				    &ver_high, NULL);
 		if (ret)
-			goto out;
+			return ret;
 
 		major = REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low);
 		minor = REG_FIELD_GET(MINOR_VERSION_MASK, ver_low);
 		hotfix = REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high);
 		build = REG_FIELD_GET(BUILD_VERSION_MASK, ver_high);
 	}
-out:
-	xe_pm_runtime_put(xe);
 
-	return ret ?: sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, build);
+	return sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, build);
 }
 static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
 
@@ -233,9 +228,8 @@ auto_link_downgrade_capable_show(struct device *dev, struct device_attribute *at
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	u32 cap, val;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE_CAP);
-	xe_pm_runtime_put(xe);
 
 	cap = REG_FIELD_GET(LINK_DOWNGRADE, val);
 	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE);
@@ -251,11 +245,10 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 	u32 val = 0;
 	int ret;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ret = xe_pcode_read(xe_device_get_root_tile(xe),
 			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
 			    &val, NULL);
-	xe_pm_runtime_put(xe);
 
 	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_LINK_DOWNGRADE_STATUS, val));
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 849ea6c86e8e..6284a4daf00a 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -70,9 +70,8 @@ static ssize_t act_freq_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	freq = xe_guc_pc_get_act_freq(pc);
-	xe_pm_runtime_put(dev_to_xe(dev));
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
@@ -86,9 +85,8 @@ static ssize_t cur_freq_show(struct kobject *kobj,
 	u32 freq;
 	ssize_t ret;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	ret = xe_guc_pc_get_cur_freq(pc, &freq);
-	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -113,9 +111,8 @@ static ssize_t rpe_freq_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	freq = xe_guc_pc_get_rpe_freq(pc);
-	xe_pm_runtime_put(dev_to_xe(dev));
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
@@ -128,9 +125,8 @@ static ssize_t rpa_freq_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	freq = xe_guc_pc_get_rpa_freq(pc);
-	xe_pm_runtime_put(dev_to_xe(dev));
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
@@ -154,9 +150,8 @@ static ssize_t min_freq_show(struct kobject *kobj,
 	u32 freq;
 	ssize_t ret;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	ret = xe_guc_pc_get_min_freq(pc, &freq);
-	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -175,9 +170,8 @@ static ssize_t min_freq_store(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	ret = xe_guc_pc_set_min_freq(pc, freq);
-	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -193,9 +187,8 @@ static ssize_t max_freq_show(struct kobject *kobj,
 	u32 freq;
 	ssize_t ret;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	ret = xe_guc_pc_get_max_freq(pc, &freq);
-	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -214,9 +207,8 @@ static ssize_t max_freq_store(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	ret = xe_guc_pc_set_max_freq(pc, freq);
-	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -243,9 +235,8 @@ static ssize_t power_profile_store(struct kobject *kobj,
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	int err;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
+	guard(xe_pm_runtime)(dev_to_xe(dev));
 	err = xe_guc_pc_set_power_profile(pc, buff);
-	xe_pm_runtime_put(dev_to_xe(dev));
 
 	return err ?: count;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 82c5fbcdfbe3..096a6187ff12 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -85,7 +85,7 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg reg;
-	u32 val, mask;
+	u32 mask;
 
 	if (xe_gt_is_media_type(gt))
 		reg = MTL_MEDIA_PERF_LIMIT_REASONS;
@@ -97,11 +97,8 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 	else
 		mask = GT0_PERF_LIMIT_REASONS_MASK;
 
-	xe_pm_runtime_get(xe);
-	val = xe_mmio_read32(&gt->mmio, reg) & mask;
-	xe_pm_runtime_put(xe);
-
-	return val;
+	guard(xe_pm_runtime)(xe);
+	return xe_mmio_read32(&gt->mmio, reg) & mask;
 }
 
 static bool is_throttled_by(struct xe_gt *gt, u32 mask)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 640950172088..cb45cdceef67 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -43,16 +43,14 @@ static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
 {
 	struct xe_device *xe = kobj_to_xe(kobj);
 	struct kobj_attribute *kattr;
-	ssize_t ret = -EIO;
 
 	kattr = container_of(attr, struct kobj_attribute, attr);
 	if (kattr->show) {
-		xe_pm_runtime_get(xe);
-		ret = kattr->show(kobj, kattr, buf);
-		xe_pm_runtime_put(xe);
+		guard(xe_pm_runtime)(xe);
+		return kattr->show(kobj, kattr, buf);
 	}
 
-	return ret;
+	return -EIO;
 }
 
 static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
@@ -62,16 +60,14 @@ static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
 {
 	struct xe_device *xe = kobj_to_xe(kobj);
 	struct kobj_attribute *kattr;
-	ssize_t ret = -EIO;
 
 	kattr = container_of(attr, struct kobj_attribute, attr);
 	if (kattr->store) {
-		xe_pm_runtime_get(xe);
-		ret = kattr->store(kobj, kattr, buf, count);
-		xe_pm_runtime_put(xe);
+		guard(xe_pm_runtime)(xe);
+		return kattr->store(kobj, kattr, buf, count);
 	}
 
-	return ret;
+	return -EIO;
 }
 
 static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
-- 
2.51.1

