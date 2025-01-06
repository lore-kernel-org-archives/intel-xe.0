Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19884E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F2010E5A4;
	Mon,  6 Jan 2025 07:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q56tum53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE310E5A6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736148996; x=1767684996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDku9lBbiE67w0+wWjp9maNlgpPmW04ZIhdVANOoy7U=;
 b=Q56tum531qhuenVc3WbbVj7KU0OT1N5VsHujMixlSAVqcM6ZJ+1JXf7R
 pw6sSHc/PWVXK2W9eyqT2aF5D+f10icld0Z+uUgX2ByR1y0XvuUwe222I
 OEurwLiry/HZIUS/8Jpoi22H/ta/flW7CzeSwj2XPwCYabd6+5/gJarSF
 ECP7BazS77JbOCpCDHbNsXu/5E7qI4k/i3we8ve+mP9yn8LsscL9VnPzw
 I/q1ctSlarviWI8VXl6PBpp5wyCZdMRwWhMNI3lYZAzoKra3sLoAakbg7
 dEDnJAtnCQYNXXW8owCLJuYAcoG1+spnMZOntKf2pKBm/YG8g76NvoERa A==;
X-CSE-ConnectionGUID: EfBOp0sNSO2gVXTeTYWoOw==
X-CSE-MsgGUID: eNZXKOVVSMmPMrO81JaZxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46873049"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46873049"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:35 -0800
X-CSE-ConnectionGUID: ZHSECrUCT6e6I3f6Ny/m1A==
X-CSE-MsgGUID: h5U6/L3FQFCWMdOLVrBklw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650726"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:32 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 05/10] [DO NOT REVIEW] drm/xe/xe_pmu: add fixes for base PMU
Date: Mon,  6 Jan 2025 13:25:54 +0530
Message-ID: <20250106075600.852080-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
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

DO NOT REVIEW. Patch added for compilation

use pmu format attr and rename pm event.
fix lockdep splat

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 44 +++++++------------------------
 drivers/gpu/drm/xe/xe_pmu_types.h | 16 +++++------
 2 files changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 7e2b9d74a6f3..bae8eb38fddd 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -260,19 +260,13 @@ static u64 get_c6(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	const unsigned int gt_id = gt->info.id;
 	struct xe_pmu *pmu = &xe->pmu;
-	bool device_awake;
 	unsigned long flags;
 	u64 val;
 
-	device_awake = xe_pm_runtime_get_if_active(xe);
-	if (device_awake) {
-		val = xe_gt_idle_residency_msec(&gt->gtidle);
-		xe_pm_runtime_put(xe);
-	}
-
 	raw_spin_lock_irqsave(&pmu->lock, flags);
 
-	if (device_awake) {
+	if (!xe_pm_runtime_suspended(xe)) {
+		val = xe_gt_idle_residency_msec(&gt->gtidle);
 		store_sample(pmu, gt_id, __XE_SAMPLE_C6, val);
 	} else {
 		/*
@@ -376,7 +370,6 @@ frequency_sample(struct xe_gt *gt, unsigned int period_ns)
 	struct xe_device *xe = gt_to_xe(gt);
 	const unsigned int gt_id = gt->info.id;
 	struct xe_pmu *pmu = &xe->pmu;
-	bool device_awake;
 	int ret;
 	u32 cur_freq;
 
@@ -384,8 +377,7 @@ frequency_sample(struct xe_gt *gt, unsigned int period_ns)
 		return;
 
 	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
-	device_awake = xe_pm_runtime_get_if_active(xe);
-	if (!device_awake)
+	if (xe_pm_runtime_suspended(xe))
 		return;
 
 	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
@@ -495,14 +487,11 @@ static void xe_pmu_enable(struct perf_event *event)
 	struct xe_gt *gt;
 	const unsigned int bit = event_bit(event);
 	unsigned long flags;
-	bool device_awake;
 	unsigned int i;
 
 	if (bit == -1)
 		goto update;
 
-	device_awake = xe_pm_runtime_get_if_active(xe);
-
 	raw_spin_lock_irqsave(&pmu->lock, flags);
 
 	/*
@@ -522,10 +511,9 @@ static void xe_pmu_enable(struct perf_event *event)
 	__xe_pmu_maybe_start_timer(pmu);
 
 	/* Set active GTs in case system is not currently suspended */
-	if (device_awake) {
+	if (!xe_pm_runtime_suspended(xe)) {
 		for_each_gt(gt, xe, i)
 			pmu->active_gts |= BIT(gt->info.id);
-		xe_pm_runtime_put(xe);
 	}
 
 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
@@ -626,24 +614,12 @@ struct xe_str_attribute {
 	const char *str;
 };
 
-static ssize_t xe_pmu_format_show(struct device *dev,
-				  struct device_attribute *attr, char *buf)
-{
-	struct xe_str_attribute *eattr;
-
-	eattr = container_of(attr, struct xe_str_attribute, attr);
-	return sprintf(buf, "%s\n", eattr->str);
-}
-
-#define XE_PMU_FORMAT_ATTR(_name, _config) \
-	(&((struct xe_str_attribute[]) { \
-		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
-		.str = _config, } \
-	})[0].attr.attr)
+PMU_FORMAT_ATTR(event,          "config:0-11");
+PMU_FORMAT_ATTR(gt_id,          "config:60-63");
 
 static struct attribute *xe_pmu_format_attrs[] = {
-	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
-	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
+	&format_attr_event.attr,
+	&format_attr_gt_id.attr,
 	NULL,
 };
 
@@ -737,7 +713,7 @@ create_event_attributes(struct xe_pmu *pmu)
 
 	/* Count how many counters we will be exposing. */
 	for (i = 0; i < ARRAY_SIZE(events); i++) {
-		u64 config = __XE_PMU_PM(events[i].counter);
+		u64 config = __XE_PMU_EVENT(events[i].counter);
 
 		if (!config_status(xe, config))
 			count++;
@@ -762,7 +738,7 @@ create_event_attributes(struct xe_pmu *pmu)
 	attr_iter = attr;
 
 	for (i = 0; i < ARRAY_SIZE(events); i++) {
-		u64 config = __XE_PMU_PM(events[i].counter);
+		u64 config = __XE_PMU_EVENT(events[i].counter);
 		char *str;
 
 		if (config_status(xe, config))
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 5d873bae4a0d..0109bb11937b 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -24,17 +24,17 @@ enum {
  */
 #define __XE_PMU_GT_SHIFT (60)
 
-#define ___XE_PMU_PM(gt, x) \
+#define ___XE_PMU_EVENT(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
 
-#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
+#define __XE_PMU_EVENT(x) ___XE_PMU_EVENT(0, x)
 
-#define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
-#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_PM(1)
-#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_PM(2)
-#define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
-#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_PM(gt, 1)
-#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_PM(gt, 2)
+#define XE_PMU_C6_RESIDENCY                    __XE_PMU_EVENT(0)
+#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_EVENT(1)
+#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_EVENT(2)
+#define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_EVENT(gt, 0)
+#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_EVENT(gt, 1)
+#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_EVENT(gt, 2)
 
 /*
  * Non-engine events that we need to track enabled-disabled transition and
-- 
2.47.1

