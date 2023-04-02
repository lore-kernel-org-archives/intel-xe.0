Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02171C76196
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 07:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350A710E273;
	Sun,  2 Apr 2023 07:09:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820D10E273
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680419365; x=1711955365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F9yO4yL5wZ1DYxikCCt4p+XeHkS9sPonh1NRWrs9UdQ=;
 b=nupJjRKJZcI8PuEVpvIgaHnnGISTuTkDAZWnPprzLNQC6Vc/sduOtPly
 aBb6agjdWG84TD+3BrNChINtcF9I7Qr0toGz/rlUBtP/eFi8OitS6WQKW
 UUZg6nnxj2TvQPGMj0+R1bTeyRQAefx5ryJQ99YYkL2upu2qfCwox0yy0
 KyLvi8g9ihP3FDCkx5lO3h+jIfWttPxgedB1pt44cYXqAX1IsEG1zfyr/
 gWbUPUah5lxHNYBo7WJ81OD1ZIl/gUJii/O21MtcmAruV/llfIgoUYO/7
 knktUqZAPHPV97Ftz+MyjsWfjQCDugxa2qOFvpiD98hFL6r1nuaoj5v8b Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340441437"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="340441437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 00:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="754854882"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="754854882"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 00:09:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun,  2 Apr 2023 00:09:30 -0700
Message-Id: <20230402070930.2994410-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix driver load with
 CONFIG_DRM_XE_LARGE_GUC_BUFFER
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

While debugging [1] I noticed the GuC log was corrupt. I believe our
logic to program the GuC log size was incorrect resulting driver load
failures. Shameless copy from to fix this. A follow up will wire the GuC
log sizes to modparams.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c           |  47 ++-------
 drivers/gpu/drm/xe/xe_guc_log.c       | 145 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h       |   9 --
 drivers/gpu/drm/xe/xe_guc_log_types.h |  20 ++++
 4 files changed, 167 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 58b9841616e4..1694fdc3a7fa 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -69,54 +69,21 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 {
+	struct xe_guc_log *log = &guc->log;
 	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
 	u32 flags;
 
-	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
-	#define LOG_UNIT SZ_1M
-	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
-	#else
-	#define LOG_UNIT SZ_4K
-	#define LOG_FLAG 0
-	#endif
-
-	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
-	#define CAPTURE_UNIT SZ_1M
-	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
-	#else
-	#define CAPTURE_UNIT SZ_4K
-	#define CAPTURE_FLAG 0
-	#endif
-
-	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
-	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
-	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
-
-	BUILD_BUG_ON((CRASH_BUFFER_SIZE / LOG_UNIT - 1) >
-			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
-	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) >
-			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
-	BUILD_BUG_ON((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) >
-			(GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT));
+	XE_BUG_ON(!log->sizes_initialised);
 
 	flags = GUC_LOG_VALID |
 		GUC_LOG_NOTIFY_ON_HALF_FULL |
-		CAPTURE_FLAG |
-		LOG_FLAG |
-		((CRASH_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
-		((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
-		((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) <<
-		 GUC_LOG_CAPTURE_SHIFT) |
+		log->sizes[GUC_LOG_SECTIONS_DEBUG].flag |
+		log->sizes[GUC_LOG_SECTIONS_CAPTURE].flag |
+		(log->sizes[GUC_LOG_SECTIONS_CRASH].count << GUC_LOG_CRASH_SHIFT) |
+		(log->sizes[GUC_LOG_SECTIONS_DEBUG].count << GUC_LOG_DEBUG_SHIFT) |
+		(log->sizes[GUC_LOG_SECTIONS_CAPTURE].count << GUC_LOG_CAPTURE_SHIFT) |
 		(offset << GUC_LOG_BUF_ADDR_SHIFT);
 
-	#undef LOG_UNIT
-	#undef LOG_FLAG
-	#undef CAPTURE_UNIT
-	#undef CAPTURE_FLAG
-
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 9a7b5d5906c1..f171b997b4cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -12,6 +12,16 @@
 #include "xe_map.h"
 #include "xe_module.h"
 
+#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
+#define CRASH_BUFFER_SIZE       SZ_1M
+#define DEBUG_BUFFER_SIZE       SZ_8M
+#define CAPTURE_BUFFER_SIZE     SZ_2M
+#else
+#define CRASH_BUFFER_SIZE	SZ_8K
+#define DEBUG_BUFFER_SIZE	SZ_64K
+#define CAPTURE_BUFFER_SIZE	SZ_16K
+#endif
+
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
 {
@@ -24,7 +34,130 @@ log_to_xe(struct xe_guc_log *log)
 	return gt_to_xe(log_to_gt(log));
 }
 
-static size_t guc_log_size(void)
+struct guc_log_section {
+	u32 max;
+	u32 flag;
+	u32 default_val;
+	const char *name;
+};
+
+static s32 scale_log_param(struct xe_guc_log *log,
+			   const struct guc_log_section *section)
+{
+	/* XXX: Add modparams */
+	return section->default_val;
+}
+
+static void _guc_log_init_sizes(struct xe_guc_log *log)
+{
+	struct xe_device *xe = log_to_xe(log);
+	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
+		{
+			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			CRASH_BUFFER_SIZE,
+			"crash dump"
+		},
+		{
+			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			DEBUG_BUFFER_SIZE,
+			"debug",
+		},
+		{
+			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
+			GUC_LOG_CAPTURE_ALLOC_UNITS,
+			CAPTURE_BUFFER_SIZE,
+			"capture",
+		}
+	};
+	int i;
+
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
+		log->sizes[i].bytes = scale_log_param(log, sections + i);
+
+	/* If debug size > 1MB then bump default crash size to keep the same units */
+	if ((log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M) &&
+	    (CRASH_BUFFER_SIZE < SZ_1M))
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
+			drm_err(&xe->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
+				sections[i].name, log->sizes[i].bytes,
+				log->sizes[i].units);
+		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
+
+		if (!log->sizes[i].count) {
+			drm_err(&xe->drm, "Zero GuC log %s size!",
+				sections[i].name);
+		} else {
+			/* Size is +1 unit */
+			log->sizes[i].count--;
+		}
+
+		/* Clip to field size */
+		if (log->sizes[i].count > sections[i].max) {
+			drm_err(&xe->drm, "GuC log %s size too large: %d vs %d!",
+				sections[i].name, log->sizes[i].count + 1,
+				sections[i].max + 1);
+			log->sizes[i].count = sections[i].max;
+		}
+	}
+
+	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units !=
+	    log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
+		drm_err(&xe->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
+			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
+			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
+		log->sizes[GUC_LOG_SECTIONS_CRASH].units =
+			log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
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
+static size_t guc_log_size(struct xe_guc_log *log)
 {
 	/*
 	 *  GuC Log buffer Layout
@@ -45,8 +178,10 @@ static size_t guc_log_size(void)
 	 *  |         Capture logs          |
 	 *  +===============================+ + CAPTURE_SIZE
 	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
-		CAPTURE_BUFFER_SIZE;
+	return PAGE_SIZE +
+		xe_guc_log_section_size_crash(log) +
+		xe_guc_log_section_size_debug(log) +
+		xe_guc_log_section_size_capture(log);
 }
 
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
@@ -91,14 +226,14 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_bo *bo;
 	int err;
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_log_size(),
+	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_log_size(log),
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
+	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size(log));
 	log->bo = bo;
 	log->level = xe_guc_log_level;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..52dc264ca540 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -10,15 +10,6 @@
 
 struct drm_printer;
 
-#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
-#define CRASH_BUFFER_SIZE       SZ_1M
-#define DEBUG_BUFFER_SIZE       SZ_8M
-#define CAPTURE_BUFFER_SIZE     SZ_2M
-#else
-#define CRASH_BUFFER_SIZE	SZ_8K
-#define DEBUG_BUFFER_SIZE	SZ_64K
-#define CAPTURE_BUFFER_SIZE	SZ_16K
-#endif
 /*
  * While we're using plain log level in i915, GuC controls are much more...
  * "elaborate"? We have a couple of bits for verbosity, separate bit for actual
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..8807d7bc6ec9 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -10,6 +10,13 @@
 
 struct xe_bo;
 
+enum {
+	GUC_LOG_SECTIONS_CRASH,
+	GUC_LOG_SECTIONS_DEBUG,
+	GUC_LOG_SECTIONS_CAPTURE,
+	GUC_LOG_SECTIONS_LIMIT
+};
+
 /**
  * struct xe_guc_log - GuC log
  */
@@ -18,6 +25,19 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+	/** @sizes: Allocation settings */
+	struct {
+		/** @bytes: Size in bytes */
+		s32 bytes;
+		/** @units: GuC API units - 1MB or 4KB */
+		s32 units;
+		/** @count: Number of API units */
+		s32 count;
+		/** @flag: GuC API units flag */
+		u32 flag;
+	} sizes[GUC_LOG_SECTIONS_LIMIT];
+	/** @sizes_initialised: sizes of log initialized */
+	bool sizes_initialised;
 };
 
 #endif
-- 
2.34.1

