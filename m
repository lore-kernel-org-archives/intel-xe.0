Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71758C3DA52
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 16:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F83710ED67;
	Fri, 12 Jul 2024 16:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP5knLp/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E09410ED5D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720802858; x=1752338858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R9a2QCdnXecpl1n4iTSWaQ28SDSADRc2bxZdYVBqyQY=;
 b=LP5knLp/UoUA43PJuJjM1nJJVYgy+8WNa3LzsHW6fAgflNT9GDqMwQG6
 toKclQAsQgaJazKW6g6I91w98ayBZZVMN2un6zQNqePUFK+UZNSCnnEW6
 UQ1W4MWye52lVJ/izZcAw1sefePQ9sF5jPQhXA0zySPL7qhtWRp3LYEJ+
 5hKNek2fVbv+pGkbtH1H0xfqnl5W4V7jISM5uGGgms202INZed1htRp4K
 13Qd5Z1T13AdtChz9qDBhpWTNsoZx8Uo9f7oPFUe3R3nfFSByQUKXbVP3
 D3+aUnHRo+CfieCf00/rwg/FXNB2SZ9oXDsaJFdn7ZJ5v97VJSOtI/GCw w==;
X-CSE-ConnectionGUID: o2WcdFzLT1qXfFEpBj1ioA==
X-CSE-MsgGUID: CfpiOgUgSJe8z5L3uwSzpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18382503"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18382503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 09:47:28 -0700
X-CSE-ConnectionGUID: C2A77F/aSwy2grnFFfdMJg==
X-CSE-MsgGUID: bUDr4/UmQGONQc/PIF6Ilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="72162019"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2024 09:47:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v12 3/5] drm/xe/guc: Add capture size check in GuC log buffer
Date: Fri, 12 Jul 2024 09:47:22 -0700
Message-Id: <20240712164724.677393-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712164724.677393-1-zhanjun.dong@intel.com>
References: <20240712164724.677393-1-zhanjun.dong@intel.com>
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

The capture-nodes is included in GuC log buffer, add the size check
for capture region in the whole GuC log buffer.
Add capture output size check before allocating the shared buffer.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h  |  20 ++++
 drivers/gpu/drm/xe/xe_guc_capture.c   |  82 ++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_log.c       | 141 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h       |  12 ++-
 drivers/gpu/drm/xe/xe_guc_log_types.h |  17 ++++
 5 files changed, 269 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
new file mode 100644
index 000000000000..10db4ffaa17f
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_LOG_ABI_H
+#define _ABI_GUC_LOG_ABI_H
+
+#include <linux/types.h>
+
+/* GuC logging buffer types */
+enum guc_log_buffer_type {
+	GUC_LOG_BUFFER_CRASH_DUMP,
+	GUC_LOG_BUFFER_DEBUG,
+	GUC_LOG_BUFFER_CAPTURE,
+};
+
+#define GUC_LOG_BUFFER_TYPE_MAX		3
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index bf11cd2aaf25..8f279b40e75d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -22,6 +22,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_ads.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_capture_types.h"
 #include "xe_guc_ct.h"
@@ -588,7 +589,85 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
-/**
+static int guc_capture_output_size_est(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	int capture_size = 0;
+	size_t tmp = 0;
+
+	if (!guc->capture)
+		return -ENODEV;
+
+	/*
+	 * If every single engine-instance suffered a failure in quick succession but
+	 * were all unrelated, then a burst of multiple error-capture events would dump
+	 * registers for every one engine instance, one at a time. In this case, GuC
+	 * would even dump the global-registers repeatedly.
+	 *
+	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
+	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
+	 * dumps are split across different register types (where the '3' are global vs class
+	 * vs instance).
+	 */
+	for_each_hw_engine(hwe, gt, id) {
+		u16 capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
+
+		capture_size += sizeof(struct guc_state_capture_group_header_t) +
+					 (3 * sizeof(struct guc_state_capture_header_t));
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_STATE_CAPTURE_TYPE_GLOBAL,
+					     0, &tmp, true))
+			capture_size += tmp;
+		if (!guc_capture_getlistsize(guc, 0, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
+					     capture_class, &tmp, true))
+			capture_size += tmp;
+		if (!guc_capture_getlistsize(guc, 0, GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE,
+					     capture_class, &tmp, true))
+			capture_size += tmp;
+	}
+
+	return capture_size;
+}
+
+/*
+ * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
+ * before the Xe can read the data out and process it
+ */
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+
+static void check_guc_capture_size(struct xe_guc *guc)
+{
+	int capture_size = guc_capture_output_size_est(guc);
+	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
+	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+
+	/*
+	 * NOTE: capture_size is much smaller than the capture region
+	 * allocation (DG2: <80K vs 1MB).
+	 * Additionally, its based on space needed to fit all engines getting
+	 * reset at once within the same G2H handler task slot. This is very
+	 * unlikely. However, if GuC really does run out of space for whatever
+	 * reason, we will see an separate warning message when processing the
+	 * G2H event capture-notification, search for:
+	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
+	 */
+	if (capture_size < 0)
+		xe_gt_dbg(guc_to_gt(guc),
+			  "Failed to calculate error state capture buffer minimum size: %d!\n",
+			  capture_size);
+	if (capture_size > buffer_size)
+		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
+			  buffer_size, capture_size);
+	else if (spare_size > buffer_size)
+		xe_gt_dbg(guc_to_gt(guc),
+			  "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+			  buffer_size, spare_size, capture_size);
+}
+
+/*
  * xe_guc_capture_init - Init for GuC register capture
  * @guc: The GuC object
  *
@@ -605,5 +684,6 @@ int xe_guc_capture_init(struct xe_guc *guc)
 
 	guc->capture->reglists = guc_capture_get_device_reglist(guc);
 
+	check_guc_capture_size(guc);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..8fecb528b92c 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,9 +9,64 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
+#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
+
+#define GUC_LOG_CALC_UNIT(size)		(((size) % SZ_1M) == 0 ? SZ_1M : SZ_4K)
+#define GUC_LOG_CALC_FLAG(size)		(((size) % SZ_1M) == 0 ? GUC_LOG_LOG_ALLOC_UNITS : 0)
+
+/* Size is +1 unit */
+#define GUC_LOG_CALC_COUNT(size)	((size) / GUC_LOG_CALC_UNIT(size) - 1)
+
+static const struct xe_log_sizes_type log_sizes[GUC_LOG_BUFFER_TYPE_MAX] = {
+	{
+		GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
+		GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE),
+		GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE),
+		GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE)
+	},
+	{
+		GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
+		GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE),
+		GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE),
+		GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE)
+	},
+	{
+		GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
+		GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE),
+		GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE),
+		GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE)
+	}
+};
+
+/* Zero is not allowed for crash/debug/capture size */
+static_assert(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE);
+static_assert(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE);
+static_assert(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE);
+
+/* crash unit must equal to debug unit */
+static_assert(GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE) ==
+	      GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE));
+
+/* crash/debug/capture count must less than mask range */
+static_assert(GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE) <=
+	      GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT);
+static_assert(GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE) <=
+	      GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT);
+static_assert(GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE) <=
+	      GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT);
+
+static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
+{
+	return container_of(log, struct xe_guc, log);
+}
+
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
 {
@@ -80,7 +135,8 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
-	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
+	struct xe_gt *gt = log_to_gt(log);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
@@ -96,3 +152,86 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	return 0;
 }
+
+/**
+ * xe_guc_log_section_size_capture - Get capture buffer size in log sections.
+ * @log: The log object.
+ *
+ * This function will return the capture buffer size in log sections.
+ *
+ * Return: capture buffer size.
+ */
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
+{
+	return log_sizes[GUC_LOG_BUFFER_CAPTURE].bytes;
+}
+
+/**
+ * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
+ * @log: The log object.
+ * @type: The log buffer type
+ * @full_cnt: The count of buffer full
+ *
+ * This function will check count of buffer full against previous, mismatch
+ * indicate overflowed.
+ * Update the sampled_overflow counter, if the 4 bit counter overflowed, add
+ * up 16 to correct the value.
+ *
+ * Return: True if overflowed.
+ */
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
+				   unsigned int full_cnt)
+{
+	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
+	bool overflow = false;
+
+	if (full_cnt != prev_full_cnt) {
+		overflow = true;
+
+		log->stats[type].overflow = full_cnt;
+		log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
+
+		if (full_cnt < prev_full_cnt) {
+			/* buffer_full_cnt is a 4 bit counter */
+			log->stats[type].sampled_overflow += 16;
+		}
+		xe_gt_notice(log_to_gt(log), "log buffer overflow\n");
+	}
+
+	return overflow;
+}
+
+/**
+ * xe_guc_get_log_buffer_size - Get log buffer size for a type.
+ * @log: The log object.
+ * @type: The log buffer type
+ *
+ * Return: buffer size.
+ */
+u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
+{
+	xe_gt_assert(log_to_gt(log), type < GUC_LOG_BUFFER_TYPE_MAX);
+	return log_sizes[type].bytes;
+}
+
+/**
+ * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
+ * @log: The log object.
+ * @type: The log buffer type
+ *
+ * This function will return the offset in the log buffer for a type.
+ * Return: buffer offset.
+ */
+u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
+{
+	enum guc_log_buffer_type i;
+	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
+
+	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
+		if (i == type)
+			break;
+		offset += xe_guc_get_log_buffer_size(log, i);
+	}
+
+	return offset;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..1d3b123cebd3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_LOG_H_
 
 #include "xe_guc_log_types.h"
+#include "xe_guc_types.h"
 
 struct drm_printer;
 
@@ -17,7 +18,7 @@ struct drm_printer;
 #else
 #define CRASH_BUFFER_SIZE	SZ_8K
 #define DEBUG_BUFFER_SIZE	SZ_64K
-#define CAPTURE_BUFFER_SIZE	SZ_16K
+#define CAPTURE_BUFFER_SIZE	SZ_1M
 #endif
 /*
  * While we're using plain log level in i915, GuC controls are much more...
@@ -45,4 +46,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
 	return log->level;
 }
 
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
+
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
+				   enum guc_log_buffer_type type,
+				   unsigned int full_cnt);
+
+u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
+u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..e0122aa99aa1 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -7,9 +7,18 @@
 #define _XE_GUC_LOG_TYPES_H_
 
 #include <linux/types.h>
+#include "abi/guc_log_abi.h"
 
 struct xe_bo;
 
+/** @sizes: Allocation settings */
+struct xe_log_sizes_type {
+	u32 bytes;	/* Size in bytes */
+	u32 units;	/* GuC API units - 1MB or 4KB */
+	u32 count;	/* Number of API units */
+	u32 flag;	/* GuC API units flag */
+};
+
 /**
  * struct xe_guc_log - GuC log
  */
@@ -18,6 +27,14 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+	/** @sizes: Allocation settings */
+	struct xe_log_sizes_type sizes[GUC_LOG_BUFFER_TYPE_MAX];
+	/** @stats: logging related stats */
+	struct {
+		u32 sampled_overflow;
+		u32 overflow;
+		u32 flush;
+	} stats[GUC_LOG_BUFFER_TYPE_MAX];
 };
 
 #endif
-- 
2.34.1

