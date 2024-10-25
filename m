Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B587D0C5F4
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 09:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3665C89C29;
	Fri, 25 Oct 2024 09:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIYIBT4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB3289C29
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729848153; x=1761384153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cZdZoS59y5pB5684t7o0vRFdp2OFjQ/+7kYqLEcxOkw=;
 b=iIYIBT4DkIDI3wC3gYtwUrh9b8TQdS+4PqxC5NG4uuzdZXOB6srN0uou
 LkUBvv3ly2CuBM2x7HefssbfF4xy3xpHXR4vujN/L6nMvBDynSSmIAS1I
 p0LngcSqzdHfEEav3h9JgTE68sniFmcWooOZZvD6tBX9TcTyRIA+zKYt0
 aAHIDh6LtPO4Smb4ITI0cmqJQnOt29lLQLmEAmNxnnN0SumXLyjF9RYaN
 mlVz8JRtsaxrb6o+IcolHC+PZFRPM/dQ+uptApFeO1GZa5G3lvjEeVWQv
 g0S73JgNkvjl55rnkdzYQ3ZfS3idyuhLMSus02QtbDWhmKyl26W+VscL6 Q==;
X-CSE-ConnectionGUID: Vn3EITQlSk2rLSUfbRnXdA==
X-CSE-MsgGUID: y1RI0OLvT3im+pHdvTRryw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33316095"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="33316095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:22:33 -0700
X-CSE-ConnectionGUID: ugaNlFvFTq+geNXiaTH5Ew==
X-CSE-MsgGUID: 3MBzpFgcT0O1ee1WopjjXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="85422343"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2024 02:22:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, John.C.Harrison@Intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Rework throttle ABI
Date: Fri, 25 Oct 2024 14:52:38 +0530
Message-Id: <20241025092238.167042-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Current implementation adds multiple sysfs entries for getting GT
throttle status and its reasons, which forces the user to read multiple
entries for evaluating the result. Since output of each entry is based
on the same underlying hardware register and considering the access type
of this register is RO/v, the value of this register can change at any
given point, even between subsequent sysfs reads. This makes current
implementation fundamentally flawed which can produce inconsistent results.

Rework throttle ABI and introduce throttle_status attribute which will
provide throttle status through a oneshot register read, making it
relatively less error prone. The new ABI will provide throttle reasons
in a string based list based on the respective bits which are set in the
hardware. Empty output means no bits are set and hence no throttling.

$ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
prochot
thermal
ratl
thermalert
tdc
pl4
pl1
pl2

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 219 ++++------------------------
 1 file changed, 31 insertions(+), 188 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 03b225364101..ba8bba7721ef 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -16,24 +16,23 @@
 /**
  * DOC: Xe GT Throttle
  *
- * Provides sysfs entries and other helpers for frequency throttle reasons in GT
+ * Provides sysfs entry for frequency throttle status and its reasons in GT
  *
- * device/gt#/freq0/throttle/status - Overall status
- * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
- * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
- * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
- * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
- * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
- * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
- * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
- * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
+ * device/tile#/gt#/freq0/throttle_status - Throttle status and its reasons
  */
 
-static struct xe_gt *
-dev_to_gt(struct device *dev)
-{
-	return kobj_to_gt(dev->kobj.parent);
-}
+/* Available GT throttle reasons */
+static const char *const throttle_reasons[] = {
+	[ffs(PROCHOT_MASK) - 1]		= "prochot",
+	[ffs(THERMAL_LIMIT_MASK) - 1]	= "thermal",
+	[ffs(RATL_MASK) - 1]		= "ratl",
+	[ffs(VR_THERMALERT_MASK) - 1]	= "thermalert",
+	[ffs(VR_TDC_MASK) - 1]		= "tdc",
+	[ffs(POWER_LIMIT_4_MASK) - 1]	= "pl4",
+	[ffs(POWER_LIMIT_1_MASK) - 1]	= "pl1",
+	[ffs(POWER_LIMIT_2_MASK) - 1]	= "pl2",
+};
+static_assert(ARRAY_SIZE(throttle_reasons) == ffs(POWER_LIMIT_2_MASK));
 
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
@@ -49,191 +48,35 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 	return reg;
 }
 
-static u32 read_status(struct xe_gt *gt)
+static ssize_t throttle_status_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+	struct xe_gt *gt = kobj_to_gt(dev->kobj.parent);
+	unsigned long status;
+	const char *reason;
+	u32 index, count = 0;
 
-	return status;
-}
-
-static u32 read_reason_pl1(struct xe_gt *gt)
-{
-	u32 pl1 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_1_MASK;
-
-	return pl1;
-}
-
-static u32 read_reason_pl2(struct xe_gt *gt)
-{
-	u32 pl2 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_2_MASK;
-
-	return pl2;
-}
-
-static u32 read_reason_pl4(struct xe_gt *gt)
-{
-	u32 pl4 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_4_MASK;
-
-	return pl4;
-}
-
-static u32 read_reason_thermal(struct xe_gt *gt)
-{
-	u32 thermal = xe_gt_throttle_get_limit_reasons(gt) & THERMAL_LIMIT_MASK;
-
-	return thermal;
-}
-
-static u32 read_reason_prochot(struct xe_gt *gt)
-{
-	u32 prochot = xe_gt_throttle_get_limit_reasons(gt) & PROCHOT_MASK;
-
-	return prochot;
-}
-
-static u32 read_reason_ratl(struct xe_gt *gt)
-{
-	u32 ratl = xe_gt_throttle_get_limit_reasons(gt) & RATL_MASK;
-
-	return ratl;
-}
-
-static u32 read_reason_vr_thermalert(struct xe_gt *gt)
-{
-	u32 thermalert = xe_gt_throttle_get_limit_reasons(gt) & VR_THERMALERT_MASK;
-
-	return thermalert;
-}
-
-static u32 read_reason_vr_tdc(struct xe_gt *gt)
-{
-	u32 tdc = xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;
-
-	return tdc;
-}
+	status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
 
-static ssize_t status_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool status = !!read_status(gt);
-
-	return sysfs_emit(buff, "%u\n", status);
-}
-static DEVICE_ATTR_RO(status);
-
-static ssize_t reason_pl1_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool pl1 = !!read_reason_pl1(gt);
-
-	return sysfs_emit(buff, "%u\n", pl1);
-}
-static DEVICE_ATTR_RO(reason_pl1);
-
-static ssize_t reason_pl2_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool pl2 = !!read_reason_pl2(gt);
-
-	return sysfs_emit(buff, "%u\n", pl2);
-}
-static DEVICE_ATTR_RO(reason_pl2);
-
-static ssize_t reason_pl4_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool pl4 = !!read_reason_pl4(gt);
-
-	return sysfs_emit(buff, "%u\n", pl4);
-}
-static DEVICE_ATTR_RO(reason_pl4);
-
-static ssize_t reason_thermal_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool thermal = !!read_reason_thermal(gt);
-
-	return sysfs_emit(buff, "%u\n", thermal);
-}
-static DEVICE_ATTR_RO(reason_thermal);
-
-static ssize_t reason_prochot_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool prochot = !!read_reason_prochot(gt);
-
-	return sysfs_emit(buff, "%u\n", prochot);
-}
-static DEVICE_ATTR_RO(reason_prochot);
-
-static ssize_t reason_ratl_show(struct device *dev,
-				struct device_attribute *attr,
-				char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool ratl = !!read_reason_ratl(gt);
-
-	return sysfs_emit(buff, "%u\n", ratl);
-}
-static DEVICE_ATTR_RO(reason_ratl);
-
-static ssize_t reason_vr_thermalert_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool thermalert = !!read_reason_vr_thermalert(gt);
-
-	return sysfs_emit(buff, "%u\n", thermalert);
-}
-static DEVICE_ATTR_RO(reason_vr_thermalert);
-
-static ssize_t reason_vr_tdc_show(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buff)
-{
-	struct xe_gt *gt = dev_to_gt(dev);
-	bool tdc = !!read_reason_vr_tdc(gt);
+	for_each_set_bit(index, &status, ffs(POWER_LIMIT_2_MASK)) {
+		reason = throttle_reasons[index];
+		if (reason)
+			count += sysfs_emit_at(buf, count, "%s\n", reason);
+	}
 
-	return sysfs_emit(buff, "%u\n", tdc);
+	return count;
 }
-static DEVICE_ATTR_RO(reason_vr_tdc);
+static DEVICE_ATTR_RO(throttle_status);
 
-static struct attribute *throttle_attrs[] = {
-	&dev_attr_status.attr,
-	&dev_attr_reason_pl1.attr,
-	&dev_attr_reason_pl2.attr,
-	&dev_attr_reason_pl4.attr,
-	&dev_attr_reason_thermal.attr,
-	&dev_attr_reason_prochot.attr,
-	&dev_attr_reason_ratl.attr,
-	&dev_attr_reason_vr_thermalert.attr,
-	&dev_attr_reason_vr_tdc.attr,
+static const struct attribute *throttle_attrs[] = {
+	&dev_attr_throttle_status.attr,
 	NULL
 };
 
-static const struct attribute_group throttle_group_attrs = {
-	.name = "throttle",
-	.attrs = throttle_attrs,
-};
-
 static void gt_throttle_sysfs_fini(void *arg)
 {
 	struct xe_gt *gt = arg;
 
-	sysfs_remove_group(gt->freq, &throttle_group_attrs);
+	sysfs_remove_files(gt->freq, throttle_attrs);
 }
 
 int xe_gt_throttle_init(struct xe_gt *gt)
@@ -241,7 +84,7 @@ int xe_gt_throttle_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
+	err = sysfs_create_files(gt->freq, throttle_attrs);
 	if (err)
 		return err;
 
-- 
2.34.1

