Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACB9CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 15:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDC010E1B8;
	Thu,  2 Oct 2025 15:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE/35cTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D06E10E7F2
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759417385; x=1790953385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=umB6AC6OxGdXjW9KXCX2pIM5g92HYH4ef3HVMulmEno=;
 b=ZE/35cTuLm/xALqLYgJDFGxFYK2pTO54K7OKsX9YLykT/xIh6z9UaLZk
 X1b2ZLiD3/B4cJGfGDtz+Lm6JCeRAZtcC4LSYmEHgz+SK+YLSfV5aEq7j
 B125cun8wXFJy8ON96iGCkUZNQKi5emIt4LaRM27YPHd6JTu+BPkwEU0w
 LTeeob8xP9/h6B/rl7w0O46vSHKhvR6vL4PsCwaXHqEyvWQnILk51Hbkp
 XXQJpeyzBrLloYI6rDkdM1yLeS2+szRjPz56675yWwzzEhIho73MACU/N
 /0SuwFmykGt3tc5MoLgvS0GSO9dqwZXQC+h45vCJ55fJ0ZtW5eV/pNhXv w==;
X-CSE-ConnectionGUID: aTppznWERPqzu2nG/tZ/JA==
X-CSE-MsgGUID: tjpovDACTPmVoZZzmyGypQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60741284"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60741284"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:03:05 -0700
X-CSE-ConnectionGUID: 5UDMtqaWRMGQMRdZGsvsOA==
X-CSE-MsgGUID: wKeVVXTtQfCdeCez5YV4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178334918"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa010.jf.intel.com with ESMTP; 02 Oct 2025 08:03:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
Date: Thu,  2 Oct 2025 11:03:01 -0400
Message-Id: <20251002150302.99524-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002150302.99524-1-zhanjun.dong@intel.com>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
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

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
 drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
 drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
 drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
 4 files changed, 36 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..b0ea9a13847a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
 	u32 flags;
 
-	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
+	#if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)
 	#define LOG_UNIT SZ_1M
 	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
 	#else
@@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	#define LOG_FLAG 0
 	#endif
 
-	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
+	#if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
 	#define CAPTURE_UNIT SZ_1M
 	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
 	#else
@@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	#define CAPTURE_FLAG 0
 	#endif
 
-	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
-	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
-	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
+	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
+	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, LOG_UNIT));
+	BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
 
 	flags = GUC_LOG_VALID |
 		GUC_LOG_NOTIFY_ON_HALF_FULL |
 		CAPTURE_FLAG |
 		LOG_FLAG |
-		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
-		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
-		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_DEBUG, XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / LOG_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_CAPTURE, XE_GUC_LOG_CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
 		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
 
 	#undef LOG_UNIT
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 243dad3e2418..acb95a93b530 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
 {
 	int capture_size = guc_capture_output_size_est(guc);
 	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
-	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+	u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
 
 	/*
 	 * NOTE: capture_size is much smaller than the capture region
@@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
  *                  ADS module also calls separately for PF vs VF.
  *
  *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
- *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
+ *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE (warns if on too-small)
  *                  Note2: 'x 3' to hold multiple capture groups
  *
  * GUC Runtime notify capture:
@@ -1368,7 +1368,7 @@ static void __guc_capture_process_output(struct xe_guc *guc)
 	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
 			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
 
-	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
+	buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
 	read_offset = log_buf_state_local.read_ptr;
 	write_offset = log_buf_state_local.sampled_write_ptr;
 	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..fa1d490dca0d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -50,16 +50,16 @@ static size_t guc_log_size(void)
 	 *  |     Capture state header      |
 	 *  +-------------------------------+ 96B
 	 *  |                               |
-	 *  +===============================+ PAGE_SIZE (4KB)
+	 *  +===============================+ 4KB
+	 *  |          Event logs           |
+	 *  +===============================+ + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
 	 *  |        Crash Dump logs        |
-	 *  +===============================+ + CRASH_SIZE
-	 *  |          Debug logs           |
-	 *  +===============================+ + DEBUG_SIZE
+	 *  +===============================+ + XE_GUC_LOG_CRASH_BUFFER_SIZE
 	 *  |         Capture logs          |
-	 *  +===============================+ + CAPTURE_SIZE
+	 *  +===============================+ + XE_GUC_LOG_CAPTURE_BUFFER_SIZE
 	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
-		CAPTURE_BUFFER_SIZE;
+	return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + XE_GUC_LOG_CRASH_BUFFER_SIZE +
+		XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
 }
 
 #define GUC_LOG_CHUNK_SIZE	SZ_2M
@@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
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
@@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
  */
 u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
 {
-	enum guc_log_buffer_type i;
 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
 
-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
-		if (i == type)
-			break;
-		offset += xe_guc_get_log_buffer_size(log, i);
+	switch (type) {
+	case GUC_LOG_BUFFER_CAPTURE:
+		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
+		fallthrough;
+	case GUC_LOG_BUFFER_CRASH_DUMP:
+		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
+		fallthrough;
+	case GUC_LOG_BUFFER_DEBUG:
+		break;
 	}
 
 	return offset;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 98a47ac42b08..0cc059cedb9c 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -13,13 +13,13 @@ struct drm_printer;
 struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-#define CRASH_BUFFER_SIZE       SZ_1M
-#define DEBUG_BUFFER_SIZE       SZ_8M
-#define CAPTURE_BUFFER_SIZE     SZ_2M
+#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE	SZ_8M
+#define XE_GUC_LOG_CRASH_BUFFER_SIZE		SZ_1M
+#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE		SZ_2M
 #else
-#define CRASH_BUFFER_SIZE	SZ_16K
-#define DEBUG_BUFFER_SIZE	SZ_64K
-#define CAPTURE_BUFFER_SIZE	SZ_1M
+#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE	SZ_64K
+#define XE_GUC_LOG_CRASH_BUFFER_SIZE		SZ_16K
+#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE		SZ_1M
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

