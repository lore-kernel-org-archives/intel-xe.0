Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29967C4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738410E92D;
	Thu, 14 Dec 2023 11:24:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4412910E92D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553084; x=1734089084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GM77FgMZ676E7TuhBmJbQm8qGlahXmoZMpgJWN+psy4=;
 b=l+9ZFDvkLqjkWYXVs2PbKVzgL3lYXFFn7Xkklid0XvqliHjCVJa+PjiF
 2gWAJBmkUvqollHRTTpKWxKq/LvS7ouwRUaaZHozcxxCG8ztC3kNdx5q1
 jRRTsqhBXoAKDr+J1EvnqDfmrxjghzJQCz9oml4t2tHHRQiHJ/n6hhGIG
 HTqqPz/7XDu0ET+7SOjRwLn7tV9oO/iGDQqggYCU28xLyh+vYTEQVbKC/
 3Ipgg+ttio7cYiLcatOF3IK2MqqyP1F708aVDtkQnIV3/7ovjx/PvRcrN
 kU1jyWfRrru1BConQStYnChWE7ZzEC+uPchjbFGu5NTZWixUbbPCdL4DT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940175"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714179"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:41 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 07/10] RFC drm/xe/guc: Add PMU counter for total active
 ticks
Date: Thu, 14 Dec 2023 17:01:41 +0530
Message-Id: <20231214113144.251726-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
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

GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks. These counters are maintained in a
shared memory buffer and internally updated on a continuous basis.

GuC also provides a periodically total active ticks that GT has been
active for. This counter is exposed to the user such that busyness can
be calculated as a percentage using

busyness % = (engine active ticks/total active ticks) * 100.

This patch provides a pmu counter for total active ticks.

This is listed by perf tool as

sudo ./perf list
	  xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]

and can be read using

sudo ./perf stat -e xe_0000_03_00.0/total-active-ticks-gt0/ -I 1000
        time 	    counts  unit 	events
    1.001332764    58942964    xe_0000_03_00.0/total-active-ticks-gt0/
    2.011421147	   21191869    xe_0000_03_00.0/total-active-ticks-gt0/
    3.013223865	   19269012    xe_0000_03_00.0/total-active-ticks-gt0/

Co-developed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
 drivers/gpu/drm/xe/xe_gt.h                  |  2 +-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 71 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
 drivers/gpu/drm/xe/xe_pmu.c                 | 74 +++++++++++++++++++--
 include/uapi/drm/xe_drm.h                   | 20 ++++++
 6 files changed, 160 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9c84afb00f7b..0e131b699a54 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -807,3 +807,14 @@ u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
 {
 	return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
 }
+
+/**
+ * xe_gt_total_active_ticks - Return total active ticks
+ * @gt: GT structure
+ *
+ * Returns total active ticks that the GT was active for.
+ */
+u64 xe_gt_total_active_ticks(struct xe_gt *gt)
+{
+	return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5b4309310126..7e7828b12acd 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,7 +43,7 @@ void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
 u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
-
+u64 xe_gt_total_active_ticks(struct xe_gt *gt);
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
  * first that matches the same reset domain as @class
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 287429e31e6c..4c24f51f2fa3 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -20,53 +20,83 @@
  * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
  * a caveat that is not real time, best effort only).
  *
+ * In addition to the engine busyness ticks, there is also a total time count which
+ * is a free running GT timestamp counter.
+ *
+ * Note that counters should be used as ratios of each other for calculating a
+ * percentage.
+ *
  * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
+ * total active ticks (ticks_gt)	: total clock ticks
+ *
+ * engine busyness % = (ticks_engine / ticks_gt) * 100
  */
 
 static void guc_engine_busyness_usage_map(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
-					  struct iosys_map *engine_map)
+					  struct iosys_map *engine_map,
+					  struct iosys_map *global_map)
 {
 	struct iosys_map *map;
 	size_t offset;
 	u32 instance;
 	u8 guc_class;
 
-	guc_class = xe_engine_class_to_guc_class(hwe->class);
-	instance = hwe->logical_instance;
+	if (hwe) {
+		guc_class = xe_engine_class_to_guc_class(hwe->class);
+		instance = hwe->logical_instance;
+	}
 
 	map = &guc->busy.bo->vmap;
 
-	offset = offsetof(struct guc_engine_observation_data,
-			  engine_data[guc_class][instance]);
+	if (hwe) {
+		offset = offsetof(struct guc_engine_observation_data,
+				  engine_data[guc_class][instance]);
+		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+	}
 
-	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+	*global_map = IOSYS_MAP_INIT_OFFSET(map, 0);
 }
 
 static void guc_engine_busyness_get_usage(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
-					  u64 *_ticks_engine)
+					  u64 *_ticks_engine,
+					  u64 *_ticks_gt)
 {
-	struct iosys_map engine_map;
-	u64 ticks_engine = 0;
+	struct iosys_map engine_map, global_map;
+	u64 ticks_engine = 0, ticks_gt = 0;
 	int i = 0;
 
-	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
+	guc_engine_busyness_usage_map(guc, hwe, &engine_map, &global_map);
 
 #define read_engine_usage(map_, field_) \
 	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
 
+#define read_global_field(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
+
 	do {
-		ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
+		if (hwe)
+			ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
+
+		ticks_gt = read_global_field(&global_map, gt_timestamp);
 
-		if (read_engine_usage(&engine_map, total_execution_ticks) == ticks_engine)
+		if (hwe && read_engine_usage(&engine_map, total_execution_ticks) != ticks_engine)
+			continue;
+
+		if (read_global_field(&global_map, gt_timestamp) == ticks_gt)
 			break;
+
 	} while (++i < 6);
 
 #undef read_engine_usage
+#undef read_global_field
 
 	if (_ticks_engine)
 		*_ticks_engine = ticks_engine;
+
+	if (_ticks_gt)
+		*_ticks_gt = ticks_gt;
 }
 
 static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
@@ -92,6 +122,21 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(guc->busy.bo);
 }
 
+/*
+ * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
+ * @guc: The GuC object
+ *
+ * Returns total active ticks that the GT has been running for.
+ */
+u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
+{
+	u64 ticks_gt;
+
+	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
+
+	return ticks_gt;
+}
+
 /*
  * xe_guc_engine_busyness_ticks - Gets current accumulated
  *				  engine busyness ticks
@@ -104,7 +149,7 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
 	u64 ticks_engine;
 
-	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
+	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
 
 	return ticks_engine;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
index d70f06209896..57325910ebc4 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -12,6 +12,7 @@ struct xe_hw_engine;
 struct xe_guc;
 
 int xe_guc_engine_busyness_init(struct xe_guc *guc);
+u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 5e2ad4badaed..74212d8c5434 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -51,6 +51,20 @@ static bool is_engine_event(struct perf_event *event)
 	return config_counter(event->attr.config) < __DRM_XE_PMU_OTHER(0, 0);
 }
 
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int gt_id = config_gt_id(config);
+
+	if (gt_id >= XE_PMU_MAX_GT)
+		return -ENOENT;
+
+	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
+		return 0;
+
+	return -ENOENT;
+}
+
 static int engine_event_status(struct xe_hw_engine *hwe,
 			       enum drm_xe_pmu_engine_sample sample)
 {
@@ -113,11 +127,13 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
 		return -EINVAL;
 
-	if (is_engine_event(event)) {
+	if (is_engine_event(event))
 		ret = engine_event_init(event);
-		if (ret)
-			return ret;
-	}
+	else
+		ret = config_status(xe, event->attr.config);
+
+	if (ret)
+		return ret;
 
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
@@ -131,7 +147,8 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
 		container_of(event->pmu, typeof(*xe), pmu.base);
-	const unsigned int gt_id = config_gt_id(event->attr.config);
+	u64 config = event->attr.config;
+	const unsigned int gt_id = config_gt_id(config);
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
 	u64 val;
 
@@ -147,6 +164,11 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 			val = xe_gt_engine_busy_ticks(gt, hwe);
 		else
 			drm_warn(&xe->drm, "unknown pmu engine event\n");
+	} else {
+		if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
+			val = xe_gt_total_active_ticks(gt);
+		else
+			drm_warn(&xe->drm, "unknown pmu event\n");
 	}
 
 	return val;
@@ -256,6 +278,12 @@ static const struct attribute_group xe_pmu_cpumask_attr_group = {
 	.attrs = xe_cpumask_attrs,
 };
 
+#define __event(__counter, __name) \
+{ \
+	.counter = (__counter), \
+	.name = (__name), \
+}
+
 #define __engine_event(__sample, __name) \
 { \
 	.sample = (__sample), \
@@ -293,6 +321,23 @@ create_event_attributes(struct xe_pmu *pmu)
 		__engine_event(DRM_XE_PMU_SAMPLE_BUSY_TICKS, "busy-ticks"),
 	};
 
+	static const struct {
+		unsigned int counter;
+		const char *name;
+	} events[] = {
+		__event(0, "total-active-ticks"),
+	};
+
+	/* Count how many counters we will be exposing. */
+	for_each_gt(gt, xe, j) {
+		for (i = 0; i < ARRAY_SIZE(events); i++) {
+			u64 config = __DRM_XE_PMU_OTHER(j, events[i].counter);
+
+			if (!config_status(xe, config))
+				count++;
+		}
+	}
+
 	for_each_gt(gt, xe, j) {
 		for_each_hw_engine(hwe, gt, id) {
 			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
@@ -315,6 +360,25 @@ create_event_attributes(struct xe_pmu *pmu)
 	xe_iter = xe_attr;
 	attr_iter = attr;
 
+	/* Initialize supported non-engine counters */
+	for_each_gt(gt, xe, j) {
+		for (i = 0; i < ARRAY_SIZE(events); i++) {
+			u64 config = __DRM_XE_PMU_OTHER(j, events[i].counter);
+			char *str;
+
+			if (config_status(xe, config))
+				continue;
+
+			str = kasprintf(GFP_KERNEL, "%s-gt%u",
+					events[i].name, j);
+			if (!str)
+				goto err;
+
+			*attr_iter++ = &xe_iter->attr.attr;
+			xe_iter = add_xe_attr(xe_iter, str, config);
+		}
+	}
+
 	/* Initialize supported engine counters */
 	for_each_gt(gt, xe, j) {
 		for_each_hw_engine(hwe, gt, id) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 58ab3e414c87..cee89ebdafe9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1088,7 +1088,25 @@ struct drm_xe_wait_user_fence {
  * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
  * particular event.
  *
+ * For example to open the DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
+ *
+ * .. code-block:: C
+ *
+ *     struct perf_event_attr attr;
+ *     long long count;
+ *     int cpu = 0;
+ *     int fd;
+ *
+ *     memset(&attr, 0, sizeof(struct perf_event_attr));
+ *     attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_03_00.0/type
+ *     attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
+ *     attr.use_clockid = 1;
+ *     attr.clockid = CLOCK_MONOTONIC;
+ *     attr.config = DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0);
+ *
+ *     fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
+
 enum drm_xe_pmu_engine_sample {
 	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
 };
@@ -1114,6 +1132,8 @@ enum drm_xe_pmu_engine_sample {
 #define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
 	__DRM_XE_PMU_ENGINE(gt, class, instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS)
 
+#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	__DRM_XE_PMU_OTHER(gt, 0)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.40.0

