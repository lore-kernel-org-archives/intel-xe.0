Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5304BC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2222510E27E;
	Fri, 21 Feb 2025 10:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLZClmX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3E910E27E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740134301; x=1771670301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9YHmYKhRGYFvQZGqzn2vA38CF0G++BeNt2DxmT/cnUw=;
 b=nLZClmX1SIw5sQUaNuCqI4QXn9taZ6mRNJIQ3JOG2PWRotC8vXVin+k8
 v4R92bMnnZbz8Nyj3GtzlXIlMeVnisoYEjpoPoJuXGDgDiFRCjeCPNSce
 tlJeSwIGg6xE0jN4ZnZ6Hs+owyS4I0iBIdENBzxZ2jcbkSvqE6Nf/ZRzM
 GKdEm07kq84Ua908Ysne57CR7qdD75HyfF0Pos/fpNHfJRIyGSLWr7ZeR
 BSCzkvp7Phw999FiyDpigZQvOqMPg8CjHLkBRBdRHaxXWdxU3JaepTxMW
 ajQBd9uqElN7HjSJWnH5PVyNZvrFLBSiXwOdtK1uzfIZXjcyK3fX/MA2p g==;
X-CSE-ConnectionGUID: 3qO0iqUcRg+tBwxkDHypZQ==
X-CSE-MsgGUID: yVcC94Y9RXWbV2tfe3xEFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40178209"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40178209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:38:21 -0800
X-CSE-ConnectionGUID: umR8P7GERzu/Dn2C5slBRg==
X-CSE-MsgGUID: 4CNuKw/BTpu6nkYL9Vm3Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="120442389"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:38:19 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v8 4/5] drm/xe/xe_pmu: Add PMU support for engine activity
Date: Fri, 21 Feb 2025 16:29:06 +0530
Message-ID: <20250221105908.1966738-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250221105908.1966738-1-riana.tauro@intel.com>
References: <20250221105908.1966738-1-riana.tauro@intel.com>
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

PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. When querying engine activity,
user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

To list the events

	./perf list
	  xe_0000_03_00.0/engine-active-ticks/	[Kernel PMU event]
	  xe_0000_03_00.0/engine-total-ticks/	[Kernel PMU event]

The formats to be used with the above are

	engine_instance	- config:12-19
	engine_class	- config:20-27
	gt		- config:60-63

The events can then be read using perf tool

./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt=0,
			       engine_class=0,engine_instance=0/,
	       xe_0000_03_00.0/engine-total-ticks,gt=0,
			       engine_class=0,engine_instance=0/ -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/engine total ticks) * 100

v2: validate gt
    rename total-ticks to engine-total-ticks
    add helper to get hwe (Umesh)

v3: fix checkpatch warning
    add details to documentation (Umesh)
    remove ascii formats from documentation (Lucas)

v4: remove unnecessary warn within raw_spinlock (Lucas)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c |   5 ++
 drivers/gpu/drm/xe/xe_pmu.c | 125 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_uc.c  |   3 +
 3 files changed, 124 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..bc1ff0a4e1e7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -27,6 +27,7 @@
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
@@ -744,6 +745,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_guc_engine_activity_init(guc);
+	if (ret)
+		return ret;
+
 	ret = xe_guc_buf_cache_init(&guc->buf);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 3910a82328ee..d2c035c1924e 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -8,15 +8,16 @@
 
 #include "xe_device.h"
 #include "xe_gt_idle.h"
+#include "xe_guc_engine_activity.h"
+#include "xe_hw_engine.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
 
 /**
  * DOC: Xe PMU (Performance Monitoring Unit)
  *
- * Expose events/counters like GT-C6 residency and GT frequency to user land via
- * the perf interface. Events are per device. The GT can be selected with an
- * extra config sub-field (bits 60-63).
+ * Expose events/counters like GT-C6 residency, GT frequency and per-class-engine
+ * activity to user land via the perf interface. Events are per device.
  *
  * All events are listed in sysfs:
  *
@@ -24,7 +25,18 @@
  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
  *
- * The format directory has info regarding the configs that can be used.
+ * The following format parameters are available to read events,
+ * but only few are valid with each event:
+ *
+ *	gt[60:63]		Selects gt for the event
+ *	engine_class[20:27]	Selects engine-class for event
+ *	engine_instance[12:19]	Selects the engine-instance for the event
+ *
+ * For engine specific events (engine-*), gt, engine_class and engine_instance parameters must be
+ * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
+ *
+ * For gt specific events (gt-*) gt parameter must be passed. All other parameters will be 0.
+ *
  * The standard perf tool can be used to grep for a certain event as well.
  * Example:
  *
@@ -35,20 +47,34 @@
  *     $ perf stat -e <event_name,gt=> -I <interval>
  */
 
-#define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
-#define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
+#define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
+#define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
+#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
+#define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
 
 static unsigned int config_to_event_id(u64 config)
 {
 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
 }
 
+static unsigned int config_to_engine_class(u64 config)
+{
+	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
+}
+
+static unsigned int config_to_engine_instance(u64 config)
+{
+	return FIELD_GET(XE_PMU_EVENT_ENGINE_INSTANCE_MASK, config);
+}
+
 static unsigned int config_to_gt_id(u64 config)
 {
 	return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
 }
 
-#define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
+#define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
+#define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
+#define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
@@ -58,6 +84,24 @@ static struct xe_gt *event_to_gt(struct perf_event *event)
 	return xe_device_get_gt(xe, gt);
 }
 
+static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct drm_xe_engine_class_instance eci;
+	u64 config = event->attr.config;
+	struct xe_hw_engine *hwe;
+
+	eci.engine_class = config_to_engine_class(config);
+	eci.engine_instance = config_to_engine_instance(config);
+	eci.gt_id = config_to_gt_id(config);
+
+	hwe = xe_hw_engine_lookup(xe, eci);
+	if (!hwe || xe_hw_engine_is_reserved(hwe))
+		return NULL;
+
+	return hwe;
+}
+
 static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 			    unsigned int id)
 {
@@ -68,6 +112,35 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 		pmu->supported_events & BIT_ULL(id);
 }
 
+static bool event_param_valid(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	unsigned int engine_class, engine_instance;
+	u64 config = event->attr.config;
+	struct xe_gt *gt;
+
+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+	if (!gt)
+		return false;
+
+	engine_class = config_to_engine_class(config);
+	engine_instance = config_to_engine_instance(config);
+
+	switch (config_to_event_id(config)) {
+	case XE_PMU_EVENT_GT_C6_RESIDENCY:
+		if (engine_class || engine_instance)
+			return false;
+		break;
+	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
+	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
+		if (!event_to_hwe(event))
+			return false;
+		break;
+	}
+
+	return true;
+}
+
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
@@ -104,6 +177,9 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
 
+	if (!event_param_valid(event))
+		return -ENOENT;
+
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
 		xe_pm_runtime_get(xe);
@@ -113,6 +189,20 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
+{
+	struct xe_hw_engine *hwe;
+	u64 val = 0;
+
+	hwe = event_to_hwe(event);
+	if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
+		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe);
+	else
+		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe);
+
+	return val;
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
@@ -123,6 +213,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	switch (config_to_event_id(event->attr.config)) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
 		return xe_gt_idle_residency_msec(&gt->gtidle);
+	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
+	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
+		return read_engine_events(gt, event);
 	}
 
 	return 0;
@@ -207,11 +300,15 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
 	xe_pmu_event_stop(event, PERF_EF_UPDATE);
 }
 
-PMU_FORMAT_ATTR(gt,	"config:60-63");
-PMU_FORMAT_ATTR(event,	"config:0-11");
+PMU_FORMAT_ATTR(gt,			"config:60-63");
+PMU_FORMAT_ATTR(engine_class,		"config:20-27");
+PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
+PMU_FORMAT_ATTR(event,			"config:0-11");
 
 static struct attribute *pmu_format_attrs[] = {
 	&format_attr_event.attr,
+	&format_attr_engine_class.attr,
+	&format_attr_engine_instance.attr,
 	&format_attr_gt.attr,
 	NULL,
 };
@@ -270,6 +367,8 @@ static ssize_t event_attr_show(struct device *dev,
 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
 
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -283,15 +382,23 @@ static const struct attribute_group pmu_events_attr_group = {
 
 static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
+	&pmu_group_engine_active_ticks,
+	&pmu_group_engine_total_ticks,
 	NULL,
 };
 
 static void set_supported_events(struct xe_pmu *pmu)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 
 	if (!xe->info.skip_guc_pc)
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
+
+	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d8167e818280..c14bd2282044 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -14,6 +14,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
 #include "xe_uc_fw.h"
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

