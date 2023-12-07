Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6233AC10F04
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B8C10E8A4;
	Thu,  7 Dec 2023 12:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7789110E8A4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953456; x=1733489456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3SChOWN04FpWBTVKKeWhjdi6i5BK5zKI4oKt5R6zKqM=;
 b=iJoAzAipn8jGPx+01AkUR+YgoHvYuJzIaGqADqJSkqnFAPtd/42htxpm
 wmwtyOJXmRpfBQoKMSko94cLxMrydjpyef37CIT11l/JGJgmyT9SxRk6d
 9nvgLKvap/txIO525NglpQL/6F93JbSpZ/saLSLXOPQwuTMg38l+Mgkw7
 Qm5HQg4Eovzjk7SRGXiCzlCm7jqnVHnVmNQNXKfjFwqcvbBbXuP6o2lXM
 WajCcplY7/Xb6jGKE/I+iHm8OyXyWR1UiRFqheqtZgVcNvJqeIaGUjsn2
 sYsMoXw4PA0U8am4oF2V7xmy5qH3KiKHacL8GkZVbL3k+abzH8kXfCWwM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1051385"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1051385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19692720"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:54 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/8] RFC drm/xe/pmu: Add PMU counters for engine busy ticks
Date: Thu,  7 Dec 2023 18:28:00 +0530
Message-Id: <20231207125802.3730165-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231207125802.3730165-1-riana.tauro@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
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
active for. These counter is exposed to the user such that busyness can
be calculated as a percentage using

busyness % = (engine active ticks/total active ticks) * 100.

Expose busy-ticks for each engine as a PMU counter.

This is listed by perf tool as

  sudo ./perf list
     xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/rcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vecs0-busy-ticks-gt0/              [Kernel PMU event]

and read as

  sudo ./perf stat -e xe_0000_03_00.0/bcs0-busy-ticks-gt0/  -I 1000
           time       counts unit       events
       1.000674178     2052       xe_0000_03_00.0/bcs0-busy-ticks-gt0/
       2.006626312     2033       xe_0000_03_00.0/bcs0-busy-ticks-gt0/
       3.009499300    40067       xe_0000_03_00.0/bcs0-busy-ticks-gt0/
       4.010521486     8491       xe_0000_03_00.0/bcs0-busy-ticks-gt0/

v2: rebase

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 152 ++++++++++++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 855cd7b3edb3..fa926e17ef6a 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -13,6 +13,8 @@
 #include "xe_gt_clock.h"
 #include "xe_mmio.h"
 
+#define XE_ENGINE_SAMPLE_COUNT (DRM_XE_PMU_SAMPLE_BUSY_TICKS + 1)
+
 static cpumask_t xe_pmu_cpumask;
 static unsigned int xe_pmu_target_cpu = -1;
 
@@ -26,6 +28,35 @@ static u64 config_counter(const u64 config)
 	return config & ~(~0ULL << __DRM_XE_PMU_GT_SHIFT);
 }
 
+static u8 engine_event_sample(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return (config - __DRM_XE_PMU_ENGINE_OFFSET(config_gt_id(config)))
+		& 0xf;
+}
+
+static u8 engine_event_class(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return ((config - __DRM_XE_PMU_ENGINE_OFFSET(config_gt_id(config)))
+		>> __DRM_XE_PMU_CLASS_SHIFT) & 0xff;
+}
+
+static u8 engine_event_instance(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return ((config - __DRM_XE_PMU_ENGINE_OFFSET(config_gt_id(config)))
+		>> __DRM_XE_PMU_SAMPLE_BITS) & 0xff;
+}
+
+static bool is_engine_event(struct perf_event *event)
+{
+	return config_counter(event->attr.config) >= __DRM_XE_PMU_ENGINE_OFFSET(0);
+}
+
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe =
@@ -134,6 +165,31 @@ config_status(struct xe_device *xe, u64 config)
 	return 0;
 }
 
+static int engine_event_status(struct xe_hw_engine *hwe,
+			       enum drm_xe_pmu_engine_sample sample)
+{
+	if (!hwe)
+		return -ENODEV;
+
+	/* Other engine events will be added, XE_ENGINE_SAMPLE_COUNT will be changed */
+	return (sample >= DRM_XE_PMU_SAMPLE_BUSY_TICKS && sample < XE_ENGINE_SAMPLE_COUNT)
+		? 0 : -ENOENT;
+}
+
+static int engine_event_init(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	const u64 config = event->attr.config;
+	const unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_hw_engine *hwe;
+
+	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(engine_event_class(event)),
+			      engine_event_instance(event), true);
+
+	return engine_event_status(hwe, engine_event_sample(event));
+}
+
 static int xe_pmu_event_init(struct perf_event *event)
 {
 	struct xe_device *xe =
@@ -161,7 +217,10 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
 		return -EINVAL;
 
-	ret = config_status(xe, event->attr.config);
+	if (is_engine_event(event))
+		ret = engine_event_init(event);
+	else
+		ret = config_status(xe, event->attr.config);
 	if (ret)
 		return ret;
 
@@ -180,20 +239,35 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	const unsigned int gt_id = config_gt_id(event->attr.config);
 	const u64 config = event->attr.config;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
-	u64 val;
-
-	switch (config_counter(config)) {
-	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
-	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
-	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
-	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
-		val = engine_group_busyness_read(gt, config);
-		break;
-	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
-		val = xe_gt_total_active_ticks(gt);
-		break;
-	default:
-		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
+	u64 val = 0;
+
+	if (is_engine_event(event)) {
+		u8 sample = engine_event_sample(event);
+		struct xe_hw_engine *hwe;
+
+		hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(engine_event_class(event)),
+				      engine_event_instance(event), true);
+
+		if (!hwe)
+			drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
+		else if (sample == DRM_XE_PMU_SAMPLE_BUSY_TICKS)
+			val = xe_gt_engine_busy_ticks(gt, hwe);
+		else
+			drm_warn(&xe->drm, "unknown pmu engine event\n");
+	} else {
+		switch (config_counter(config)) {
+		case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
+		case DRM_XE_PMU_COPY_GROUP_BUSY(0):
+		case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+		case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
+			val = engine_group_busyness_read(gt, config);
+			break;
+		case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
+			val = xe_gt_total_active_ticks(gt);
+			break;
+		default:
+			drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
+		}
 	}
 
 	return val;
@@ -324,6 +398,12 @@ static const struct attribute_group xe_pmu_cpumask_attr_group = {
 	.global = true, \
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
@@ -366,9 +446,18 @@ create_event_attributes(struct xe_pmu *pmu)
 		__event(4, "total-active-ticks", NULL),
 	};
 
+	static const struct {
+		enum drm_xe_pmu_engine_sample sample;
+		char *name;
+	} engine_events[] = {
+		__engine_event(DRM_XE_PMU_SAMPLE_BUSY_TICKS, "busy-ticks"),
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
@@ -383,6 +472,15 @@ create_event_attributes(struct xe_pmu *pmu)
 		}
 	}
 
+	for_each_gt(gt, xe, j) {
+		for_each_hw_engine(hwe, gt, id) {
+			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
+				if (!engine_event_status(hwe, engine_events[i].sample))
+					count++;
+			}
+		}
+	}
+
 	/* Allocate attribute objects and table. */
 	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
 	if (!xe_attr)
@@ -437,6 +535,30 @@ create_event_attributes(struct xe_pmu *pmu)
 		}
 	}
 
+	/* Initialize supported engine counters */
+	for_each_gt(gt, xe, j) {
+		for_each_hw_engine(hwe, gt, id) {
+			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
+				char *str;
+
+				if (engine_event_status(hwe, engine_events[i].sample))
+					continue;
+
+				str = kasprintf(GFP_KERNEL, "%s-%s-gt%u",
+						hwe->name, engine_events[i].name, j);
+
+				if (!str)
+					goto err;
+
+				*attr_iter++ = &xe_iter->attr.attr;
+				xe_iter = add_xe_attr(xe_iter, str,
+						      __DRM_XE_PMU_ENGINE(j, xe_hw_engine_to_user_class(hwe->class),
+									  hwe->logical_instance,
+									  engine_events[i].sample));
+			}
+		}
+	}
+
 	pmu->xe_attr = xe_attr;
 	pmu->pmu_attr = pmu_attr;
 
-- 
2.40.0

