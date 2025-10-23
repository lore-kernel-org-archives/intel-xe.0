Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15DDCCF9E7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 16:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8192D10E93B;
	Thu, 23 Oct 2025 16:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwM4ln2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C010E934
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761238658; x=1792774658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+IhsnSbzCdpDJtXxrd9BbROnbxWuVo83GtUtORoG9A=;
 b=UwM4ln2xosQ1yatFd9TJVb5p7eLa7ML3I2RhPpxgCPDmHcy4fokGhT6O
 SyWrGyUgxdk/Oc/o0cdjv0JTHv1COBIoUYZAOdRpZ0Hqnsd44vm1HrLKn
 isxGMIsxRsmSoPvVQXgVAzBO3dF3G7eJA0eeOoPv0FeaEAWON+VN+ngKZ
 NVXWYOkCvUZUBT/rarWcUHJ2Ha9/6JEQl8JYBWCjngvmSuteHOeGY8g96
 oeJvp9gj/+B/6CtOsX4ODVAUljin8PofNlx3dTZN2xtA12eab1WqPzX7B
 NFk0hiqP+q4RlptDwzSh6/FA+cH+FTbNJKCio3fpPGL/RS+JRddVVbqNZ Q==;
X-CSE-ConnectionGUID: JRWQyHf4RuCyDH8yglNYBg==
X-CSE-MsgGUID: nGd3bUPbRiqeukS03Of/RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74085669"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74085669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
X-CSE-ConnectionGUID: SBSmL//xSvmiSrxUKcZdKg==
X-CSE-MsgGUID: +JNJpNljQk6IoAE98qVsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184277026"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH 4/5] drm/xe/gt_throttle: Add throttle_to_gt()
Date: Thu, 23 Oct 2025 09:56:57 -0700
Message-ID: <20251023-gt-throttle-cri-v1-4-9f36f3c8861c@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
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

Reduce boilerplate code by adding a helper to go directly from the
throttle kobject to the gt. Note that there's already a kobj_to_gt(),
but that actually converts our kobj_gt object to gt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 65 ++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 21da290709fa8..a312e840dcf4a 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -49,12 +49,16 @@
  * device/gt#/freq0/throttle/reason_psys_crit - Frequency throttle due to PSYS critical
  */
 
-static struct xe_gt *
-dev_to_gt(struct device *dev)
+static struct xe_gt *dev_to_gt(struct device *dev)
 {
 	return kobj_to_gt(dev->kobj.parent);
 }
 
+static struct xe_gt *throttle_to_gt(struct kobject *kobj)
+{
+	return dev_to_gt(kobj_to_dev(kobj));
+}
+
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -86,8 +90,7 @@ static bool is_throttled_by(struct xe_gt *gt, u32 mask)
 static ssize_t status_show(struct kobject *kobj,
 			   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
 }
@@ -96,8 +99,7 @@ static struct kobj_attribute attr_status = __ATTR_RO(status);
 static ssize_t reason_pl1_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_1_MASK));
 }
@@ -106,8 +108,7 @@ static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 static ssize_t reason_pl2_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_2_MASK));
 }
@@ -116,8 +117,7 @@ static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 static ssize_t reason_pl4_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_4_MASK));
 }
@@ -126,8 +126,7 @@ static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 static ssize_t reason_thermal_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, THERMAL_LIMIT_MASK));
 }
@@ -136,8 +135,7 @@ static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_THERMAL_LIMIT_MASK));
 }
@@ -146,8 +144,7 @@ static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_ther
 static ssize_t reason_prochot_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PROCHOT_MASK));
 }
@@ -156,8 +153,7 @@ static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 static ssize_t reason_ratl_show(struct kobject *kobj,
 				struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, RATL_MASK));
 }
@@ -166,8 +162,7 @@ static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 					 struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMALERT_MASK));
 }
@@ -176,8 +171,7 @@ static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_the
 static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 					   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_AVG_THERMAL_MASK));
 }
@@ -186,8 +180,7 @@ static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_
 static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_TDC_MASK));
 }
@@ -196,8 +189,7 @@ static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 static ssize_t reason_fastvmode_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, FASTVMODE_MASK));
 }
@@ -206,8 +198,7 @@ static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode)
 static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, MEM_THERMAL_MASK));
 }
@@ -216,8 +207,7 @@ static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_ther
 static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 				      struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMAL_MASK));
 }
@@ -226,8 +216,7 @@ static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_therma
 static ssize_t reason_iccmax_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ICCMAX_MASK));
 }
@@ -236,8 +225,7 @@ static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);
 static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL1_MASK));
 }
@@ -246,8 +234,7 @@ static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);
 static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL2_MASK));
 }
@@ -256,8 +243,7 @@ static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);
 static ssize_t reason_p0_freq_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, P0_FREQ_MASK));
 }
@@ -266,8 +252,7 @@ static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);
 static ssize_t reason_psys_crit_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_CRIT_MASK));
 }

-- 
2.51.0

