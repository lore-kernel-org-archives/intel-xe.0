Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BB5C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8510E92D;
	Thu, 14 Dec 2023 11:25:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E610E90D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553086; x=1734089086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8jUmUKWHaZVTC190p+Jb5nfDvLdAtE1gBiyXTGWWx8I=;
 b=L6iz0gBYzTQPGQljyRSfzqBczty7dIttOVZlOX+zopOKnJjuCUNDYdNw
 CThmqdLD41wQq+2P+olrzr7XKAWvzNbu+4rDx7Bvat4t+om3AFcQW8D5e
 /TByvawWc8WKa/k1nsCvi+HAVrhoMYGond5drLdyNyog2vL5qCqR5/fdr
 90nCwJTNJQLGflUzYEUmRJQlGCS+l/tDVIGKk45XaQWJYeXBL7O8TUjmD
 z+ZLFfAZkBgrcfJqnnX1clWiOwRnXMO1d3VbhhiNW+uLVkoYBuVOm9B/l
 WvBzqaJuXE09+7MsGEYmL/E+Oh51V+qXCixGWwGWcafvW8WHSz92vlmI7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940176"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714182"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:44 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 08/10] RFC drm/xe/guc: Expose engine busyness only for
 supported GuC version
Date: Thu, 14 Dec 2023 17:01:42 +0530
Message-Id: <20231214113144.251726-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
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

Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
to allow version comparisions. use compatibility version
for the same.

Engine busyness is supported only on GuC versions >= 70.11.1.
Allow enabling/reading engine busyness only on supported
GuC versions. Warn once if not supported.

v2: rebase
    fix guc comparison error (Matthew Brost)
    add a macro for guc version comparison

v3: do not show pmu counters if guc engine busyness
    is not supported

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 11 ++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  1 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 41 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +-
 drivers/gpu/drm/xe/xe_pmu.c                 | 12 ++++--
 5 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0e131b699a54..d946e51a3a06 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -818,3 +818,14 @@ u64 xe_gt_total_active_ticks(struct xe_gt *gt)
 {
 	return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
 }
+
+/**
+ * xe_gt_engine_busyness_supported - Checks support for engine busyness
+ * @gt: GT structure
+ *
+ * Returns true if engine busyness is supported, false otherwise.
+ */
+bool xe_gt_engine_busyness_supported(struct xe_gt *gt)
+{
+	return xe_guc_engine_busyness_supported(&gt->uc.guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 7e7828b12acd..41ed52c8b704 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -42,6 +42,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
+bool xe_gt_engine_busyness_supported(struct xe_gt *gt);
 u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
 u64 xe_gt_total_active_ticks(struct xe_gt *gt);
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 4c24f51f2fa3..c40625f41ae5 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -32,6 +32,9 @@
  * engine busyness % = (ticks_engine / ticks_gt) * 100
  */
 
+/* GuC version number components are only 8-bit, so converting to a 32bit 8.8.8 */
+#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
+
 static void guc_engine_busyness_usage_map(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
 					  struct iosys_map *engine_map,
@@ -110,6 +113,10 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!xe_guc_engine_busyness_supported(guc))
+		return;
+
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
 		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
@@ -122,6 +129,28 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(guc->busy.bo);
 }
 
+/*
+ * xe_guc_engine_busynes_supported- check if engine busyness is supported
+ * @guc: The GuC object
+ *
+ * Engine busyness is supported only above guc 70.11.1
+ *
+ * Returns true if supported, false otherwise
+ */
+bool xe_guc_engine_busyness_supported(struct xe_guc *guc)
+{
+	struct xe_uc_fw *uc_fw = &guc->fw;
+	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
+
+	if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(1, 3, 1))
+		return true;
+
+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
+			 "Engine busyness not supported in this GuC version\n");
+
+	return false;
+}
+
 /*
  * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
  * @guc: The GuC object
@@ -132,6 +161,10 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
 {
 	u64 ticks_gt;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!xe_guc_engine_busyness_supported(guc))
+		return 0;
+
 	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
 
 	return ticks_gt;
@@ -149,6 +182,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
 	u64 ticks_engine;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!xe_guc_engine_busyness_supported(guc))
+		return 0;
+
 	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
 
 	return ticks_engine;
@@ -172,6 +209,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
 	u32 size;
 	int err;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!xe_guc_engine_busyness_supported(guc))
+		return 0;
+
 	/* Initialization already done */
 	if (guc->busy.bo)
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
index 57325910ebc4..e3c74e0236af 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -14,5 +14,5 @@ struct xe_guc;
 int xe_guc_engine_busyness_init(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
-
+bool xe_guc_engine_busyness_supported(struct xe_guc *guc);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 74212d8c5434..9c8591d59b54 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -55,14 +55,16 @@ static int
 config_status(struct xe_device *xe, u64 config)
 {
 	unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
 
 	if (gt_id >= XE_PMU_MAX_GT)
 		return -ENOENT;
 
-	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
-		return 0;
+	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0) &&
+	    !xe_gt_engine_busyness_supported(gt))
+		return -ENOENT;
 
-	return -ENOENT;
+	return 0;
 }
 
 static int engine_event_status(struct xe_hw_engine *hwe,
@@ -71,6 +73,10 @@ static int engine_event_status(struct xe_hw_engine *hwe,
 	if (!hwe)
 		return -ENODEV;
 
+	if (sample == DRM_XE_PMU_SAMPLE_BUSY_TICKS &&
+	    !xe_gt_engine_busyness_supported(hwe->gt))
+		return -ENOENT;
+
 	/* Other engine events will be added, XE_ENGINE_SAMPLE_COUNT will be changed */
 	return (sample >= DRM_XE_PMU_SAMPLE_BUSY_TICKS && sample < XE_ENGINE_SAMPLE_COUNT)
 		? 0 : -ENOENT;
-- 
2.40.0

