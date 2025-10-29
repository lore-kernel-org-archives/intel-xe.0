Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47890CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 23:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B8F10E870;
	Wed, 29 Oct 2025 23:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBClQcPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0BA10E870
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761781545; x=1793317545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8sR+7jYjjCE3ZsqwPwOpEuaLQ3B0MV8SAsE70EzWnp0=;
 b=oBClQcPjwEkAy9voUrgBt4xd5VxlDV4nBYbOczV1KfvHSIHwt8stUJk5
 jgKyWgYOzqP6FojybkYnQOPd3pn4Vu0PeMP9186bTV8ZI9KSbvPunLR9V
 fJOoiCBKEzk1YnJQBCcQriGRwRdTebGqqS5LyszDzEidu+3KE4HilC7Zn
 v2NvcimekRVm/j6pirhAmRnAJxqchwnItQjTzEbTUHfBwiuuOIkrLGZRp
 u1cPOzUQwkZ+Pw+YeZv6+7VcyWIn2xn1NJvaeFnyt3Wcgg6YdHTMTlrLD
 CPPEiX4xCBh5otD8ZrfzKh/NTiStnQA7mzOsWQAEBNXaUZ/KOAmXFHFEB Q==;
X-CSE-ConnectionGUID: 970w+0EFT6uiiYDYhUCypA==
X-CSE-MsgGUID: 19HV/SQmSNCkkbTR29z6hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75363578"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="75363578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
X-CSE-ConnectionGUID: bQ2MM4bFQOi8bu8QhbhX5Q==
X-CSE-MsgGUID: Jx20LhC5TZiay+GRTCccRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185456059"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/8] drm/xe/gt_throttle: Tidy up perf reasons reading
Date: Wed, 29 Oct 2025 16:45:04 -0700
Message-ID: <20251029-gt-throttle-cri-v3-2-d1f5abbb8114@intel.com>
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

There's no need to be so verbose with two functions per bit:
read_reason_xxxxx() and reason_xxxxx_show(). Drop the former and just
use a new is_throttled_by() that receives the mask as parameter.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 182 +++++-------------------------------
 1 file changed, 21 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index a4fe43f4663dd..c69710f2dbeb5 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -85,130 +85,9 @@ static u32 read_status(struct xe_gt *gt)
 	return status;
 }
 
-static u32 read_reason_pl1(struct xe_gt *gt)
+static bool is_throttled_by(struct xe_gt *gt, u32 mask)
 {
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
-static u32 read_reason_soc_thermal(struct xe_gt *gt)
-{
-	u32 thermal = xe_gt_throttle_get_limit_reasons(gt) & SOC_THERMAL_LIMIT_MASK;
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
-static u32 read_reason_soc_avg_thermal(struct xe_gt *gt)
-{
-	u32 soc_avg_thermal = xe_gt_throttle_get_limit_reasons(gt) & SOC_AVG_THERMAL_MASK;
-
-	return soc_avg_thermal;
-}
-
-static u32 read_reason_vr_tdc(struct xe_gt *gt)
-{
-	u32 tdc = xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;
-
-	return tdc;
-}
-
-static u32 read_reason_fastvmode(struct xe_gt *gt)
-{
-	u32 fastvmode = xe_gt_throttle_get_limit_reasons(gt) & FASTVMODE_MASK;
-
-	return fastvmode;
-}
-
-static u32 read_reason_mem_thermal(struct xe_gt *gt)
-{
-	u32 mem_thermal = xe_gt_throttle_get_limit_reasons(gt) & MEM_THERMAL_MASK;
-
-	return mem_thermal;
-}
-
-static u32 read_reason_vr_thermal(struct xe_gt *gt)
-{
-	u32 vr_thermal = xe_gt_throttle_get_limit_reasons(gt) & VR_THERMAL_MASK;
-
-	return vr_thermal;
-}
-
-static u32 read_reason_iccmax(struct xe_gt *gt)
-{
-	u32 iccmax = xe_gt_throttle_get_limit_reasons(gt) & ICCMAX_MASK;
-
-	return iccmax;
-}
-
-static u32 read_reason_psys_pl1(struct xe_gt *gt)
-{
-	u32 psys_pl1 = xe_gt_throttle_get_limit_reasons(gt) & PSYS_PL1_MASK;
-
-	return psys_pl1;
-}
-
-static u32 read_reason_psys_pl2(struct xe_gt *gt)
-{
-	u32 psys_pl2 = xe_gt_throttle_get_limit_reasons(gt) & PSYS_PL2_MASK;
-
-	return psys_pl2;
-}
-
-static u32 read_reason_p0_freq(struct xe_gt *gt)
-{
-	u32 p0_freq = xe_gt_throttle_get_limit_reasons(gt) & P0_FREQ_MASK;
-
-	return p0_freq;
-}
-
-static u32 read_reason_psys_crit(struct xe_gt *gt)
-{
-	u32 psys_crit = xe_gt_throttle_get_limit_reasons(gt) & PSYS_CRIT_MASK;
-
-	return psys_crit;
+	return xe_gt_throttle_get_limit_reasons(gt) & mask;
 }
 
 static ssize_t status_show(struct kobject *kobj,
@@ -216,9 +95,8 @@ static ssize_t status_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool status = !!read_status(gt);
 
-	return sysfs_emit(buff, "%u\n", status);
+	return sysfs_emit(buff, "%u\n", !!read_status(gt));
 }
 static struct kobj_attribute attr_status = __ATTR_RO(status);
 
@@ -227,9 +105,8 @@ static ssize_t reason_pl1_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool pl1 = !!read_reason_pl1(gt);
 
-	return sysfs_emit(buff, "%u\n", pl1);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_1_MASK));
 }
 static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 
@@ -238,9 +115,8 @@ static ssize_t reason_pl2_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool pl2 = !!read_reason_pl2(gt);
 
-	return sysfs_emit(buff, "%u\n", pl2);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_2_MASK));
 }
 static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 
@@ -249,9 +125,8 @@ static ssize_t reason_pl4_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool pl4 = !!read_reason_pl4(gt);
 
-	return sysfs_emit(buff, "%u\n", pl4);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, POWER_LIMIT_4_MASK));
 }
 static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 
@@ -260,9 +135,8 @@ static ssize_t reason_thermal_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool thermal = !!read_reason_thermal(gt);
 
-	return sysfs_emit(buff, "%u\n", thermal);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, THERMAL_LIMIT_MASK));
 }
 static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 
@@ -271,9 +145,8 @@ static ssize_t reason_soc_thermal_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool thermal = !!read_reason_soc_thermal(gt);
 
-	return sysfs_emit(buff, "%u\n", thermal);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_THERMAL_LIMIT_MASK));
 }
 static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);
 
@@ -282,9 +155,8 @@ static ssize_t reason_prochot_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool prochot = !!read_reason_prochot(gt);
 
-	return sysfs_emit(buff, "%u\n", prochot);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PROCHOT_MASK));
 }
 static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 
@@ -293,9 +165,8 @@ static ssize_t reason_ratl_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool ratl = !!read_reason_ratl(gt);
 
-	return sysfs_emit(buff, "%u\n", ratl);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, RATL_MASK));
 }
 static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 
@@ -304,9 +175,8 @@ static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool thermalert = !!read_reason_vr_thermalert(gt);
 
-	return sysfs_emit(buff, "%u\n", thermalert);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMALERT_MASK));
 }
 static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
 
@@ -315,9 +185,8 @@ static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool avg_thermalert = !!read_reason_soc_avg_thermal(gt);
 
-	return sysfs_emit(buff, "%u\n", avg_thermalert);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, SOC_AVG_THERMAL_MASK));
 }
 static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);
 
@@ -326,9 +195,8 @@ static ssize_t reason_vr_tdc_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool tdc = !!read_reason_vr_tdc(gt);
 
-	return sysfs_emit(buff, "%u\n", tdc);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_TDC_MASK));
 }
 static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 
@@ -337,9 +205,8 @@ static ssize_t reason_fastvmode_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool fastvmode = !!read_reason_fastvmode(gt);
 
-	return sysfs_emit(buff, "%u\n", fastvmode);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, FASTVMODE_MASK));
 }
 static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);
 
@@ -348,9 +215,8 @@ static ssize_t reason_mem_thermal_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool mem_thermal = !!read_reason_mem_thermal(gt);
 
-	return sysfs_emit(buff, "%u\n", mem_thermal);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, MEM_THERMAL_MASK));
 }
 static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);
 
@@ -359,9 +225,8 @@ static ssize_t reason_vr_thermal_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool vr_thermal = !!read_reason_vr_thermal(gt);
 
-	return sysfs_emit(buff, "%u\n", vr_thermal);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, VR_THERMAL_MASK));
 }
 static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);
 
@@ -370,9 +235,8 @@ static ssize_t reason_iccmax_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool iccmax = !!read_reason_iccmax(gt);
 
-	return sysfs_emit(buff, "%u\n", iccmax);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ICCMAX_MASK));
 }
 static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);
 
@@ -381,9 +245,8 @@ static ssize_t reason_psys_pl1_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool psys_pl1 = !!read_reason_psys_pl1(gt);
 
-	return sysfs_emit(buff, "%u\n", psys_pl1);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL1_MASK));
 }
 static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);
 
@@ -392,9 +255,8 @@ static ssize_t reason_psys_pl2_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool psys_pl2 = !!read_reason_psys_pl2(gt);
 
-	return sysfs_emit(buff, "%u\n", psys_pl2);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_PL2_MASK));
 }
 static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);
 
@@ -403,9 +265,8 @@ static ssize_t reason_p0_freq_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool p0_freq = !!read_reason_p0_freq(gt);
 
-	return sysfs_emit(buff, "%u\n", p0_freq);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, P0_FREQ_MASK));
 }
 static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);
 
@@ -414,9 +275,8 @@ static ssize_t reason_psys_crit_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
-	bool psys_crit = !!read_reason_psys_crit(gt);
 
-	return sysfs_emit(buff, "%u\n", psys_crit);
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, PSYS_CRIT_MASK));
 }
 static struct kobj_attribute attr_reason_psys_crit = __ATTR_RO(reason_psys_crit);
 

-- 
2.51.0

