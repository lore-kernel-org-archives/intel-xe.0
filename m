Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4C6D41C00
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 04:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1290110E683;
	Wed, 13 Nov 2024 04:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAjk4Xrx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D23A10E683
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 04:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731472859; x=1763008859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IUXQCxyo3E1T9/uKYIDDzpIEo+gBDDIrQgRvvTspGmo=;
 b=KAjk4Xrxl9lekOD8PxNRxX+H3yqBCN9DK2rfNXGCYJf8lbXP9krzkhlI
 bkqcwVNeQ1k86J+AcV4n6H9clSY5ol7GX8P54S3AlGa0Wbe+4EwP1gnZY
 Dz3dYnpiVWEF2nzCoBCIDyRv3i7v5aL7JFOXWlJ4BatJSBw5iDSBOwiEg
 o3JYGX7BcmkMwAmJ6SR93xNJKcvpV+9Etr5WEdGE9GoUgNSEgP+z0InvD
 pyhqtfG/ZUBAn69UkYmNNQaBalq68gq5R73mYWczlJ2cTOOkK1W1p1wfl
 d/uvoQ+Vmqs80h8FssWWrZTSNqatHUhkbmLRQaTknwK43rmBmv+rdIQTy A==;
X-CSE-ConnectionGUID: mp4zJt8zQe6UjRqAexYWqg==
X-CSE-MsgGUID: nk7OZJ91ReK3Mor7ty91sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30742209"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30742209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:59 -0800
X-CSE-ConnectionGUID: aMDZE7qER0Wc1b6+5JEGww==
X-CSE-MsgGUID: fXg6s1+hTEKHzGXZ0jQiqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87489531"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:56 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH 7/7] drm/xe/pmu: Add PMU support for engine busyness
Date: Wed, 13 Nov 2024 10:25:49 +0530
Message-Id: <20241113045549.2390980-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241113045549.2390980-1-riana.tauro@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
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

PMU provides two counters (<engine>-busy-ticks-gt<n>,
<engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
engine busyness, user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

To list engine busyness counters use the following

./perf list
  xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
  xe_0000_03_00.0/bcs0-total-ticks-gt0/              [Kernel PMU event]
  xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
  xe_0000_03_00.0/ccs0-total-ticks-gt0/              [Kernel PMU event]

Engine busyness can then be calculated as below
busyness % = (engine active ticks/total ticks) * 100

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c       | 187 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pmu_types.h |  17 +++
 drivers/gpu/drm/xe/xe_uc.c        |   3 +
 4 files changed, 192 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index df1ba94cf4ca..7f0425b41f06 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -17,6 +17,7 @@
 #include "regs/xe_irq_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_engine_activity.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
@@ -418,6 +419,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_engine_activity_init(guc);
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 633552fbf78d..9a657c6bb93e 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -9,10 +9,13 @@
 
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
+#include "xe_engine_activity.h"
 #include "xe_force_wake.h"
+#include "xe_gt.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_pc.h"
+#include "xe_hw_engine.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
 #include "xe_module.h"
@@ -30,7 +33,7 @@ static unsigned int xe_pmu_target_cpu = -1;
 /**
  * DOC: Xe PMU (Performance Monitoring Unit)
  *
- * Expose events/counters like C6 residency and GT frequency to user land.
+ * Expose events/counters like C6 residency, GT frequency and engine busyness to user land.
  * Perf tool can be used to list these counters from the command line.
  *
  * Example commands to list/record supported perf events-
@@ -88,6 +91,13 @@ static unsigned int xe_pmu_target_cpu = -1;
  *    1950
  *    1950
  *    1950
+ *
+ * Engine busyness: PMU provides two counters (<engine>-busy-ticks-gt<n>,
+ * <engine>-total-ticks-gt<n>) to calculate engine busyness. When querying engine busyness, user
+ * must group these 2 counters using the perf_event group mechanism to ensure both counters are
+ * sampled together. Engine busyness can then be calculated using
+ *
+ *  busyness % = (engine active ticks/total ticks) * 100
  */
 
 static struct xe_pmu *event_to_pmu(struct perf_event *event)
@@ -105,6 +115,64 @@ static u64 config_counter(const u64 config)
 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
 }
 
+static u8 engine_event_sample(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return (config_counter(config) >> XE_PMU_SAMPLE_SHIFT) & 0xf;
+}
+
+static u8 engine_event_class(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return (config_counter(config) >> XE_PMU_CLASS_SHIFT) & 0xff;
+}
+
+static u8 engine_event_instance(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return (config_counter(config) >> XE_PMU_INSTANCE_SHIFT) & 0xff;
+}
+
+static bool is_engine_event(struct perf_event *event)
+{
+	return config_counter(event->attr.config) > __XE_PMU_OTHER(0xff);
+}
+
+static int engine_event_status(u8 sample)
+{
+	switch (sample) {
+	case XE_PMU_SAMPLE_BUSY_TICKS:
+	case XE_PMU_SAMPLE_TOTAL_TICKS:
+		return 0;
+	default:
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int engine_event_init(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	const u64 config = event->attr.config;
+	const unsigned int gt_id = config_gt_id(config);
+	struct drm_xe_engine_class_instance eci;
+	struct xe_hw_engine *hwe;
+
+	eci.engine_class = engine_event_class(event);
+	eci.engine_instance = engine_event_instance(event);
+	eci.gt_id = gt_id;
+
+	hwe = xe_hw_engine_lookup(xe, eci);
+	if (!hwe)
+		return -ENOENT;
+
+	return engine_event_status(engine_event_sample(event));
+}
+
 static unsigned int other_bit(const u64 config)
 {
 	unsigned int val;
@@ -217,7 +285,11 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
 		return -EINVAL;
 
-	ret = config_status(xe, event->attr.config);
+	if (is_engine_event(event))
+		ret = engine_event_init(event);
+	else
+		ret = config_status(xe, event->attr.config);
+
 	if (ret)
 		return ret;
 
@@ -300,26 +372,54 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	const unsigned int gt_id = config_gt_id(event->attr.config);
 	const u64 config = event->attr.config;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	bool device_awake;
 	u64 val = 0;
 
-	switch (config_counter(config)) {
-	case XE_PMU_RC6_RESIDENCY:
-		val = get_rc6(gt);
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
+	if (is_engine_event(event)) {
+		u8 sample = engine_event_sample(event);
+		struct drm_xe_engine_class_instance eci;
+		struct xe_hw_engine *hwe;
+
+		eci.engine_class = engine_event_class(event);
+		eci.engine_instance = engine_event_instance(event);
+		eci.gt_id = gt_id;
+
+		hwe = xe_hw_engine_lookup(xe, eci);
+
+		device_awake = xe_pm_runtime_get_if_active(xe);
+		if (!device_awake)
+			return 0;
+
+		if (!hwe)
+			drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
+		else if (sample == XE_PMU_SAMPLE_BUSY_TICKS)
+			val = xe_engine_activity_get_active_ticks(hwe);
+		else if (sample == XE_PMU_SAMPLE_TOTAL_TICKS)
+			val = xe_engine_activity_get_total_ticks(hwe);
+		else
+			drm_warn(&xe->drm, "unknown pmu engine event\n");
+
+		xe_pm_runtime_put(xe);
+	} else {
+		switch (config_counter(config)) {
+		case XE_PMU_RC6_RESIDENCY:
+			val = get_rc6(gt);
+			break;
+		case XE_PMU_ACTUAL_FREQUENCY:
+			val =
+			    div_u64(read_sample(pmu, gt_id,
+						__XE_SAMPLE_FREQ_ACT),
+						USEC_PER_SEC /* to MHz */);
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
@@ -643,6 +743,12 @@ static const struct attribute_group xe_pmu_cpumask_attr_group = {
 	.unit = (__unit), \
 }
 
+#define __engine_event(__sample, __name) \
+{ \
+	.sample = (__sample), \
+	.name = (__name), \
+}
+
 static struct xe_ext_attribute *
 add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
 {
@@ -682,9 +788,19 @@ create_event_attributes(struct xe_pmu *pmu)
 		__event(2, "requested-frequency", "M"),
 	};
 
+	static const struct {
+		u8 sample;
+		char *name;
+	} engine_events[] = {
+		__engine_event(XE_PMU_SAMPLE_BUSY_TICKS, "busy-ticks"),
+		__engine_event(XE_PMU_SAMPLE_TOTAL_TICKS, "total-ticks")
+	};
+
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
 	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
 	struct attribute **attr = NULL, **attr_iter;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 	unsigned int count = 0;
 	unsigned int i, j;
 	struct xe_gt *gt;
@@ -699,6 +815,13 @@ create_event_attributes(struct xe_pmu *pmu)
 		}
 	}
 
+	for_each_gt(gt, xe, j) {
+		for_each_hw_engine(hwe, gt, id)
+			for (i = 0; i < ARRAY_SIZE(engine_events); i++)
+				if (!engine_event_status(engine_events[i].sample))
+					count++;
+	}
+
 	/* Allocate attribute objects and table. */
 	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
 	if (!xe_attr)
@@ -744,6 +867,30 @@ create_event_attributes(struct xe_pmu *pmu)
 							events[i].unit);
 			}
 		}
+
+		for_each_hw_engine(hwe, gt, id) {
+			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
+				char *str;
+
+				if (engine_event_status(engine_events[i].sample))
+					continue;
+
+				str = kasprintf(GFP_KERNEL, "%s%d-%s-gt%u",
+						xe_hw_engine_class_to_str(hwe->class),
+						hwe->logical_instance,
+						engine_events[i].name, j);
+				if (!str)
+					goto err;
+
+				*attr_iter++ = &xe_iter->attr.attr;
+				xe_iter = add_xe_attr
+					(xe_iter, str,
+					 XE_PMU_ENGINE(j, xe_hw_engine_to_user_class(hwe->class),
+						       hwe->logical_instance,
+						       engine_events[i].sample));
+			}
+		}
+
 	}
 
 	pmu->xe_attr = xe_attr;
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index c44c3d79b970..508cc8e43fbe 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -36,6 +36,23 @@ enum {
 #define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_OTHER(gt, 1)
 #define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_OTHER(gt, 2)
 
+#define XE_PMU_SAMPLE_BUSY_TICKS	(1)
+#define XE_PMU_SAMPLE_TOTAL_TICKS	(2)
+
+/* First 8 bits of config are reserved for other counters */
+#define XE_PMU_SAMPLE_SHIFT			(8)
+#define XE_PMU_SAMPLE_BITS			(4)
+#define XE_PMU_INSTANCE_BITS			(8)
+#define XE_PMU_INSTANCE_SHIFT \
+	(XE_PMU_SAMPLE_SHIFT + XE_PMU_SAMPLE_BITS)
+#define XE_PMU_CLASS_SHIFT \
+	(XE_PMU_INSTANCE_SHIFT + XE_PMU_INSTANCE_BITS)
+
+#define XE_PMU_ENGINE(gt, class, instance, sample) \
+	(((class) << XE_PMU_CLASS_SHIFT | \
+	(instance) << XE_PMU_INSTANCE_SHIFT | \
+	(sample) << XE_PMU_SAMPLE_SHIFT) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+
 /**
  * Non-engine events that we need to track enabled-disabled transition and
  * current state.
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..e50d23d53921 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -7,6 +7,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_engine_activity.h"
 #include "xe_gsc.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
@@ -210,6 +211,8 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
+	xe_engine_activity_enable_stats(&uc->guc);
+
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
 	xe_gt_assert(uc_to_gt(uc), !ret);
-- 
2.40.0

