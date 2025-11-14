Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2840CEACEA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598A10EB47;
	Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIfq4x4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F1C10EB38
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WLb9QvEeSlvzTAlebm7ZC36H1XFDrq889eJZVZQhpXM=;
 b=YIfq4x4/WLdxuFbmD62Gjx3niaehbfFXtsmS7tsakZsv31wcACY4xm7y
 ILGbSdn83ShhcLtR3prZ0n2FQRtBZhmaODPUXmYMPIsh6I4kayJLaNl3F
 9/IXL6Xk2rBPCv6Mh8abLjNaNu2EH99CJKHOqgpqTink+1n1RT/EX1rQH
 lVzbOe3AKNtSNAaDu223xGK10VInYpwErhqP9JPn2E7u8SOaOQo8A6Gim
 03slVrybqIScbRn3wt3b3rmmFd/w2nXOGdaIQS01E5jBoQlNBrJeQgGhA
 rLpRGTAdCdavh8ORaZLTvN1qxoNqx8CakKfCNm85oJSYfbSXyyqMPdWVA g==;
X-CSE-ConnectionGUID: qwFAjVU2Tqu9EVN8Sh6Etg==
X-CSE-MsgGUID: J4ABBdFTSCaHnUbH0xmz2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648330"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:50 -0800
X-CSE-ConnectionGUID: G7BeqcvIQFiSvYJz3m9Ahg==
X-CSE-MsgGUID: soSYcWB+Tvm2LdYbsCBTWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308350"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 26/27] drm/xe/sysfs: Use scope-based runtime power
 management
Date: Fri, 14 Nov 2025 13:44:02 -0800
Message-ID: <20251114214335.2388972-55-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

