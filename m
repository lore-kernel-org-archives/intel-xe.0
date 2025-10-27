Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB61CCF9EF
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 05:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09B710E33E;
	Mon, 27 Oct 2025 05:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWlM+KA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531110E0F6
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544681; x=1793080681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITlYMRcrtA1Moy3LwgOmMnLg6U1mzEbuPKo0DZCovwM=;
 b=LWlM+KA1Jje1ycsgXn24N2SpWw2MzGNyRCJUjYAFfKJpVhD6wPPMC+cq
 BiAHHLgtZxwYKkKX2WZOAY507FvXGOhdPfkEolLDbfIAv5/Y4kf9ggO9W
 i2VQC6RUbHcOpJGAM5tk7h73Ah/7A4Bj1k236dvTs1BeQoO0XxEOO6SeN
 jBQ4dXTpTfsfjDS63m45qA1lCGId4wpnr0Mg56mhhuXyK9WS3Yjmzotjm
 foB3vgIDH10QhjL0ixj26Jdwsxh+lkC1LV6ikiei4dY0XBa+GqSvkLtkk
 7144PoOyRrxkwzCkUhxOscuZjhFtX9fLwWg+Rd7BRiy6JRihwPrRokehj w==;
X-CSE-ConnectionGUID: KRZqTUsrSk6ODdXu9RrK+g==
X-CSE-MsgGUID: ox+3BIqZTbuq+xfJQDE2mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73905951"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73905951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
X-CSE-ConnectionGUID: 785OJo+6R3GkgGJx71RHMA==
X-CSE-MsgGUID: XYRvMAH/RbCdJzp9lj3dDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185308472"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 5/8] drm/xe/gt_throttle: Tidy up attribute definition
Date: Sun, 26 Oct 2025 22:57:17 -0700
Message-ID: <20251026-gt-throttle-cri-v2-5-41f8288a71a7@intel.com>
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
v2:
 - Reorder attribute definition to match cri_throttle_attrs array (Raag)
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 55 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index e08023c5e77b6..b5317cf714e2e 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -93,7 +93,6 @@ static ssize_t status_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
 }
-static struct kobj_attribute attr_status = __ATTR_RO(status);
 
 static ssize_t reason_pl1_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
@@ -102,7 +101,6 @@ static ssize_t reason_pl1_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_1_MASK));
 }
-static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 
 static ssize_t reason_pl2_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
@@ -111,7 +109,6 @@ static ssize_t reason_pl2_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_2_MASK));
 }
-static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 
 static ssize_t reason_pl4_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buff)
@@ -120,7 +117,6 @@ static ssize_t reason_pl4_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_4_MASK));
 }
-static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 
 static ssize_t reason_thermal_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
@@ -129,7 +125,6 @@ static ssize_t reason_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, THERMAL_LIMIT_MASK));
 }
-static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 
 static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
@@ -138,7 +133,6 @@ static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_THERMAL_LIMIT_MASK));
 }
-static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);
 
 static ssize_t reason_prochot_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
@@ -147,7 +141,6 @@ static ssize_t reason_prochot_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PROCHOT_MASK));
 }
-static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 
 static ssize_t reason_ratl_show(struct kobject *kobj,
 				struct kobj_attribute *attr, char *buff)
@@ -156,7 +149,6 @@ static ssize_t reason_ratl_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, RATL_MASK));
 }
-static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 
 static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 					 struct kobj_attribute *attr, char *buff)
@@ -165,7 +157,6 @@ static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMALERT_MASK));
 }
-static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
 
 static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 					   struct kobj_attribute *attr, char *buff)
@@ -174,7 +165,6 @@ static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_AVG_THERMAL_MASK));
 }
-static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);
 
 static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
@@ -183,7 +173,6 @@ static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_TDC_MASK));
 }
-static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 
 static ssize_t reason_fastvmode_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
@@ -192,7 +181,6 @@ static ssize_t reason_fastvmode_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, FASTVMODE_MASK));
 }
-static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);
 
 static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buff)
@@ -201,7 +189,6 @@ static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, MEM_THERMAL_MASK));
 }
-static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);
 
 static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 				      struct kobj_attribute *attr, char *buff)
@@ -210,7 +197,6 @@ static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMAL_MASK));
 }
-static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);
 
 static ssize_t reason_iccmax_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buff)
@@ -219,7 +205,6 @@ static ssize_t reason_iccmax_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ICCMAX_MASK));
 }
-static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);
 
 static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
@@ -228,7 +213,6 @@ static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL1_MASK));
 }
-static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);
 
 static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 				    struct kobj_attribute *attr, char *buff)
@@ -237,7 +221,6 @@ static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL2_MASK));
 }
-static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);
 
 static ssize_t reason_p0_freq_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buff)
@@ -246,7 +229,6 @@ static ssize_t reason_p0_freq_show(struct kobject *kobj,
 
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, P0_FREQ_MASK));
 }
-static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);
 
 static ssize_t reason_psys_crit_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buff)
@@ -255,7 +237,19 @@ static ssize_t reason_psys_crit_show(struct kobject *kobj,
 
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
@@ -270,19 +264,32 @@ static struct attribute *throttle_attrs[] = {
 	NULL
 };
 
+static THROTTLE_ATTR_RO(reason_vr_thermal);
+static THROTTLE_ATTR_RO(reason_soc_thermal);
+static THROTTLE_ATTR_RO(reason_mem_thermal);
+static THROTTLE_ATTR_RO(reason_iccmax);
+static THROTTLE_ATTR_RO(reason_soc_avg_thermal);
+static THROTTLE_ATTR_RO(reason_fastvmode);
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

