Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C21C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5A310F7E6;
	Thu,  2 May 2024 20:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSa15IE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2D510F7D0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714683462; x=1746219462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dkyp04Ri+H8Gik8j1Sv0IuAqpEfysAXp0TEAwSvJtRA=;
 b=FSa15IE021MEGlc/aX3BPYGC7Vw8XZiIXalBm9TEKYCmHhUfElc6xfME
 FUnekWdM3eWF6SHxIYHDAAcvFXAYMgO9+6v1V5K7+qtcuzquYWWNzwxCg
 vnVBDkiRetznlUofRuiKIAB5Tg2v3eHkTS4rZzruA11m+5APzVjLGcYDG
 cjyM80nzLP33Ttj2WcTgfM7Mrcl7ROiwOo00UoXqRv7ZJ4L4LD/OGg82h
 QfLT3cxRVj1QXCZ/XnNZYBNPts0uuLGIipguCrzGaJ5o3jm9vxwvhDw0D
 NDNhjJ5vTGG7fE7FXti/dblhF5HjBB6/Q8TNYdtVzZ4Zv2D6XNla3FHvB g==;
X-CSE-ConnectionGUID: d9MHEhy1RmScSlEo0Kfm5A==
X-CSE-MsgGUID: ZKamGgL7S/SQJBV6SP/tYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10696527"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10696527"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:57:41 -0700
X-CSE-ConnectionGUID: Stnl8XL6QoSqUK8YWQuiJA==
X-CSE-MsgGUID: YSI92hp2RrmFMmRW3K+IOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27218896"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 02 May 2024 13:57:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 2/5] drm/xe/guc: Add capture size check in GuC log buffer
Date: Thu,  2 May 2024 13:57:35 -0700
Message-Id: <20240502205738.863369-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502205738.863369-1-zhanjun.dong@intel.com>
References: <20240502205738.863369-1-zhanjun.dong@intel.com>
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

The capture-nodes is included in GuC log buffer, add the size check
for capture region in the whole GuC log buffer.
Check the worst size of register capture aginst error capture region size.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h     |   3 +
 drivers/gpu/drm/xe/xe_guc_capture.c   |  30 +++++
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  48 +++++++
 drivers/gpu/drm/xe/xe_guc_log.c       | 179 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h       |  15 +++
 drivers/gpu/drm/xe/xe_guc_log_types.h |  24 ++++
 6 files changed, 299 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index c2b004d3f48e..107360edfcd6 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -22,6 +22,9 @@
 #define xe_gt_notice(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_gt_info(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index aabf8debc79e..91dafaac97ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_ads.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_capture_fwif.h"
 #include "xe_guc_ct.h"
@@ -491,6 +492,34 @@ xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
 	return 0;
 }
 
+/*
+ * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
+ * before the Xe can read the data out and process it
+ */
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+
+static void check_guc_capture_size(struct xe_guc *guc)
+{
+	int capture_size = xe_calculate_guc_regs_capture_worst_size(guc);
+	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
+	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+
+	/*
+	 * NOTE: capture_size is much smaller than the capture region allocation (DG2: <80K vs 1MB)
+	 * Additionally, its based on space needed to fit all engines getting reset at once
+	 * within the same G2H handler task slot. This is very unlikely. However, if GuC really
+	 * does run out of space for whatever reason, we will see an separate warning message
+	 * when processing the G2H event capture-notification, search for:
+	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
+	 */
+	if (capture_size > buffer_size)
+		xe_gt_warn(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
+			   buffer_size, capture_size);
+	else if (spare_size > buffer_size)
+		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+			  buffer_size, spare_size, capture_size);
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
@@ -499,5 +528,6 @@ int xe_guc_capture_init(struct xe_guc *guc)
 
 	guc->capture->reglists = guc_capture_get_device_reglist(guc);
 
+	check_guc_capture_size(guc);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 04b03c398191..908298791c93 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -250,6 +250,54 @@ struct guc_engine_usage {
 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 } __packed;
 
+/* GuC logging structures */
+
+enum guc_log_buffer_type {
+	GUC_DEBUG_LOG_BUFFER,
+	GUC_CRASH_DUMP_LOG_BUFFER,
+	GUC_CAPTURE_LOG_BUFFER,
+	GUC_MAX_LOG_BUFFER
+};
+
+/*
+ * struct guc_log_buffer_state - GuC log buffer state
+ *
+ * Below state structure is used for coordination of retrieval of GuC firmware
+ * logs. Separate state is maintained for each log buffer type.
+ * read_ptr points to the location where Xe read last in log buffer and
+ * is read only for GuC firmware. write_ptr is incremented by GuC with number
+ * of bytes written for each log entry and is read only for Xe.
+ * When any type of log buffer becomes half full, GuC sends a flush interrupt.
+ * GuC firmware expects that while it is writing to 2nd half of the buffer,
+ * first half would get consumed by Host and then get a flush completed
+ * acknowledgment from Host, so that it does not end up doing any overwrite
+ * causing loss of logs. So when buffer gets half filled & Xe has requested
+ * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
+ * to the value of write_ptr and raise the interrupt.
+ * On receiving the interrupt Xe should read the buffer, clear flush_to_file
+ * field and also update read_ptr with the value of sample_write_ptr, before
+ * sending an acknowledgment to GuC. marker & version fields are for internal
+ * usage of GuC and opaque to Xe. buffer_full_cnt field is incremented every
+ * time GuC detects the log buffer overflow.
+ */
+struct guc_log_buffer_state {
+	u32 marker[2];
+	u32 read_ptr;
+	u32 write_ptr;
+	u32 size;
+	u32 sampled_write_ptr;
+	u32 wrap_offset;
+	union {
+		struct {
+			u32 flush_to_file:1;
+			u32 buffer_full_cnt:4;
+			u32 reserved:27;
+		};
+		u32 flags;
+	};
+	u32 version;
+} __packed;
+
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum xe_guc_recv_message {
 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..c97fc4d57168 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,9 +9,30 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
+#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+			     __stringify(x), (long)(x))
+
+#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
+
+struct guc_log_section {
+	u32 max;
+	u32 flag;
+	u32 default_val;
+	const char *name;
+};
+
+static struct xe_gt *
+guc_to_gt(struct xe_guc *guc)
+{
+	return container_of(guc, struct xe_gt, uc.guc);
+}
+
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
 {
@@ -96,3 +117,161 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	return 0;
 }
+
+static void _guc_log_init_sizes(struct xe_guc_log *log)
+{
+	struct xe_guc *guc = log_to_guc(log);
+	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
+		{
+			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
+			"crash dump"
+		},
+		{
+			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
+			"debug",
+		},
+		{
+			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
+			GUC_LOG_CAPTURE_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
+			"capture",
+		}
+	};
+	int i;
+
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
+		log->sizes[i].bytes = sections[i].default_val;
+
+	/* If debug size > 1MB then bump default crash size to keep the same units */
+	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
+	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
+		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
+
+	/* Prepare the GuC API structure fields: */
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
+		/* Convert to correct units */
+		if ((log->sizes[i].bytes % SZ_1M) == 0) {
+			log->sizes[i].units = SZ_1M;
+			log->sizes[i].flag = sections[i].flag;
+		} else {
+			log->sizes[i].units = SZ_4K;
+			log->sizes[i].flag = 0;
+		}
+
+		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
+			xe_gt_err(guc_to_gt(guc), "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
+				  sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
+		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
+
+		if (!log->sizes[i].count) {
+			xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n", sections[i].name);
+		} else {
+			/* Size is +1 unit */
+			log->sizes[i].count--;
+		}
+
+		/* Clip to field size */
+		if (log->sizes[i].count > sections[i].max) {
+			xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs %d!\n",
+				  sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
+			log->sizes[i].count = sections[i].max;
+		}
+	}
+
+	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
+		xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug sections: %d vs %d!\n",
+			  log->sizes[GUC_LOG_SECTIONS_CRASH].units,
+			  log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
+		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
+		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
+	}
+
+	log->sizes_initialised = true;
+}
+
+static void guc_log_init_sizes(struct xe_guc_log *log)
+{
+	if (log->sizes_initialised)
+		return;
+
+	_guc_log_init_sizes(log);
+}
+
+static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
+}
+
+static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
+}
+
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
+}
+
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
+		xe_gt_notice_ratelimited(log_to_gt(log), "log buffer overflow\n");
+	}
+
+	return overflow;
+}
+
+unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
+					enum guc_log_buffer_type type)
+{
+	switch (type) {
+	case GUC_DEBUG_LOG_BUFFER:
+		return xe_guc_log_section_size_debug(log);
+	case GUC_CRASH_DUMP_LOG_BUFFER:
+		return xe_guc_log_section_size_crash(log);
+	case GUC_CAPTURE_LOG_BUFFER:
+		return xe_guc_log_section_size_capture(log);
+	default:
+		MISSING_CASE(type);
+	}
+
+	return 0;
+}
+
+size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
+				    enum guc_log_buffer_type type)
+{
+	enum guc_log_buffer_type i;
+	size_t offset = PAGE_SIZE;/* for the log_buffer_states */
+
+	for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
+		if (i == type)
+			break;
+		offset += xe_guc_get_log_buffer_size(log, i);
+	}
+
+	return offset;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..6a70185ce306 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_LOG_H_
 
 #include "xe_guc_log_types.h"
+#include "xe_guc_types.h"
 
 struct drm_printer;
 
@@ -36,6 +37,11 @@ struct drm_printer;
 #define GUC_VERBOSITY_TO_LOG_LEVEL(x)	((x) + 2)
 #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
 
+static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
+{
+	return container_of(log, struct xe_guc, log);
+}
+
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
 
@@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
 	return log->level;
 }
 
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
+
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
+				   enum guc_log_buffer_type type,
+				   unsigned int full_cnt);
+unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
+					enum guc_log_buffer_type type);
+size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
+				    enum guc_log_buffer_type type);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..3d4bf2a73102 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -7,6 +7,14 @@
 #define _XE_GUC_LOG_TYPES_H_
 
 #include <linux/types.h>
+#include "xe_guc_fwif.h"
+
+enum {
+	GUC_LOG_SECTIONS_CRASH,
+	GUC_LOG_SECTIONS_DEBUG,
+	GUC_LOG_SECTIONS_CAPTURE,
+	GUC_LOG_SECTIONS_LIMIT
+};
 
 struct xe_bo;
 
@@ -18,6 +26,22 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+
+	/* Allocation settings */
+	struct {
+		s32 bytes;	/* Size in bytes */
+		s32 units;	/* GuC API units - 1MB or 4KB */
+		s32 count;	/* Number of API units */
+		u32 flag;	/* GuC API units flag */
+	} sizes[GUC_LOG_SECTIONS_LIMIT];
+	bool sizes_initialised;
+
+	/* logging related stats */
+	struct {
+		u32 sampled_overflow;
+		u32 overflow;
+		u32 flush;
+	} stats[GUC_MAX_LOG_BUFFER];
 };
 
 #endif
-- 
2.34.1

