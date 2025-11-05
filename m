Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF6FCCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185D310E7CE;
	Wed,  5 Nov 2025 23:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmarVhkG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B4410E7CE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762385505; x=1793921505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/n3jl8I7R4pO8Yp1hiQu2xBHhuK9dJ9oPlGJFo3uKeM=;
 b=UmarVhkGrAR14jQtz5BveBfQrtJ3D7xvRZ/DCyruCIlx6ZErTfvfYboa
 Dv6DxOHhpAZpMp/pJW5Xh6kcA5DlwK7P/g4w66dmAX9nC4Ht01hB/pIo0
 pfC8l36XWv2Z5n4TnvNb7fEhag/1mS5eSTm0a9rRjevKht74ySCL/NfnV
 NRJ1C30p26KnAGKBrGcl88rz3O9SUNXU+RW99WDTqr5T0yPgkM6U99FwW
 8WROARreobocSZ7AJA8uZowGMYtS70L354ODDWRkbJweu13qL5W0LfIaQ
 cpHDr/3YDngTTanJ/NPwIaWe0n6g9h68Uq52c7Wq8ExszIuUmo5WVKD4f g==;
X-CSE-ConnectionGUID: 1BcXJoUsTHuTJ/ADK34ksA==
X-CSE-MsgGUID: 9MsIM1zORiSCAcX9dpclXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63523546"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="63523546"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:31:45 -0800
X-CSE-ConnectionGUID: kBps6JtfTU2QDEbD2I3pBw==
X-CSE-MsgGUID: ZLVCN7baSxqpWtYVMHuj1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="191950499"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa004.jf.intel.com with ESMTP; 05 Nov 2025 15:31:44 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8] drm/xe/guc: Cleanup GuC log buffer macros and helpers
Date: Wed,  5 Nov 2025 18:31:43 -0500
Message-Id: <20251105233143.1168759-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Cleanup GuC log buffer macros and helpers, add Xe style macro prefix.
Update buffer type values to align with the GuC specification
Update buffer offset calculation.
Remove helper functions, replaced with macros.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Change list:
v8: Kernel-doc fix
v7: Remove _BUFFER from macro names
    Move some macros/comments to other header files
    Replaced get log offset function with macros
v6: Avoid change same line in series twice, squash into single patch
    Correct PAGE_SIZE to 4K
    Promote memory layout comment to kernel-doc
v5: Change patch order
    Sync macro names across buffer type, size and GUC_CTL_LOG_PARAMS
    Replace guc_log_size with macro
    Update log buffer layout comments
v4: Replace helper functions with macros
    Rename log type xxx_DEBUG to xxx_EVENT_LOG
v3: Update comments
v2: Use SZ_4K, instead of PAGE_SIZE
    Expand for loop with switch and fallthrough
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h |  42 +++++++++--
 drivers/gpu/drm/xe/xe_guc.c          |  23 +++---
 drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++---
 drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 100 ++-------------------------
 drivers/gpu/drm/xe/xe_guc_log.h      |  29 +++++---
 6 files changed, 85 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 554630b7ccd9..fbf212d59a40 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -8,11 +8,45 @@
 
 #include <linux/types.h>
 
+/**
+ * DOC: GuC Log buffer Layout
+ *
+ * The in-memory log buffer layout is as follows::
+ *
+ *  +===============================+	      0000h
+ *  |    Crash dump state header    |		^
+ *  +-------------------------------+ 32B	|
+ *  |      Debug state header       |		|
+ *  +-------------------------------+ 64B	4KB
+ *  |     Capture state header      |		|
+ *  +-------------------------------+ 96B	|
+ *  |                               |		v
+ *  +===============================+ <--- EVENT_DATA_OFFSET
+ *  |  Event logs(raw data)         |		^
+ *  |                               |		|
+ *  |                               | EVENT_DATA_BUFFER_SIZE
+ *  |                               |		|
+ *  |                               |		v
+ *  +===============================+ <--- CRASH_DUMP_OFFSET
+ *  | Crash Dump(raw data)          |		^
+ *  |                               |		|
+ *  |                               | CRASH_DUMP_BUFFER_SIZE
+ *  |                               |		|
+ *  |                               |		v
+ *  +===============================+ <--- STATE_CAPTURE_OFFSET
+ *  | Error state capture(raw data) |		^
+ *  |                               |		|
+ *  |                               | STATE_CAPTURE_BUFFER_SIZE
+ *  |                               |		|
+ *  |                               |		v
+ *  +===============================+ Total: GUC_LOG_SIZE
+ */
+
 /* GuC logging buffer types */
-enum guc_log_buffer_type {
-	GUC_LOG_BUFFER_CRASH_DUMP,
-	GUC_LOG_BUFFER_DEBUG,
-	GUC_LOG_BUFFER_CAPTURE,
+enum guc_log_type {
+	GUC_LOG_TYPE_EVENT_DATA,
+	GUC_LOG_TYPE_CRASH_DUMP,
+	GUC_LOG_TYPE_STATE_CAPTURE,
 };
 
 #define GUC_LOG_BUFFER_TYPE_MAX		3
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e..5dab37644c28 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -102,7 +102,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
 	u32 flags;
 
-	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
+	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
 	#define LOG_UNIT SZ_1M
 	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
 	#else
@@ -110,7 +110,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	#define LOG_FLAG 0
 	#endif
 
-	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
+	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
 	#define CAPTURE_UNIT SZ_1M
 	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
 	#else
@@ -118,20 +118,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	#define CAPTURE_FLAG 0
 	#endif
 
-	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
-	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
-	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
+	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE, LOG_UNIT));
+	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE, LOG_UNIT));
+	BUILD_BUG_ON(!XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
 
 	flags = GUC_LOG_VALID |
 		GUC_LOG_NOTIFY_ON_HALF_FULL |
 		CAPTURE_FLAG |
 		LOG_FLAG |
-		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
-		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
-		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_CRASH_DUMP, XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE / LOG_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_EVENT_DATA, XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE / LOG_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_STATE_CAPTURE, XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE /
+			   CAPTURE_UNIT - 1) |
 		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
 
 	#undef LOG_UNIT
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 0c1fbe97b8bf..2cda92f7b323 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -843,7 +843,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
 {
 	int capture_size = guc_capture_output_size_est(guc);
 	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
-	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
 
 	/*
 	 * NOTE: capture_size is much smaller than the capture region
@@ -949,7 +949,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
  *                  ADS module also calls separately for PF vs VF.
  *
  *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
- *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
+ *                  Size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
  *                  Note2: 'x 3' to hold multiple capture groups
  *
  * GUC Runtime notify capture:
@@ -1367,7 +1367,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
-		GUC_LOG_BUFFER_CAPTURE
+		GUC_LOG_TYPE_STATE_CAPTURE
 	};
 
 	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
@@ -1384,8 +1384,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
 	u32 log_buf_state_offset;
 	u32 src_data_offset;
 
-	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
-	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
+	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_TYPE_STATE_CAPTURE;
+	src_data_offset = XE_GUC_LOG_STATE_CAPTURE_OFFSET;
 
 	/*
 	 * Make a copy of the state structure, inside GuC log buffer
@@ -1395,15 +1395,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
 	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
 			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
 
-	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
+	buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
 	read_offset = log_buf_state_local.read_ptr;
 	write_offset = log_buf_state_local.sampled_write_ptr;
 	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
 
 	/* Bookkeeping stuff */
 	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
-	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
-	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
+	guc->log.stats[GUC_LOG_TYPE_STATE_CAPTURE].flush += tmp;
+	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_TYPE_STATE_CAPTURE,
 						     full_count);
 
 	/* Now copy the actual logs. */
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index c90dd266e9cf..7d93c2749485 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -91,9 +91,9 @@ struct guc_update_exec_queue_policy {
 #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
 #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
 #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
-#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
-#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
-#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
+#define   GUC_LOG_CRASH_DUMP		REG_GENMASK(5, 4)
+#define   GUC_LOG_EVENT_DATA		REG_GENMASK(9, 6)
+#define   GUC_LOG_STATE_CAPTURE		REG_GENMASK(11, 10)
 #define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
 
 #define GUC_CTL_WA			1
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..29ea350157cc 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -19,6 +19,8 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+#define GUC_LOG_CHUNK_SIZE	SZ_2M
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -37,33 +39,6 @@ log_to_xe(struct xe_guc_log *log)
 	return gt_to_xe(log_to_gt(log));
 }
 
-static size_t guc_log_size(void)
-{
-	/*
-	 *  GuC Log buffer Layout
-	 *
-	 *  +===============================+ 00B
-	 *  |    Crash dump state header    |
-	 *  +-------------------------------+ 32B
-	 *  |      Debug state header       |
-	 *  +-------------------------------+ 64B
-	 *  |     Capture state header      |
-	 *  +-------------------------------+ 96B
-	 *  |                               |
-	 *  +===============================+ PAGE_SIZE (4KB)
-	 *  |        Crash Dump logs        |
-	 *  +===============================+ + CRASH_SIZE
-	 *  |          Debug logs           |
-	 *  +===============================+ + DEBUG_SIZE
-	 *  |         Capture logs          |
-	 *  +===============================+ + CAPTURE_SIZE
-	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
-		CAPTURE_BUFFER_SIZE;
-}
-
-#define GUC_LOG_CHUNK_SIZE	SZ_2M
-
 static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
 {
 	struct xe_guc_log_snapshot *snapshot;
@@ -257,7 +232,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
 
-	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
+	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE |
@@ -265,7 +240,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
+	xe_map_memset(xe, &bo->vmap, 0, 0, xe_bo_size(bo));
 	log->bo = bo;
 	log->level = xe_modparam.guc_log_level;
 
@@ -274,71 +249,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
 
-static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
-{
-	return CRASH_BUFFER_SIZE;
-}
-
-static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
-{
-	return DEBUG_BUFFER_SIZE;
-}
-
-/**
- * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
- * @log: The log object.
- *
- * This function will return the capture buffer size within log sections.
- *
- * Return: capture buffer size.
- */
-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
-{
-	return CAPTURE_BUFFER_SIZE;
-}
-
-/**
- * xe_guc_get_log_buffer_size - Get log buffer size for a type.
- * @log: The log object.
- * @type: The log buffer type
- *
- * Return: buffer size.
- */
-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
-{
-	switch (type) {
-	case GUC_LOG_BUFFER_CRASH_DUMP:
-		return xe_guc_log_section_size_crash(log);
-	case GUC_LOG_BUFFER_DEBUG:
-		return xe_guc_log_section_size_debug(log);
-	case GUC_LOG_BUFFER_CAPTURE:
-		return xe_guc_log_section_size_capture(log);
-	}
-	return 0;
-}
-
-/**
- * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
- * @log: The log object.
- * @type: The log buffer type
- *
- * This function will return the offset in the log buffer for a type.
- * Return: buffer offset.
- */
-u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
-{
-	enum guc_log_buffer_type i;
-	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
-
-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
-		if (i == type)
-			break;
-		offset += xe_guc_get_log_buffer_size(log, i);
-	}
-
-	return offset;
-}
-
 /**
  * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
  * @log: The log object.
@@ -352,7 +262,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
  *
  * Return: True if overflowed.
  */
-bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_type type,
 				   unsigned int full_cnt)
 {
 	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 98a47ac42b08..0bd5e89d75e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -13,14 +13,26 @@ struct drm_printer;
 struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-#define CRASH_BUFFER_SIZE       SZ_1M
-#define DEBUG_BUFFER_SIZE       SZ_8M
-#define CAPTURE_BUFFER_SIZE     SZ_2M
+#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
+#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
+#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
 #else
-#define CRASH_BUFFER_SIZE	SZ_16K
-#define DEBUG_BUFFER_SIZE	SZ_64K
-#define CAPTURE_BUFFER_SIZE	SZ_1M
+#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
+#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
+#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
 #endif
+
+#define GUC_LOG_SIZE (SZ_4K + \
+		      XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE + \
+		      XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE + \
+		      XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)
+
+#define XE_GUC_LOG_EVENT_DATA_OFFSET	SZ_4K
+#define XE_GUC_LOG_CRASH_DUMP_OFFSET	(XE_GUC_LOG_EVENT_DATA_OFFSET + \
+					 XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE)
+#define XE_GUC_LOG_STATE_CAPTURE_OFFSET	(XE_GUC_LOG_CRASH_DUMP_OFFSET + \
+					 XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE)
+
 /*
  * While we're using plain log level in i915, GuC controls are much more...
  * "elaborate"? We have a couple of bits for verbosity, separate bit for actual
@@ -51,11 +63,8 @@ xe_guc_log_get_level(struct xe_guc_log *log)
 	return log->level;
 }
 
-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
-u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
 bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
-				   enum guc_log_buffer_type type,
+				   enum guc_log_type type,
 				   unsigned int full_cnt);
 
 #endif
-- 
2.34.1

