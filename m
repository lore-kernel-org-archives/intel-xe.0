Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35437CCF9F5
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 23:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82B110E870;
	Wed, 29 Oct 2025 23:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOCNOAZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA42A10E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761781545; x=1793317545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QtBOSvEGfo/6Tx6pSHUyJW1lcsHuAFsUQ2Zb/B4lFZQ=;
 b=QOCNOAZBO+XwxKGgCCkQO3McABJTNHohK9hHkuEtU6GutN0ORNlatq4/
 UqZerTVCOc6YsjWPyjLhc6r8Un9F43oh5nSrp5giNOwqH+yoUpp6W+0/6
 SQfHEDwtlHqePGr8XJ7VNNrLzlGFbpR8ZUqcT2ckUnohtauxQEt1nmMXz
 pc6L15tomUc8UmfBYBHww8PCFpPJi1MuaQ4AsjgO8QrfZWCzSv67BKQv8
 GJduI/LqVE8Rzc/Wck4EhQ9d52gQprQzGygfLGknHDkf8XPdMcwYHK2ij
 /0q3eGwj2E5JnYHTRgi9cH6I0dPhg67NyuyA+T/3bkegg9pnpBXLJtXl9 Q==;
X-CSE-ConnectionGUID: PpwnAok8Ro63BtizqBqmFg==
X-CSE-MsgGUID: oelRnefbSIyRsFvYvH2UfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75363577"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="75363577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
X-CSE-ConnectionGUID: ZrukvK9jS0enVt6GN6yzeg==
X-CSE-MsgGUID: sAfPAx1eRRe4ZnCDBx7Mdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185456056"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 1/8] drm/xe/cri: Add new performance limit reasons bits
Date: Wed, 29 Oct 2025 16:45:03 -0700
Message-ID: <20251029-gt-throttle-cri-v3-1-d1f5abbb8114@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

From: Sk Anirban <sk.anirban@intel.com>

Crescent Island has some additional and different bits for performance
limit reasons. Add the new definitions and use them for CRI.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v3:
 - Reword commit message (Raag)
v2:
 - Tidy up read_status() and register definition
 - s/throttle_cri_specific_attrs/cri_throttle_attrs/
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  13 ++
 drivers/gpu/drm/xe/xe_gt_throttle.c  | 251 ++++++++++++++++++++++++++++++++++-
 2 files changed, 261 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a895a8e801a90..2088256ad3819 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -590,6 +590,7 @@
 #define GT_GFX_RC6				XE_REG(0x138108)
 
 #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
+/* Common performance limit reason bits - available on all platforms */
 #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
 #define   PROCHOT_MASK				REG_BIT(0)
 #define   THERMAL_LIMIT_MASK			REG_BIT(1)
@@ -599,6 +600,18 @@
 #define   POWER_LIMIT_4_MASK			REG_BIT(8)
 #define   POWER_LIMIT_1_MASK			REG_BIT(10)
 #define   POWER_LIMIT_2_MASK			REG_BIT(11)
+/* Platform-specific performance limit reason bits - for Crescent Island */
+#define   CRI_PERF_LIMIT_REASONS_MASK		0xfdff
+#define   SOC_THERMAL_LIMIT_MASK		REG_BIT(1)
+#define   MEM_THERMAL_MASK			REG_BIT(2)
+#define   VR_THERMAL_MASK			REG_BIT(3)
+#define   ICCMAX_MASK				REG_BIT(4)
+#define   SOC_AVG_THERMAL_MASK			REG_BIT(6)
+#define   FASTVMODE_MASK			REG_BIT(7)
+#define   PSYS_PL1_MASK				REG_BIT(12)
+#define   PSYS_PL2_MASK				REG_BIT(13)
+#define   P0_FREQ_MASK				REG_BIT(14)
+#define   PSYS_CRIT_MASK			REG_BIT(15)
 
 #define GT_PERF_STATUS				XE_REG(0x1381b4)
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index aa962c783cdf7..a4fe43f4663dd 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
 #include "xe_mmio.h"
+#include "xe_platform_types.h"
 #include "xe_pm.h"
 
 /**
@@ -28,6 +29,24 @@
  * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
  * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
  * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
+ *
+ * The following attributes are available on Crescent Island platform:
+ * device/gt#/freq0/throttle/status - Overall throttle status
+ * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to package PL1
+ * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to package PL2
+ * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4
+ * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
+ * device/gt#/freq0/throttle/reason_soc_thermal - Frequency throttle due to SoC thermal
+ * device/gt#/freq0/throttle/reason_mem_thermal - Frequency throttle due to memory thermal
+ * device/gt#/freq0/throttle/reason_vr_thermal - Frequency throttle due to VR thermal
+ * device/gt#/freq0/throttle/reason_iccmax - Frequency throttle due to ICCMAX
+ * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL thermal algorithm
+ * device/gt#/freq0/throttle/reason_soc_avg_thermal - Frequency throttle due to SoC average temp
+ * device/gt#/freq0/throttle/reason_fastvmode - Frequency throttle due to VR is hitting FastVMode
+ * device/gt#/freq0/throttle/reason_psys_pl1 - Frequency throttle due to PSYS PL1
+ * device/gt#/freq0/throttle/reason_psys_pl2 - Frequency throttle due to PSYS PL2
+ * device/gt#/freq0/throttle/reason_p0_freq - Frequency throttle due to P0 frequency
+ * device/gt#/freq0/throttle/reason_psys_crit - Frequency throttle due to PSYS critical
  */
 
 static struct xe_gt *
@@ -52,9 +71,17 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 
 static u32 read_status(struct xe_gt *gt)
 {
-	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 status, mask;
+
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		mask = CRI_PERF_LIMIT_REASONS_MASK;
+	else
+		mask = GT0_PERF_LIMIT_REASONS_MASK;
 
+	status = xe_gt_throttle_get_limit_reasons(gt) & mask;
 	xe_gt_dbg(gt, "throttle reasons: 0x%08x\n", status);
+
 	return status;
 }
 
@@ -86,6 +113,13 @@ static u32 read_reason_thermal(struct xe_gt *gt)
 	return thermal;
 }
 
+static u32 read_reason_soc_thermal(struct xe_gt *gt)
+{
+	u32 thermal = xe_gt_throttle_get_limit_reasons(gt) & SOC_THERMAL_LIMIT_MASK;
+
+	return thermal;
+}
+
 static u32 read_reason_prochot(struct xe_gt *gt)
 {
 	u32 prochot = xe_gt_throttle_get_limit_reasons(gt) & PROCHOT_MASK;
@@ -107,6 +141,13 @@ static u32 read_reason_vr_thermalert(struct xe_gt *gt)
 	return thermalert;
 }
 
+static u32 read_reason_soc_avg_thermal(struct xe_gt *gt)
+{
+	u32 soc_avg_thermal = xe_gt_throttle_get_limit_reasons(gt) & SOC_AVG_THERMAL_MASK;
+
+	return soc_avg_thermal;
+}
+
 static u32 read_reason_vr_tdc(struct xe_gt *gt)
 {
 	u32 tdc = xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;
@@ -114,6 +155,62 @@ static u32 read_reason_vr_tdc(struct xe_gt *gt)
 	return tdc;
 }
 
+static u32 read_reason_fastvmode(struct xe_gt *gt)
+{
+	u32 fastvmode = xe_gt_throttle_get_limit_reasons(gt) & FASTVMODE_MASK;
+
+	return fastvmode;
+}
+
+static u32 read_reason_mem_thermal(struct xe_gt *gt)
+{
+	u32 mem_thermal = xe_gt_throttle_get_limit_reasons(gt) & MEM_THERMAL_MASK;
+
+	return mem_thermal;
+}
+
+static u32 read_reason_vr_thermal(struct xe_gt *gt)
+{
+	u32 vr_thermal = xe_gt_throttle_get_limit_reasons(gt) & VR_THERMAL_MASK;
+
+	return vr_thermal;
+}
+
+static u32 read_reason_iccmax(struct xe_gt *gt)
+{
+	u32 iccmax = xe_gt_throttle_get_limit_reasons(gt) & ICCMAX_MASK;
+
+	return iccmax;
+}
+
+static u32 read_reason_psys_pl1(struct xe_gt *gt)
+{
+	u32 psys_pl1 = xe_gt_throttle_get_limit_reasons(gt) & PSYS_PL1_MASK;
+
+	return psys_pl1;
+}
+
+static u32 read_reason_psys_pl2(struct xe_gt *gt)
+{
+	u32 psys_pl2 = xe_gt_throttle_get_limit_reasons(gt) & PSYS_PL2_MASK;
+
+	return psys_pl2;
+}
+
+static u32 read_reason_p0_freq(struct xe_gt *gt)
+{
+	u32 p0_freq = xe_gt_throttle_get_limit_reasons(gt) & P0_FREQ_MASK;
+
+	return p0_freq;
+}
+
+static u32 read_reason_psys_crit(struct xe_gt *gt)
+{
+	u32 psys_crit = xe_gt_throttle_get_limit_reasons(gt) & PSYS_CRIT_MASK;
+
+	return psys_crit;
+}
+
 static ssize_t status_show(struct kobject *kobj,
 			   struct kobj_attribute *attr, char *buff)
 {
@@ -169,6 +266,17 @@ static ssize_t reason_thermal_show(struct kobject *kobj,
 }
 static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 
+static ssize_t reason_soc_thermal_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool thermal = !!read_reason_soc_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", thermal);
+}
+static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);
+
 static ssize_t reason_prochot_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
@@ -202,6 +310,17 @@ static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 }
 static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
 
+static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
+					   struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool avg_thermalert = !!read_reason_soc_avg_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", avg_thermalert);
+}
+static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);
+
 static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
 {
@@ -213,6 +332,94 @@ static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 }
 static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 
+static ssize_t reason_fastvmode_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool fastvmode = !!read_reason_fastvmode(gt);
+
+	return sysfs_emit(buff, "%u\n", fastvmode);
+}
+static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);
+
+static ssize_t reason_mem_thermal_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool mem_thermal = !!read_reason_mem_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", mem_thermal);
+}
+static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);
+
+static ssize_t reason_vr_thermal_show(struct kobject *kobj,
+				      struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool vr_thermal = !!read_reason_vr_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", vr_thermal);
+}
+static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);
+
+static ssize_t reason_iccmax_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool iccmax = !!read_reason_iccmax(gt);
+
+	return sysfs_emit(buff, "%u\n", iccmax);
+}
+static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);
+
+static ssize_t reason_psys_pl1_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool psys_pl1 = !!read_reason_psys_pl1(gt);
+
+	return sysfs_emit(buff, "%u\n", psys_pl1);
+}
+static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);
+
+static ssize_t reason_psys_pl2_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool psys_pl2 = !!read_reason_psys_pl2(gt);
+
+	return sysfs_emit(buff, "%u\n", psys_pl2);
+}
+static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);
+
+static ssize_t reason_p0_freq_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool p0_freq = !!read_reason_p0_freq(gt);
+
+	return sysfs_emit(buff, "%u\n", p0_freq);
+}
+static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);
+
+static ssize_t reason_psys_crit_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool psys_crit = !!read_reason_psys_crit(gt);
+
+	return sysfs_emit(buff, "%u\n", psys_crit);
+}
+static struct kobj_attribute attr_reason_psys_crit = __ATTR_RO(reason_psys_crit);
+
 static struct attribute *throttle_attrs[] = {
 	&attr_status.attr,
 	&attr_reason_pl1.attr,
@@ -226,24 +433,62 @@ static struct attribute *throttle_attrs[] = {
 	NULL
 };
 
+static struct attribute *cri_throttle_attrs[] = {
+	&attr_status.attr,
+	&attr_reason_prochot.attr,
+	&attr_reason_soc_thermal.attr,
+	&attr_reason_mem_thermal.attr,
+	&attr_reason_vr_thermal.attr,
+	&attr_reason_iccmax.attr,
+	&attr_reason_ratl.attr,
+	&attr_reason_soc_avg_thermal.attr,
+	&attr_reason_fastvmode.attr,
+	&attr_reason_pl4.attr,
+	&attr_reason_pl1.attr,
+	&attr_reason_pl2.attr,
+	&attr_reason_psys_pl1.attr,
+	&attr_reason_psys_pl2.attr,
+	&attr_reason_p0_freq.attr,
+	&attr_reason_psys_crit.attr,
+	NULL
+};
+
 static const struct attribute_group throttle_group_attrs = {
 	.name = "throttle",
 	.attrs = throttle_attrs,
 };
 
+static const struct attribute_group cri_throttle_group_attrs = {
+	.name = "throttle",
+	.attrs = cri_throttle_attrs,
+};
+
+static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe)
+{
+	switch (xe->info.platform) {
+	case XE_CRESCENTISLAND:
+		return &cri_throttle_group_attrs;
+	default:
+		return &throttle_group_attrs;
+	}
+}
+
 static void gt_throttle_sysfs_fini(void *arg)
 {
 	struct xe_gt *gt = arg;
+	struct xe_device *xe = gt_to_xe(gt);
+	const struct attribute_group *group = get_platform_throttle_group(xe);
 
-	sysfs_remove_group(gt->freq, &throttle_group_attrs);
+	sysfs_remove_group(gt->freq, group);
 }
 
 int xe_gt_throttle_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	const struct attribute_group *group = get_platform_throttle_group(xe);
 	int err;
 
-	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
+	err = sysfs_create_group(gt->freq, group);
 	if (err)
 		return err;
 

-- 
2.51.0

