Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0160E77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F70810E5A4;
	Mon,  6 Jan 2025 07:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGrCF7Z2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7110E5A4
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736149009; x=1767685009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BtHD5YSzO7Lehh1aMqlWeHWD0A9m2Qq3gtmp3XtR0rA=;
 b=JGrCF7Z2AwHfDA9ZMBcpzENm9STiJ8cT0Y5ZY51AOyTewRuKDzcdpZLp
 +55wLT+GMuGW48Cqvb31w0ZCFYe31t+PfLUNVoS4uUPIzo3f9LYSn5Caj
 4TjIG4D/dCVA1eH5KbiRYwOPp4Qs/DLUvsu67NoT/hHZwzshOMz/ztO5K
 5WKNUI3uftr2IpB+/UNeGRJmcsUOp09T434N7H1dIaTHH9ArNQxQH9v8B
 A4lc4EA9jE888A/QRePC071dEje3xZFympKyDPxf8fZyn9YVsE40HUav9
 A1QP7relHgi1AKacxhxq2tDlpbQMeyE63CMByGMRtVE/dhBdFyi+Gqtd6 Q==;
X-CSE-ConnectionGUID: /D10fe3bTN+GuxfaIetNew==
X-CSE-MsgGUID: VP5S2YZSTFW22/ghdyG12g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46873087"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46873087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:49 -0800
X-CSE-ConnectionGUID: h7oNBfCNSGOW9geCbcGmrw==
X-CSE-MsgGUID: 61LOJy7yRtqJVVXaqWt3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650804"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:45 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 09/10] drm/xe/pmu: Add PMU support for per-engine-class
 activity
Date: Mon,  6 Jan 2025 13:25:58 +0530
Message-ID: <20250106075600.852080-10-riana.tauro@intel.com>
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

PMU provides two counters (engine-active-ticks, total-ticks)
to calculate engine acitivity. When querying engine busyness,
user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

To list the events

	./perf list
	  xe_0000_03_00.0/engine-active-ticks/		[Kernel PMU event]
	  xe_0000_03_00.0/total-ticks/			[Kernel PMU event]

The formats to be used with the above are

	engine_class	- config:12-19
	engine_instance	- config:20-27
	gt_id		- config:60-63

The events can then be read using perf tool

./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,
			       engine_class=0,engine_instance=0/,
	       xe_0000_03_00.0/total-ticks,gt_id=0,
			       engine_class=0,engine_instance=0/ -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/total ticks) * 100

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c       |   5 ++
 drivers/gpu/drm/xe/xe_pmu.c       | 139 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pmu_types.h |   7 ++
 drivers/gpu/drm/xe/xe_uc.c        |   3 +
 4 files changed, 131 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 408365dfe4ee..f229745b78b9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -26,6 +26,7 @@
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
@@ -743,6 +744,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_guc_engine_activity_init(guc);
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index bae8eb38fddd..5bd312b6b8f6 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -12,7 +12,9 @@
 #include "xe_force_wake.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_idle.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_guc_pc.h"
+#include "xe_hw_engine.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
 #include "xe_module.h"
@@ -90,6 +92,17 @@ static unsigned int xe_pmu_target_cpu = -1;
  *    1950
  *    1950
  *    1950
+ *
+ * Engine Activity: PMU provides two counters (engine-active-ticks, total-ticks) to calculate
+ * engine activity. While querying the engine activity the user should group these two counters
+ * using the perf_event group mechanism to ensure both counters are sampled together.
+ *
+ * To read a engine specific event for a GT of class 1 and instance 0
+ *
+ * perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,engine_class=1,engine_instance=0/,
+ *		xe_0000_03_00.0/total-ticks,gt_id=0,engine_class=1,engine_instance=0/ -I 1000
+ *
+ * engine active % = (engine active ticks/total ticks) * 100
  */
 
 static struct xe_pmu *event_to_pmu(struct perf_event *event)
@@ -107,6 +120,33 @@ static u64 config_counter(const u64 config)
 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
 }
 
+static u64 engine_event_sample(const u64 config)
+{
+	return config_counter(config) & 0xfff;
+}
+
+static u8 engine_event_class(const u64 config)
+{
+	return (config_counter(config) >> XE_PMU_CLASS_SHIFT) & 0xff;
+}
+
+static u8 engine_event_instance(const u64 config)
+{
+	return (config_counter(config) >> XE_PMU_INSTANCE_SHIFT) & 0xff;
+}
+
+static bool is_engine_event(struct xe_device *xe, const u64 config)
+{
+	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	u64 sample = engine_event_sample(config);
+
+	if (!xe_guc_engine_activity_supported(&gt->uc.guc))
+		return false;
+
+	return ((sample == XE_PMU_ENGINE_ACTIVITY_TICKS) || (sample == XE_PMU_TOTAL_TICKS));
+}
+
 static unsigned int pm_bit(const u64 config)
 {
 	unsigned int val;
@@ -192,6 +232,23 @@ config_status(struct xe_device *xe, u64 config)
 	return 0;
 }
 
+static int engine_event_init(struct xe_device *xe, u64 config)
+{
+	const unsigned int gt_id = config_gt_id(config);
+	struct drm_xe_engine_class_instance eci;
+	struct xe_hw_engine *hwe;
+
+	eci.engine_class = engine_event_class(config);
+	eci.engine_instance = engine_event_instance(config);
+	eci.gt_id = gt_id;
+
+	hwe = xe_hw_engine_lookup(xe, eci);
+	if (!hwe || xe_hw_engine_is_reserved(hwe))
+		return -ENOENT;
+
+	return 0;
+}
+
 static int xe_pmu_event_init(struct perf_event *event)
 {
 	struct xe_device *xe =
@@ -221,7 +278,12 @@ static int xe_pmu_event_init(struct perf_event *event)
 		return -EINVAL;
 
 	event_config = event->attr.config;
-	ret = config_status(xe, event_config);
+
+	if (is_engine_event(xe, event_config))
+		ret = engine_event_init(xe, event_config);
+	else
+		ret = config_status(xe, event_config);
+
 	if (ret)
 		return ret;
 
@@ -300,24 +362,49 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
 	u64 val = 0;
 
-	switch (config_counter(config)) {
-	case XE_PMU_C6_RESIDENCY:
-		val = get_c6(gt);
-		break;
-	case XE_PMU_ACTUAL_FREQUENCY:
-		val =
-		   div_u64(read_sample(pmu, gt_id,
-				       __XE_SAMPLE_FREQ_ACT),
-			   USEC_PER_SEC /* to MHz */);
-		break;
-	case XE_PMU_REQUESTED_FREQUENCY:
-		val =
-		   div_u64(read_sample(pmu, gt_id,
-				       __XE_SAMPLE_FREQ_REQ),
-			   USEC_PER_SEC /* to MHz */);
-		break;
-	default:
-		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
+	if (is_engine_event(xe, config)) {
+		struct drm_xe_engine_class_instance eci;
+		struct xe_hw_engine *hwe;
+		u64 sample = engine_event_sample(config);
+
+		eci.engine_class = engine_event_class(config);
+		eci.engine_instance = engine_event_instance(config);
+		eci.gt_id = gt_id;
+
+		hwe = xe_hw_engine_lookup(xe, eci);
+		if (!hwe)
+			drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
+
+		if (xe_pm_runtime_suspended(xe))
+			return 0;
+
+		if (sample == XE_PMU_ENGINE_ACTIVITY_TICKS)
+			val = xe_guc_engine_activity_active_ticks(hwe);
+		else if (sample == XE_PMU_TOTAL_TICKS)
+			val = xe_guc_engine_activity_total_ticks(hwe);
+		else
+			drm_warn(&xe->drm, "unknown pmu engine event\n");
+
+	} else {
+		switch (config_counter(config)) {
+		case XE_PMU_C6_RESIDENCY:
+			val = get_c6(gt);
+			break;
+		case XE_PMU_ACTUAL_FREQUENCY:
+			val =
+			   div_u64(read_sample(pmu, gt_id,
+					       __XE_SAMPLE_FREQ_ACT),
+				   USEC_PER_SEC /* to MHz */);
+			break;
+		case XE_PMU_REQUESTED_FREQUENCY:
+			val =
+			   div_u64(read_sample(pmu, gt_id,
+					       __XE_SAMPLE_FREQ_REQ),
+				   USEC_PER_SEC /* to MHz */);
+			break;
+		default:
+			drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
+		}
 	}
 
 	return val;
@@ -614,11 +701,15 @@ struct xe_str_attribute {
 	const char *str;
 };
 
-PMU_FORMAT_ATTR(event,          "config:0-11");
-PMU_FORMAT_ATTR(gt_id,          "config:60-63");
+PMU_FORMAT_ATTR(event,           "config:0-11");
+PMU_FORMAT_ATTR(engine_instance, "config:12-19");
+PMU_FORMAT_ATTR(engine_class,	 "config:20-27");
+PMU_FORMAT_ATTR(gt_id,           "config:60-63");
 
 static struct attribute *xe_pmu_format_attrs[] = {
 	&format_attr_event.attr,
+	&format_attr_engine_class.attr,
+	&format_attr_engine_instance.attr,
 	&format_attr_gt_id.attr,
 	NULL,
 };
@@ -703,6 +794,8 @@ create_event_attributes(struct xe_pmu *pmu)
 		__event(0, "c6-residency", "ms"),
 		__event(1, "actual-frequency", "M"),
 		__event(2, "requested-frequency", "M"),
+		__event(XE_PMU_ENGINE_ACTIVITY_TICKS, "engine-active-ticks", NULL),
+		__event(XE_PMU_TOTAL_TICKS, "total-ticks", NULL),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -715,7 +808,7 @@ create_event_attributes(struct xe_pmu *pmu)
 	for (i = 0; i < ARRAY_SIZE(events); i++) {
 		u64 config = __XE_PMU_EVENT(events[i].counter);
 
-		if (!config_status(xe, config))
+		if (!config_status(xe, config) || is_engine_event(xe, config))
 			count++;
 	}
 
@@ -741,7 +834,7 @@ create_event_attributes(struct xe_pmu *pmu)
 		u64 config = __XE_PMU_EVENT(events[i].counter);
 		char *str;
 
-		if (config_status(xe, config))
+		if (config_status(xe, config) && !is_engine_event(xe, config))
 			continue;
 
 		str = kasprintf(GFP_KERNEL, "%s",
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 0109bb11937b..bb27d0950b72 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -19,6 +19,11 @@ enum {
 
 #define XE_PMU_MAX_GT 2
 
+/* First 8 bits of config are reserved for other counters */
+#define XE_PMU_INSTANCE_SHIFT                  (12)
+#define XE_PMU_INSTANCE_BITS                   (8)
+#define XE_PMU_CLASS_SHIFT \
+	(XE_PMU_INSTANCE_SHIFT + XE_PMU_INSTANCE_BITS)
 /*
  * Top bits of every counter are GT id.
  */
@@ -32,6 +37,8 @@ enum {
 #define XE_PMU_C6_RESIDENCY                    __XE_PMU_EVENT(0)
 #define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_EVENT(1)
 #define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_EVENT(2)
+#define XE_PMU_ENGINE_ACTIVITY_TICKS		__XE_PMU_EVENT(3)
+#define XE_PMU_TOTAL_TICKS			__XE_PMU_EVENT(4)
 #define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_EVENT(gt, 0)
 #define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_EVENT(gt, 1)
 #define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_EVENT(gt, 2)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..d129bdeaed57 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -13,6 +13,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_guc_pc.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
@@ -210,6 +211,8 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
+	xe_guc_engine_activity_enable_stats(&uc->guc);
+
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
 	xe_gt_assert(uc_to_gt(uc), !ret);
-- 
2.47.1

