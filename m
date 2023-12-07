Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62DEC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B895610E8A1;
	Thu,  7 Dec 2023 12:50:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C4710E8A1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953451; x=1733489451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H86TGCkuhy+v4FSu3A9nuzRlpEKadw7F7WSxOsIohVE=;
 b=Xec4vYqGecGSClLY/+nm63XHP/H1ymvdpT2cOGh7LdjashA2WFPO8T3S
 l7Er6zO3CcuGsVP9vIsiRfF2yopGESbb74kbXuHNXmY7Y/6BQUzZBcyM3
 Fp3AWn6HpGbHLQOLTdb/Oqexo6KTHD1KKD1lfSsVlf6qWeyayLORm/553
 mqp8XEuraqXIcjXPX1oWrlH2BUwxsT/jkNEjkBrhbU/alQ6YGQSL9TqcV
 UbaeehSzZis+LEBVFwLaiIn7YvEpx5MrxtgG3NlNlByxTFKHlRoYIDhKk
 vV4xio2eVtHYgWk+cyN5X4giRSW52yBGkA9eh2vO7gOx4lFne7nk8Jdo1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1051381"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1051381"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19692695"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:48 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/8] RFC drm/xe/guc: Add PMU counter for total active ticks
Date: Thu,  7 Dec 2023 18:27:58 +0530
Message-Id: <20231207125802.3730165-5-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
 drivers/gpu/drm/xe/xe_gt.h                  |  1 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 75 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
 drivers/gpu/drm/xe/xe_pmu.c                 |  7 ++
 include/uapi/drm/xe_drm.h                   |  1 +
 6 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3d735b66f60d..07a94d315715 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -785,6 +785,17 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 	return NULL;
 }
 
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
+
 /**
  * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
  * @gt: GT structure
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 2e3cd7031287..c2d49275cd31 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,6 +43,7 @@ void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
 u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
+u64 xe_gt_total_active_ticks(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 431d1ca59d2f..b1d65ed14244 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -20,7 +20,16 @@
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
 
 /* GuC version number components are only 8-bit, so converting to a 32bit 8.8.8 */
@@ -42,48 +51,69 @@ static bool guc_engine_busyness_supported(struct xe_guc *guc)
 
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
 
-	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+	}
+
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
@@ -113,6 +143,25 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
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
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return 0;
+
+	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
+
+	return ticks_gt;
+}
+
 /*
  * xe_guc_engine_busyness_ticks - Gets current accumulated
  *				  engine busyness ticks
@@ -129,7 +178,7 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	if (!guc_engine_busyness_supported(guc))
 		return 0;
 
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
index 9d0b7887cfc4..855cd7b3edb3 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -9,6 +9,7 @@
 
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_gt_clock.h"
 #include "xe_mmio.h"
 
@@ -124,6 +125,8 @@ config_status(struct xe_device *xe, u64 config)
 		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
 			return -ENOENT;
 		break;
+	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -186,6 +189,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
 		val = engine_group_busyness_read(gt, config);
 		break;
+	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
+		val = xe_gt_total_active_ticks(gt);
+		break;
 	default:
 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
 	}
@@ -357,6 +363,7 @@ create_event_attributes(struct xe_pmu *pmu)
 		__event(1, "copy-group-busy", "ns"),
 		__event(2, "media-group-busy", "ns"),
 		__event(3, "any-engine-group-busy", "ns"),
+		__event(4, "total-active-ticks", NULL),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..b5e7a4f673fa 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1119,6 +1119,7 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
 #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
 #define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
+#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	___DRM_XE_PMU_OTHER(gt, 4)
 
 #if defined(__cplusplus)
 }
-- 
2.40.0

