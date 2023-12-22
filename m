Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD540C46CD8
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729E510E759;
	Fri, 22 Dec 2023 07:38:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144410E757
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230725; x=1734766725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=229KGXtS43jFQHTQzh5kjgAcalXM/oOXNNcJZuhco24=;
 b=HN+loz5ENPs/21pyuTBnR08LMN0/oUe0n4Sv82UR203N3mi23BnfkKNg
 IDjwC1EXKkdV1+cZ1pHVMQOmNWnTW5BOovB1Kdp6aIk9h2QJIBndloZli
 KJh/B0mDcWIS4IUzG7NsgDcane9zmzm4KKJjqJky2ywdAIQdZAMM6T4FL
 d5GEJAjjcLRDPwRk5rU88aFDbdCsW67grQPPxm6VdryEo4jF7/UOHLcy+
 0EYsbBPMq7F7dTDbDqtB391x1olKK1OI6uTZgHfmicAL21mpwfbqlucxc
 aQKOxio+1mfhCqoHC1ayJQe3TBJXqHJIFMFwinPf5VEJ9uGPR5WOeDtcm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9481020"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9481020"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920582584"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920582584"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:42 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 2/8] drm/xe/guc: Add interface for engine busyness ticks
Date: Fri, 22 Dec 2023 13:15:56 +0530
Message-Id: <20231222074602.817518-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231222074602.817518-1-riana.tauro@intel.com>
References: <20231222074602.817518-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
shared memory buffer and updated on a continuous basis.

Add functions that initialize Engine busyness and get
the current accumulated busyness.

v2: rebase
    fix naming of local variable (Umesh)

Co-developed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |  13 ++
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 153 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  17 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 ++
 drivers/gpu/drm/xe/xe_guc_types.h           |   6 +
 9 files changed, 215 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index df8601d6a59f..26988c1c732a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
+	xe_guc_engine_busyness.o \
 	xe_guc_hwconfig.o \
 	xe_guc_log.o \
 	xe_guc_pc.o \
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 3062e0e0d467..d87681ca89bc 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -139,6 +139,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
+	XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION = 0x550C,
 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..58daadc00363 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -32,6 +32,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
+#include "xe_guc_engine_busyness.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_pc.h"
 #include "xe_hw_fence.h"
@@ -776,3 +777,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
 	return NULL;
 }
+
+/**
+ * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
+ * @gt: GT structure
+ * @hwe: Xe HW engine to report on
+ *
+ * Returns accumulated ticks @hwe was busy since engine stats were enabled.
+ */
+u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4486e083f5ef..4303ec48c404 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -42,6 +42,8 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
+u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
+
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
  * first that matches the same reset domain as @class
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 811e8b201270..cfd434b26d0d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -18,6 +18,7 @@
 #include "xe_gt.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_engine_busyness.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
@@ -302,9 +303,15 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 int xe_guc_post_load_init(struct xe_guc *guc)
 {
+	int err;
+
 	xe_guc_ads_populate_post_load(&guc->ads);
 	guc->submission_state.enabled = true;
 
+	err = xe_guc_engine_busyness_init(guc);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
new file mode 100644
index 000000000000..af7b6e768751
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include "xe_guc_engine_busyness.h"
+
+#include <drm/drm_managed.h>
+
+#include "abi/guc_actions_abi.h"
+#include "xe_bo.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+
+/**
+ * DOC: Xe GuC Engine Busyness
+ *
+ * GuC >= 70.11.1 maintains busyness counters in a shared memory buffer for each
+ * engine on a continuous basis. The counters are all 64 bits and count in clock
+ * ticks. The values are updated on context switch events and periodicaly on a
+ * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
+ * a caveat that is not real time, best effort only).
+ *
+ * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
+ */
+
+static void guc_engine_busyness_usage_map(struct xe_guc *guc,
+					  struct xe_hw_engine *hwe,
+					  struct iosys_map *engine_map)
+{
+	struct iosys_map *map;
+	size_t offset;
+	u32 instance;
+	u8 guc_class;
+
+	guc_class = xe_engine_class_to_guc_class(hwe->class);
+	instance = hwe->logical_instance;
+
+	map = &guc->busy.bo->vmap;
+
+	offset = offsetof(struct guc_engine_observation_data,
+			  engine_data[guc_class][instance]);
+
+	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+}
+
+static void guc_engine_busyness_get_usage(struct xe_guc *guc,
+					  struct xe_hw_engine *hwe,
+					  u64 *ticks_engine)
+{
+	struct iosys_map engine_map;
+	u64 engine_ticks = 0;
+	int i = 0;
+
+	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
+
+#define read_engine_usage(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
+
+	do {
+		engine_ticks = read_engine_usage(&engine_map, total_execution_ticks);
+
+		if (read_engine_usage(&engine_map, total_execution_ticks) == engine_ticks)
+			break;
+	} while (++i < 6);
+
+#undef read_engine_usage
+
+	if (ticks_engine)
+		*ticks_engine = engine_ticks;
+}
+
+static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
+{
+	u32 ggtt_addr = xe_bo_ggtt_addr(guc->busy.bo);
+	u32 action[] = {
+		XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION,
+		ggtt_addr,
+		0,
+	};
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+	if (ret)
+		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
+}
+
+static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	xe_bo_unpin_map_no_vm(guc->busy.bo);
+}
+
+/*
+ * xe_guc_engine_busyness_ticks - Gets current accumulated
+ *				  engine busyness ticks
+ * @guc: The GuC object
+ * @hwe: Xe HW Engine
+ *
+ * Returns current acculumated ticks @hwe was busy when engine stats are enabled.
+ */
+u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+{
+	u64 ticks_engine;
+
+	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
+
+	return ticks_engine;
+}
+
+/*
+ * xe_guc_engine_busyness_init - Initializes the GuC Engine Busyness
+ * @guc: The GuC object
+ *
+ * Initialize GuC engine busyness, only called once during driver load
+ * Supported only on GuC >= 70.11.1
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_engine_busyness_init(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_bo *bo;
+	u32 size;
+	int err;
+
+	/* Initialization already done */
+	if (guc->busy.bo)
+		return 0;
+
+	size = PAGE_ALIGN(sizeof(struct guc_engine_observation_data));
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
+				  ttm_bo_type_kernel,
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+				  XE_BO_CREATE_GGTT_BIT);
+
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	guc->busy.bo = bo;
+
+	guc_engine_busyness_enable_stats(guc);
+
+	err = drmm_add_action_or_reset(&xe->drm, guc_engine_busyness_fini, guc);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
new file mode 100644
index 000000000000..d70f06209896
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_ENGINE_BUSYNESS_H_
+#define _XE_GUC_ENGINE_BUSYNESS_H_
+
+#include <linux/types.h>
+
+struct xe_hw_engine;
+struct xe_guc;
+
+int xe_guc_engine_busyness_init(struct xe_guc *guc);
+u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4dd5a88a7826..c8ca5fe97614 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -37,6 +37,7 @@
 #define GUC_COMPUTE_CLASS		4
 #define GUC_GSC_OTHER_CLASS		5
 #define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
+#define GUC_MAX_OAG_COUNTERS		8
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
@@ -222,6 +223,20 @@ struct guc_engine_usage {
 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 } __packed;
 
+/* Engine busyness stats */
+struct guc_engine_data {
+	u64 total_execution_ticks;
+	u64 reserved;
+} __packed;
+
+struct guc_engine_observation_data {
+	struct guc_engine_data engine_data[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
+	u64 oag_busy_data[GUC_MAX_OAG_COUNTERS];
+	u64 total_active_ticks;
+	u64 gt_timestamp;
+	u64 reserved1;
+} __packed;
+
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum xe_guc_recv_message {
 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 16de203c62a7..a75728071f46 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -85,6 +85,12 @@ struct xe_guc {
 		u32 size;
 	} hwconfig;
 
+	/** @busy: Engine busyness */
+	struct {
+		/** @bo: GGTT buffer object of engine busyness that is shared with GuC */
+		struct xe_bo *bo;
+	} busy;
+
 	/**
 	 * @notify_reg: Register which is written to notify GuC of H2G messages
 	 */
-- 
2.40.0

