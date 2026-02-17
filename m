Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C0E9A03C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 20:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162F010E1B4;
	Tue, 17 Feb 2026 20:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHz9y+hm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B8910E2A8
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 20:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771358758; x=1802894758;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7cuqJMJgE9f5tg4+wm6VfqvCAM22bhw1C4mXqwGm9ng=;
 b=dHz9y+hmE05jeuY0zff5t3Hf0SrN1NxRgf2/1dUrpeZUa2KVwm/9IReD
 UoZmctogZpuUO+7530Tw6Uefjy8AD0fohTPq/lBpAUNX6cXQr0ESU0hRA
 vnT6j533wkK8tcBWtKalw9ZfsQxgXBr9tjVq12J7mW/l1HBzeS2YLdhXq
 KrrHSCxL97f+Vneh7xzRs1nL3ty31m3OzX+YpeJ/chik62i1aTEqc28QC
 1lEWVZUL0m+CW86B0O1dG/JfhlrIS+Gdj+z/rSBclLEUEETMpafrlv2OD
 1uB+pCnMFB+YwC860thpae2fLiPWl9BWYwIz8GWvji959Ko/PVstp5D+P A==;
X-CSE-ConnectionGUID: XoIoi9gYQsWMAzVKlg/Ykg==
X-CSE-MsgGUID: BOyLh24kSn2koWw074yoDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71637487"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="71637487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 12:05:57 -0800
X-CSE-ConnectionGUID: EIUHwV55SBiF6oDFSIOvlQ==
X-CSE-MsgGUID: XK7xvlhVTK25EbAJijnpqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="218514086"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 12:05:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Convert GT stats to per-cpu counters
Date: Tue, 17 Feb 2026 12:05:52 -0800
Message-Id: <20260217200552.596718-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Current GT statistics use atomic64_t counters. Atomic operations incur
a global coherency penalty.

Transition to dynamic per-cpu counters using alloc_percpu(). This allows
stats to be incremented via this_cpu_add(), which compiles to a single
non-locking instruction. This approach keeps the hot-path updates local
to the CPU, avoiding expensive cross-core cache invalidation traffic.

Use for_each_possible_cpu() during aggregation and clear operations to
ensure data consistency across CPU hotplug events.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c             |  5 +++
 drivers/gpu/drm/xe/xe_gt_stats.c       | 57 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_stats.h       |  6 +++
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 19 +++++++++
 drivers/gpu/drm/xe/xe_gt_types.h       |  5 +--
 5 files changed, 78 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 68c4771de040..1203d087b68f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -33,6 +33,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_gt_stats.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
@@ -455,6 +456,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_stats_init(gt);
+	if (err)
+		return err;
+
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 37506434d7a3..f4bb0bf33995 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -3,12 +3,37 @@
  * Copyright © 2024 Intel Corporation
  */
 
-#include <linux/atomic.h>
-
+#include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "xe_device.h"
 #include "xe_gt_stats.h"
-#include "xe_gt_types.h"
+
+static void xe_gt_stats_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	free_percpu(gt->stats);
+}
+
+/**
+ * xe_gt_stats_init() - Initialize GT statistics
+ * @gt: GT structure
+ *
+ * Allocate per-CPU GT statistics. Using per-CPU stats allows increments
+ * to occur without cross-CPU atomics.
+ *
+ * Return: 0 on success, -ENOMEM on failure.
+ */
+int xe_gt_stats_init(struct xe_gt *gt)
+{
+	gt->stats = alloc_percpu(struct xe_gt_stats);
+	if (!gt->stats)
+		return -ENOMEM;
+
+	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, xe_gt_stats_fini,
+					gt);
+}
 
 /**
  * xe_gt_stats_incr - Increments the specified stats counter
@@ -23,7 +48,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 	if (id >= __XE_GT_STATS_NUM_IDS)
 		return;
 
-	atomic64_add(incr, &gt->stats.counters[id]);
+	this_cpu_add(gt->stats->counters[id], incr);
 }
 
 #define DEF_STAT_STR(ID, name) [XE_GT_STATS_ID_##ID] = name
@@ -94,9 +119,18 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
 {
 	enum xe_gt_stats_id id;
 
-	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
-		drm_printf(p, "%s: %lld\n", stat_description[id],
-			   atomic64_read(&gt->stats.counters[id]));
+	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id) {
+		u64 total = 0;
+		int cpu;
+
+		for_each_possible_cpu(cpu) {
+			struct xe_gt_stats *s = per_cpu_ptr(gt->stats, cpu);
+
+			total += s->counters[id];
+		}
+
+		drm_printf(p, "%s: %lld\n", stat_description[id], total);
+	}
 
 	return 0;
 }
@@ -109,8 +143,11 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
  */
 void xe_gt_stats_clear(struct xe_gt *gt)
 {
-	int id;
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct xe_gt_stats *s = per_cpu_ptr(gt->stats, cpu);
 
-	for (id = 0; id < ARRAY_SIZE(gt->stats.counters); ++id)
-		atomic64_set(&gt->stats.counters[id], 0);
+		memset(s, 0, sizeof(*s));
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index 59a7bf60e242..3d0defab9b30 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -14,10 +14,16 @@ struct xe_gt;
 struct drm_printer;
 
 #ifdef CONFIG_DEBUG_FS
+int xe_gt_stats_init(struct xe_gt *gt);
 int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_stats_clear(struct xe_gt *gt);
 void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
 #else
+static inline int xe_gt_stats_init(struct xe_gt *gt)
+{
+	return 0;
+}
+
 static inline void
 xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id,
 		 int incr)
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b8accdbc54eb..79568591bd67 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_STATS_TYPES_H_
 #define _XE_GT_STATS_TYPES_H_
 
+#include <linux/types.h>
+
 enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
@@ -58,4 +60,21 @@ enum xe_gt_stats_id {
 	__XE_GT_STATS_NUM_IDS,
 };
 
+/**
+ * struct xe_gt_stats - Per-CPU GT statistics counters
+ * @counters: Array of 64-bit counters indexed by &enum xe_gt_stats_id
+ *
+ * This structure is used for high-frequency, per-CPU statistics collection
+ * in the Xe driver. By using a per-CPU allocation and ensuring the structure
+ * is cache-line aligned, we avoid the performance-heavy atomics and cache
+ * coherency traffic.
+ *
+ * Updates to these counters should be performed using the this_cpu_add()
+ * macro to ensure they are atomic with respect to local interrupts and
+ * preemption-safe without the overhead of explicit locking.
+ */
+struct xe_gt_stats {
+	u64 counters[__XE_GT_STATS_NUM_IDS];
+} ____cacheline_aligned;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index caf7e7e78be9..8b55cf25a75f 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -158,10 +158,7 @@ struct xe_gt {
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	/** @stats: GT stats */
-	struct {
-		/** @stats.counters: counters for various GT stats */
-		atomic64_t counters[__XE_GT_STATS_NUM_IDS];
-	} stats;
+	struct xe_gt_stats __percpu *stats;
 #endif
 
 	/**
-- 
2.34.1

