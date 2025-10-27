Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700F0CCD1A5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 05:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A8710E346;
	Mon, 27 Oct 2025 05:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhWHhPlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77A610E13E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544681; x=1793080681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X/jJufsOb1FZ4I4BtVRxkOPnOmPj+uKQCN/zfxsSZCg=;
 b=WhWHhPlhKnDnbZU84CMejqTFZThRVL1FkMSoGwOUz2MddtoIrfpt26Ie
 ZDNWCApCJV5GKlBLLuJIicIb5K8W5J1Va80FNYOHx4uUBDl/inWRuG2B/
 MGS8USAN7kIzVXZVYeYrycbviw6g9bEk8Gq5fuaNO+KY4RKUnqkA3N3y5
 43FmrKTfAtKW9vphOsnLyMPTBPFkj2jTuXz4KA6Uofqisvqs91hVg0NW1
 umDWIEcJY6rSn2D0aQh9hMXBk13cj/ZbYBDG3O+CfmYYosDnHJAT4SjIi
 2ZsKm88iEM+Qb3i8wLtHNnNgv3eQBsF0xTmTkv5n77wzcNrsmeG0AZ9tK Q==;
X-CSE-ConnectionGUID: 7WIepd29TbSRWvB+XT86Uw==
X-CSE-MsgGUID: Esd52BeBSKS0RDeLBgkfeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73905953"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73905953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
X-CSE-ConnectionGUID: QXNaTwoiSXCQIyTsblp3Xg==
X-CSE-MsgGUID: iQyJ3rWzRq2lgHL0m6DlQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185308486"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 7/8] drm/xe/gt_throttle: Drop individual show functions
Date: Sun, 26 Oct 2025 22:57:19 -0700
Message-ID: <20251026-gt-throttle-cri-v2-7-41f8288a71a7@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
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

They are all doing the same thing with the mask being the param. Just
declare our own attribute to store the mask and provide a single
function.

Another common pattern is to define the show function in the macro,
however on follow up work the mask may be used for returning more
information, so it'd need to be stored in any case.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 254 +++++++++---------------------------
 1 file changed, 62 insertions(+), 192 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 8647d2c997347..fa7068aac3344 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -54,6 +54,11 @@
  * - ``reason_vr_tdc``: VR TDC
  */
 
+struct throttle_attribute {
+	struct kobj_attribute attr;
+	u32 mask;
+};
+
 static struct xe_gt *dev_to_gt(struct device *dev)
 {
 	return kobj_to_gt(dev->kobj.parent);
@@ -64,6 +69,11 @@ static struct xe_gt *throttle_to_gt(struct kobject *kobj)
 	return dev_to_gt(kobj_to_dev(kobj));
 }
 
+static struct throttle_attribute *kobj_attribute_to_throttle(struct kobj_attribute *attr)
+{
+	return container_of(attr, struct throttle_attribute, attr);
+}
+
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -92,214 +102,74 @@ static bool is_throttled_by(struct xe_gt *gt, u32 mask)
 	return xe_gt_throttle_get_limit_reasons(gt) & mask;
 }
 
-static ssize_t status_show(struct kobject *kobj,
+static ssize_t reason_show(struct kobject *kobj,
 			   struct kobj_attribute *attr, char *buff)
 {
+	struct throttle_attribute *ta = kobj_attribute_to_throttle(attr);
 	struct xe_gt *gt = throttle_to_gt(kobj);
 
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
-}
-
-static ssize_t reason_pl1_show(struct kobject *kobj,
-			       struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_1_MASK));
-}
-
-static ssize_t reason_pl2_show(struct kobject *kobj,
-			       struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_2_MASK));
-}
-
-static ssize_t reason_pl4_show(struct kobject *kobj,
-			       struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_4_MASK));
-}
-
-static ssize_t reason_thermal_show(struct kobject *kobj,
-				   struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, THERMAL_LIMIT_MASK));
-}
-
-static ssize_t reason_soc_thermal_show(struct kobject *kobj,
-				       struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_THERMAL_LIMIT_MASK));
-}
-
-static ssize_t reason_prochot_show(struct kobject *kobj,
-				   struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PROCHOT_MASK));
-}
-
-static ssize_t reason_ratl_show(struct kobject *kobj,
-				struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, RATL_MASK));
-}
-
-static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
-					 struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMALERT_MASK));
-}
-
-static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
-					   struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_AVG_THERMAL_MASK));
-}
-
-static ssize_t reason_vr_tdc_show(struct kobject *kobj,
-				  struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_TDC_MASK));
-}
-
-static ssize_t reason_fastvmode_show(struct kobject *kobj,
-				     struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, FASTVMODE_MASK));
-}
-
-static ssize_t reason_mem_thermal_show(struct kobject *kobj,
-				       struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, MEM_THERMAL_MASK));
-}
-
-static ssize_t reason_vr_thermal_show(struct kobject *kobj,
-				      struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMAL_MASK));
-}
-
-static ssize_t reason_iccmax_show(struct kobject *kobj,
-				  struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ICCMAX_MASK));
-}
-
-static ssize_t reason_psys_pl1_show(struct kobject *kobj,
-				    struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL1_MASK));
-}
-
-static ssize_t reason_psys_pl2_show(struct kobject *kobj,
-				    struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL2_MASK));
-}
-
-static ssize_t reason_p0_freq_show(struct kobject *kobj,
-				   struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, P0_FREQ_MASK));
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));
 }
 
-static ssize_t reason_psys_crit_show(struct kobject *kobj,
-				     struct kobj_attribute *attr, char *buff)
-{
-	struct xe_gt *gt = throttle_to_gt(kobj);
-
-	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_CRIT_MASK));
-}
-
-#define THROTTLE_ATTR_RO(name) \
-	struct kobj_attribute attr_##name = __ATTR_RO(name)
+#define THROTTLE_ATTR_RO(name, _mask)				\
+	struct throttle_attribute attr_##name =	{		\
+		.attr = __ATTR(name, 0444, reason_show, NULL),	\
+		.mask = _mask,					\
+	}
 
-static THROTTLE_ATTR_RO(status);
-static THROTTLE_ATTR_RO(reason_pl1);
-static THROTTLE_ATTR_RO(reason_pl2);
-static THROTTLE_ATTR_RO(reason_pl4);
-static THROTTLE_ATTR_RO(reason_thermal);
-static THROTTLE_ATTR_RO(reason_prochot);
-static THROTTLE_ATTR_RO(reason_ratl);
-static THROTTLE_ATTR_RO(reason_vr_thermalert);
-static THROTTLE_ATTR_RO(reason_vr_tdc);
+static THROTTLE_ATTR_RO(status, U32_MAX);
+static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
+static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
+static THROTTLE_ATTR_RO(reason_pl4, POWER_LIMIT_4_MASK);
+static THROTTLE_ATTR_RO(reason_thermal, THERMAL_LIMIT_MASK);
+static THROTTLE_ATTR_RO(reason_prochot, PROCHOT_MASK);
+static THROTTLE_ATTR_RO(reason_ratl, RATL_MASK);
+static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
+static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
 
 static struct attribute *throttle_attrs[] = {
-	&attr_status.attr,
-	&attr_reason_pl1.attr,
-	&attr_reason_pl2.attr,
-	&attr_reason_pl4.attr,
-	&attr_reason_thermal.attr,
-	&attr_reason_prochot.attr,
-	&attr_reason_ratl.attr,
-	&attr_reason_vr_thermalert.attr,
-	&attr_reason_vr_tdc.attr,
+	&attr_status.attr.attr,
+	&attr_reason_pl1.attr.attr,
+	&attr_reason_pl2.attr.attr,
+	&attr_reason_pl4.attr.attr,
+	&attr_reason_thermal.attr.attr,
+	&attr_reason_prochot.attr.attr,
+	&attr_reason_ratl.attr.attr,
+	&attr_reason_vr_thermalert.attr.attr,
+	&attr_reason_vr_tdc.attr.attr,
 	NULL
 };
 
-static THROTTLE_ATTR_RO(reason_vr_thermal);
-static THROTTLE_ATTR_RO(reason_soc_thermal);
-static THROTTLE_ATTR_RO(reason_mem_thermal);
-static THROTTLE_ATTR_RO(reason_iccmax);
-static THROTTLE_ATTR_RO(reason_soc_avg_thermal);
-static THROTTLE_ATTR_RO(reason_fastvmode);
-static THROTTLE_ATTR_RO(reason_psys_pl1);
-static THROTTLE_ATTR_RO(reason_psys_pl2);
-static THROTTLE_ATTR_RO(reason_p0_freq);
-static THROTTLE_ATTR_RO(reason_psys_crit);
+static THROTTLE_ATTR_RO(reason_vr_thermal, VR_THERMAL_MASK);
+static THROTTLE_ATTR_RO(reason_soc_thermal, SOC_THERMAL_LIMIT_MASK);
+static THROTTLE_ATTR_RO(reason_mem_thermal, MEM_THERMAL_MASK);
+static THROTTLE_ATTR_RO(reason_iccmax, ICCMAX_MASK);
+static THROTTLE_ATTR_RO(reason_soc_avg_thermal, SOC_AVG_THERMAL_MASK);
+static THROTTLE_ATTR_RO(reason_fastvmode, FASTVMODE_MASK);
+static THROTTLE_ATTR_RO(reason_psys_pl1, PSYS_PL1_MASK);
+static THROTTLE_ATTR_RO(reason_psys_pl2, PSYS_PL2_MASK);
+static THROTTLE_ATTR_RO(reason_p0_freq, P0_FREQ_MASK);
+static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
 
 static struct attribute *cri_throttle_attrs[] = {
 	/* Common */
-	&attr_status.attr,
-	&attr_reason_pl1.attr,
-	&attr_reason_pl2.attr,
-	&attr_reason_pl4.attr,
-	&attr_reason_prochot.attr,
-	&attr_reason_ratl.attr,
+	&attr_status.attr.attr,
+	&attr_reason_pl1.attr.attr,
+	&attr_reason_pl2.attr.attr,
+	&attr_reason_pl4.attr.attr,
+	&attr_reason_prochot.attr.attr,
+	&attr_reason_ratl.attr.attr,
 	/* CRI */
-	&attr_reason_vr_thermal.attr,
-	&attr_reason_soc_thermal.attr,
-	&attr_reason_mem_thermal.attr,
-	&attr_reason_iccmax.attr,
-	&attr_reason_soc_avg_thermal.attr,
-	&attr_reason_fastvmode.attr,
-	&attr_reason_psys_pl1.attr,
-	&attr_reason_psys_pl2.attr,
-	&attr_reason_p0_freq.attr,
-	&attr_reason_psys_crit.attr,
+	&attr_reason_vr_thermal.attr.attr,
+	&attr_reason_soc_thermal.attr.attr,
+	&attr_reason_mem_thermal.attr.attr,
+	&attr_reason_iccmax.attr.attr,
+	&attr_reason_soc_avg_thermal.attr.attr,
+	&attr_reason_fastvmode.attr.attr,
+	&attr_reason_psys_pl1.attr.attr,
+	&attr_reason_psys_pl2.attr.attr,
+	&attr_reason_p0_freq.attr.attr,
+	&attr_reason_psys_crit.attr.attr,
 	NULL
 };
 

-- 
2.51.0

