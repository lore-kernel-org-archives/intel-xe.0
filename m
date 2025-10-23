Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E87CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 16:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6410E93A;
	Thu, 23 Oct 2025 16:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZMHPPCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21DC10E939
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761238658; x=1792774658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wWUtkSPbmI2I1brypwdAqb8+9dUfZ/zIRLs0czI/l8Q=;
 b=dZMHPPCUgvmkQTjGEGn1b1+qz1f2JqssjbC131lYQEx8jZYm8QeJvts3
 B9FyKd0kwwF0Fdsb2ScucpvJLi6wB7NXW4WQYw+BL5extbSBlIkR75Bs+
 WF6Kfd06tQ5Q6zy0IxioZ95fGAmTV27YA8ZaGEvJwWETp+Mf4YExaORvt
 PXXZLckBRNbFkgXWB6L8AByNWxVC50uaYD3UVPbSs34s+OBYjzmqs6JRm
 n/OV9MwNWeXuRDrQ94RLfK32xD5mBT5hmB4R/cYVPJI/y6hXVTGqVwk+O
 3HJePy3Fm7ADFAh80nlca+2LvyWIzWduZPOW7ykb7R8pccK1A5k3MNHDy w==;
X-CSE-ConnectionGUID: 8uoQHnIXRnCZgDf7e2HiYA==
X-CSE-MsgGUID: 2je1cqeeSx2nhqpGeAXnUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74085670"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74085670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
X-CSE-ConnectionGUID: c98lKJ2bSjSrdcN36ifsMQ==
X-CSE-MsgGUID: rPthKeMVQZSsqTvkaCmesw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184277029"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH 5/5] drm/xe/gt_throttle: Tidy up attribute definition
Date: Thu, 23 Oct 2025 09:56:58 -0700
Message-ID: <20251023-gt-throttle-cri-v1-5-9f36f3c8861c@intel.com>
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

Move the attribute definitions to be grouped together rather than near
the show() function: checkpatch keeps complaining about the missing
newline when defining new attributes and it reads better to group
everything, which should match e.g. the xe_pmu.c style.

While grouping them, also define a THROTTLE_ATTR_RO(), similar to
DEVICE_ATTR_RO(), and use it to define all attributes. This makes it
shorter and with a familiar syntax.

Finally, during the cri_throttle_attrs[] array definition, also
highlight what's coming from common attributes and what is CRI-specific.

These 3 things could be done as separate commits, but they are all about
the same thing: reduce the attribute definition verbosity and are very
simple and mechanical.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 56 +++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index a312e840dcf4a..c79ef7cfb8358 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -94,7 +94,6 @@ static ssize_t status_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
 }
-static struct kobj_attribute attr_status = __ATTR_RO(status);
 
 static ssize_t reason_pl1_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
@@ -103,7 +102,6 @@ static ssize_t reason_pl1_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_1_MASK));
 }
-static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 
 static ssize_t reason_pl2_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
@@ -112,7 +110,6 @@ static ssize_t reason_pl2_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_2_MASK));
 }
-static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 
 static ssize_t reason_pl4_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
@@ -121,7 +118,6 @@ static ssize_t reason_pl4_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_4_MASK));
 }
-static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 
 static ssize_t reason_thermal_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
@@ -130,7 +126,6 @@ static ssize_t reason_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, THERMAL_LIMIT_MASK));
 }
-static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 
 static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
@@ -139,7 +134,6 @@ static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_THERMAL_LIMIT_MASK));
 }
-static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);
 
 static ssize_t reason_prochot_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
@@ -148,7 +142,6 @@ static ssize_t reason_prochot_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PROCHOT_MASK));
 }
-static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 
 static ssize_t reason_ratl_show(struct kobject *kobj,
 				struct kobj_attribute *attr, char *buff)
@@ -157,7 +150,6 @@ static ssize_t reason_ratl_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, RATL_MASK));
 }
-static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 
 static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 					 struct kobj_attribute *attr, char *buff)
@@ -166,7 +158,6 @@ static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMALERT_MASK));
 }
-static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
 
 static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 					   struct kobj_attribute *attr, char *buff)
@@ -175,7 +166,6 @@ static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_AVG_THERMAL_MASK));
 }
-static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);
 
 static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
@@ -184,7 +174,6 @@ static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_TDC_MASK));
 }
-static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 
 static ssize_t reason_fastvmode_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
@@ -193,7 +182,6 @@ static ssize_t reason_fastvmode_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, FASTVMODE_MASK));
 }
-static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);
 
 static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
@@ -202,7 +190,6 @@ static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, MEM_THERMAL_MASK));
 }
-static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);
 
 static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 				      struct kobj_attribute *attr, char *buff)
@@ -211,7 +198,6 @@ static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMAL_MASK));
 }
-static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);
 
 static ssize_t reason_iccmax_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
@@ -220,7 +206,6 @@ static ssize_t reason_iccmax_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ICCMAX_MASK));
 }
-static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);
 
 static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
@@ -229,7 +214,6 @@ static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL1_MASK));
 }
-static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);
 
 static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
@@ -238,7 +222,6 @@ static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL2_MASK));
 }
-static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);
 
 static ssize_t reason_p0_freq_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
@@ -247,7 +230,6 @@ static ssize_t reason_p0_freq_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, P0_FREQ_MASK));
 }
-static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);
 
 static ssize_t reason_psys_crit_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
@@ -256,7 +238,19 @@ static ssize_t reason_psys_crit_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_CRIT_MASK));
 }
-static struct kobj_attribute attr_reason_psys_crit = __ATTR_RO(reason_psys_crit);
+
+#define THROTTLE_ATTR_RO(name) \
+	struct kobj_attribute attr_##name = __ATTR_RO(name)
+
+static THROTTLE_ATTR_RO(status);
+static THROTTLE_ATTR_RO(reason_pl1);
+static THROTTLE_ATTR_RO(reason_pl2);
+static THROTTLE_ATTR_RO(reason_pl4);
+static THROTTLE_ATTR_RO(reason_thermal);
+static THROTTLE_ATTR_RO(reason_prochot);
+static THROTTLE_ATTR_RO(reason_ratl);
+static THROTTLE_ATTR_RO(reason_vr_thermalert);
+static THROTTLE_ATTR_RO(reason_vr_tdc);
 
 static struct attribute *throttle_attrs[] = {
 	&attr_status.attr,
@@ -271,19 +265,33 @@ static struct attribute *throttle_attrs[] = {
 	NULL
 };
 
+static THROTTLE_ATTR_RO(reason_soc_thermal);
+
+static THROTTLE_ATTR_RO(reason_soc_avg_thermal);
+static THROTTLE_ATTR_RO(reason_fastvmode);
+static THROTTLE_ATTR_RO(reason_mem_thermal);
+static THROTTLE_ATTR_RO(reason_vr_thermal);
+static THROTTLE_ATTR_RO(reason_iccmax);
+static THROTTLE_ATTR_RO(reason_psys_pl1);
+static THROTTLE_ATTR_RO(reason_psys_pl2);
+static THROTTLE_ATTR_RO(reason_p0_freq);
+static THROTTLE_ATTR_RO(reason_psys_crit);
+
 static struct attribute *cri_throttle_attrs[] = {
+	/* Common */
 	&attr_status.attr,
+	&attr_reason_pl1.attr,
+	&attr_reason_pl2.attr,
+	&attr_reason_pl4.attr,
 	&attr_reason_prochot.attr,
+	&attr_reason_ratl.attr,
+	/* CRI */
+	&attr_reason_vr_thermal.attr,
 	&attr_reason_soc_thermal.attr,
 	&attr_reason_mem_thermal.attr,
-	&attr_reason_vr_thermal.attr,
 	&attr_reason_iccmax.attr,
-	&attr_reason_ratl.attr,
 	&attr_reason_soc_avg_thermal.attr,
 	&attr_reason_fastvmode.attr,
-	&attr_reason_pl4.attr,
-	&attr_reason_pl1.attr,
-	&attr_reason_pl2.attr,
 	&attr_reason_psys_pl1.attr,
 	&attr_reason_psys_pl2.attr,
 	&attr_reason_p0_freq.attr,

-- 
2.51.0

