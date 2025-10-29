Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F52CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 23:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94A610E874;
	Wed, 29 Oct 2025 23:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbRebk0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483D10E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 23:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761781545; x=1793317545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKXzeoR8zpEYzA+sUzE3I4AkMV7M2XwGlLocw/m7CLw=;
 b=MbRebk0tRXFgEplg4iZaQqDMrnaSgtR//+Lmtkrp6kHOZB6B5iiQB53i
 SgYguyg5g/VacGLW2f4KZFWR4N2JahmrSzOK1lW79oBAzhJ5uTUoJeu4r
 TnvTkEtUtdak4LqeXHIbkqc7I7roim1OpFwApuZt+INHKlflVIOyUnfls
 eeq63TRDGzJrPIGUHKxg7H1qduPB5e1B4P4fdaN0PAIN8/iT9InByFVP/
 l9UD7rojSroZcISsWqrF0hf5XYVAoLNrb7+HLiRycHjvMEgFlWLzGsER0
 0Ouz8oyiTF20YZEFQoIcolKO9NIopXxjo7DHoZl1QMucfsCe3rxUFG3O7 A==;
X-CSE-ConnectionGUID: Vq1EXW3OQXmXnMtCocSn8w==
X-CSE-MsgGUID: cnYy96UGQtSnJtFXiytL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75363580"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="75363580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
X-CSE-ConnectionGUID: gQUPU/vIRiaI9pozK+wWIw==
X-CSE-MsgGUID: 4u3usG7MT165otEp48P81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185456066"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 4/8] drm/xe/gt_throttle: Add throttle_to_gt()
Date: Wed, 29 Oct 2025 16:45:06 -0700
Message-ID: <20251029-gt-throttle-cri-v3-4-d1f5abbb8114@intel.com>
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

Reduce boilerplate code by adding a helper to go directly from the
throttle kobject to the gt. Note that there's already a kobj_to_gt(),
but that actually converts our kobj_gt object to gt.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 65 ++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index f743444f641a8..e08023c5e77b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -48,12 +48,16 @@
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
@@ -85,8 +89,7 @@ static bool is_throttled_by(struct xe_gt *gt, u32 mask)
 static ssize_t status_show(struct kobject *kobj,
 			   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
 }
@@ -95,8 +98,7 @@ static struct kobj_attribute attr_status = __ATTR_RO(status);
 static ssize_t reason_pl1_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_1_MASK));
 }
@@ -105,8 +107,7 @@ static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 static ssize_t reason_pl2_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_2_MASK));
 }
@@ -115,8 +116,7 @@ static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 static ssize_t reason_pl4_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_4_MASK));
 }
@@ -125,8 +125,7 @@ static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 static ssize_t reason_thermal_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, THERMAL_LIMIT_MASK));
 }
@@ -135,8 +134,7 @@ static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_THERMAL_LIMIT_MASK));
 }
@@ -145,8 +143,7 @@ static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_ther
 static ssize_t reason_prochot_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PROCHOT_MASK));
 }
@@ -155,8 +152,7 @@ static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 static ssize_t reason_ratl_show(struct kobject *kobj,
 				struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, RATL_MASK));
 }
@@ -165,8 +161,7 @@ static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 					 struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMALERT_MASK));
 }
@@ -175,8 +170,7 @@ static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_the
 static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 					   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_AVG_THERMAL_MASK));
 }
@@ -185,8 +179,7 @@ static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_
 static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_TDC_MASK));
 }
@@ -195,8 +188,7 @@ static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 static ssize_t reason_fastvmode_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, FASTVMODE_MASK));
 }
@@ -205,8 +197,7 @@ static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode)
 static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, MEM_THERMAL_MASK));
 }
@@ -215,8 +206,7 @@ static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_ther
 static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 				      struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMAL_MASK));
 }
@@ -225,8 +215,7 @@ static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_therma
 static ssize_t reason_iccmax_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ICCMAX_MASK));
 }
@@ -235,8 +224,7 @@ static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);
 static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL1_MASK));
 }
@@ -245,8 +233,7 @@ static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);
 static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL2_MASK));
 }
@@ -255,8 +242,7 @@ static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);
 static ssize_t reason_p0_freq_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct xe_gt *gt = dev_to_gt(dev);
+	struct xe_gt *gt = throttle_to_gt(kobj);
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, P0_FREQ_MASK));
 }
@@ -265,8 +251,7 @@ static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);
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

