Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9047CCD18A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 21:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A550E10EB2E;
	Thu,  9 Oct 2025 21:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baCyqnZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A9710E24B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760047071; x=1791583071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=buWzrmx4D00QpjQkUwRMEe/IUZnK0YVyC0D/T61XMCE=;
 b=baCyqnZ59LdGI75WtiiW3kCBe+gMHu/wUnlipoULU7TGK6ko7Lcow67L
 DrhHzUnlXZzAw7MCqIq2AO6SedQ4D1Me8imHqdxbg5vxQ/jVVcLLvUPCc
 r8dNXMFU904vk9vkAz6aAPyKuBYW7qqcfBpNWi+GvxUhnpwji9lBamNce
 zkSw5CS14N3VEWeheDhm4xlp4cLo42vslHRD8GztUygtKyGd3d0trH/01
 2XkMMavPtuycX0T90ZdLgVfKBqSiT6kXqXz+bKpt2ZSOBzfAw+HfTWagf
 Uha2ichJ+SD6tZzrlvXoyUx9PZx810VZ0ISNfebn4LoMByebQ8wEIL9N6 A==;
X-CSE-ConnectionGUID: bTULDn/2Rxy3/mQmIfCKZw==
X-CSE-MsgGUID: yrqaVOUiQCiBnhjCoaanqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64889888"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="64889888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:57:51 -0700
X-CSE-ConnectionGUID: 9asa+rsFSE2JE1tA7cGHCQ==
X-CSE-MsgGUID: 2eT4vWx5SweOmrReDWD93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185199887"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 14:57:51 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 2/2] drm/xe/guc: Add prefix to guc log buffer macros
Date: Thu,  9 Oct 2025 17:57:49 -0400
Message-Id: <20251009215749.378905-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009215749.378905-1-zhanjun.dong@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
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

Add prefix to GuC log buffer macros to follow Xe naming styles.
Remove helper functions, replaced with macros.
Rename GuC log related macros.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h |   4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  23 ++---
 drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++--
 drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 121 ++++++++++-----------------
 drivers/gpu/drm/xe/xe_guc_log.h      |  14 ++--
 6 files changed, 75 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index b1819679fa35..fb5e2b8e7cf9 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -10,9 +10,9 @@
 
 /* GuC logging buffer types */
 enum guc_log_buffer_type {
-	GUC_LOG_BUFFER_DEBUG,
+	GUC_LOG_BUFFER_EVENT_DATA,
 	GUC_LOG_BUFFER_CRASH_DUMP,
-	GUC_LOG_BUFFER_CAPTURE,
+	GUC_LOG_BUFFER_STATE_CAPTURE,
 };
 
 #define GUC_LOG_BUFFER_TYPE_MAX		3
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..82a22479b741 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
 	u32 flags;
 
-	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
+	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
 	#define LOG_UNIT SZ_1M
 	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
 	#else
@@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	#define LOG_FLAG 0
 	#endif
 
-	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
+	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
 	#define CAPTURE_UNIT SZ_1M
 	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
 	#else
@@ -115,20 +115,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
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
index 243dad3e2418..49b47727cd5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
 {
 	int capture_size = guc_capture_output_size_est(guc);
 	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
-	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
 
 	/*
 	 * NOTE: capture_size is much smaller than the capture region
@@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
  *                  ADS module also calls separately for PF vs VF.
  *
  *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
- *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
+ *                  Size = #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
  *                  Note2: 'x 3' to hold multiple capture groups
  *
  * GUC Runtime notify capture:
@@ -1340,7 +1340,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
-		GUC_LOG_BUFFER_CAPTURE
+		GUC_LOG_BUFFER_STATE_CAPTURE
 	};
 
 	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
@@ -1357,8 +1357,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
 	u32 log_buf_state_offset;
 	u32 src_data_offset;
 
-	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
-	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
+	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_STATE_CAPTURE;
+	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE);
 
 	/*
 	 * Make a copy of the state structure, inside GuC log buffer
@@ -1368,15 +1368,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
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
+	guc->log.stats[GUC_LOG_BUFFER_STATE_CAPTURE].flush += tmp;
+	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE,
 						     full_count);
 
 	/* Now copy the actual logs. */
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 50c4c2406132..8b5c58b1857c 100644
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
index b5d837efaf74..90648968d4d9 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -19,6 +19,44 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+/*
+ *  GuC Log buffer Layout
+ *
+ *  +===============================+	      0000h
+ *  |    Crash dump state header    |		^
+ *  +-------------------------------+ 32B	|
+ *  |      Debug state header       |		|
+ *  +-------------------------------+ 64B	4KB
+ *  |     Capture state header      |		|
+ *  +-------------------------------+ 96B	|
+ *  |                               |		v
+ *  +===============================+ <--- EVENT_DATA offset
+ *  |  Event logs(raw data)         |		^
+ *  |                               |		|
+ *  |                               | EVENT_DATA_BUFFER_SIZE
+ *  |                               |		|
+ *  |                               |		v
+ *  +===============================+ <--- CRASH_DUMP offset
+ *  | Crash Dump(raw data)          |		^
+ *  |                               |		|
+ *  |                               | CRASH_DUMP_BUFFER_SIZE
+ *  |                               |		|
+ *  |                               |		v
+ *  +===============================+ <--- STATE_CAPTURE offset
+ *  | Error state capture(raw data) |		^
+ *  |                               |		|
+ *  |                               | STATE_CAPTURE_BUFFER_SIZE
+ *  |                               |		|
+ *  |                               |		v
+ *  +===============================+ Total: GUC_LOG_SIZE
+ */
+#define GUC_LOG_SIZE ((SZ_4K) + \
+		      (XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE) + \
+		      (XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) + \
+		      (XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE))
+
+#define GUC_LOG_CHUNK_SIZE	SZ_2M
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -37,33 +75,6 @@ log_to_xe(struct xe_guc_log *log)
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
@@ -257,7 +268,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
 
-	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
+	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE |
@@ -265,7 +276,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
+	xe_map_memset(xe, &bo->vmap, 0, 0, GUC_LOG_SIZE);
 	log->bo = bo;
 	log->level = xe_modparam.guc_log_level;
 
@@ -274,49 +285,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
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
 /**
  * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
  * @log: The log object.
@@ -327,17 +295,16 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
  */
 u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
 {
-	enum guc_log_buffer_type i;
 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
 
 	switch (type) {
-	case GUC_LOG_BUFFER_CAPTURE:
-		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
+	case GUC_LOG_BUFFER_STATE_CAPTURE:
+		offset += XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE;
 		fallthrough;
 	case GUC_LOG_BUFFER_CRASH_DUMP:
-		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
+		offset += XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE;
 		fallthrough;
-	case GUC_LOG_BUFFER_EVENT_LOG:
+	case GUC_LOG_BUFFER_EVENT_DATA:
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 98a47ac42b08..a3620462f44c 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -13,13 +13,13 @@ struct drm_printer;
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
 /*
  * While we're using plain log level in i915, GuC controls are much more...
@@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
 	return log->level;
 }
 
-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
 u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
 bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
 				   enum guc_log_buffer_type type,
-- 
2.34.1

