Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA181C46CD8
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE7C10E760;
	Fri, 22 Dec 2023 07:38:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9728710E756
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230736; x=1734766736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WdQJM6KnlmAxfA6RZCNzbtI4L2qhMARjbEwU5WvMbSo=;
 b=k6jZM+rqrEGCINNRuBGZLMEzfWkhYcRQspZf4RUXHXTw3ODjUQoZYw4I
 ohubzBWFCKrH8gvwPQYnlvy1encykLt0VQX7KCcH9BY1Fqvv/G4KChno+
 uSBZj6ExybA38Ql8gttsID33V3siwMHxduRXyPo2XQWCYwW9z9oGFhC8K
 iER7geUnaQ/xENq59jNzsA7OYXVco8nP/ZsYQzjekAGnogBNu+XIxW82c
 v6qpwKIF49YnrjxUCcED9y0cyV82xvfneLONXG8qLJkI9mQa3v4rCzQQV
 6CoI6fp52gUvoA/Iv6U4H4w+ajhEQOGSP0vIkpprJWyziZKpFVFXGvvvC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9481072"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9481072"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920582610"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920582610"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:53 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 6/8] drm/xe/guc: Expose engine busyness only for supported
 GuC version
Date: Fri, 22 Dec 2023 13:16:00 +0530
Message-Id: <20231222074602.817518-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231222074602.817518-1-riana.tauro@intel.com>
References: <20231222074602.817518-1-riana.tauro@intel.com>
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

v4: add version check comment only in the check function
    remove it otherwise (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 11 ++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  1 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 37 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +-
 drivers/gpu/drm/xe/xe_pmu.c                 | 12 +++++--
 5 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5825471a3422..a48cceaa7750 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -800,3 +800,14 @@ u64 xe_gt_total_active_ticks(struct xe_gt *gt)
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
index 9bac85cdf609..bef99eb2fed2 100644
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
index 24e72555647a..2dd06563d0ad 100644
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
@@ -110,6 +113,9 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
+	if (!xe_guc_engine_busyness_supported(guc))
+		return;
+
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
 		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
@@ -122,6 +128,28 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
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
+			 "Engine busyness supported from 70.11.1 GuC version\n");
+
+	return false;
+}
+
 /*
  * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
  * @guc: The GuC object
@@ -133,6 +161,9 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
 {
 	u64 ticks_gt;
 
+	if (!xe_guc_engine_busyness_supported(guc))
+		return 0;
+
 	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
 
 	return ticks_gt;
@@ -150,6 +181,9 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
 	u64 ticks_engine;
 
+	if (!xe_guc_engine_busyness_supported(guc))
+		return 0;
+
 	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
 
 	return ticks_engine;
@@ -173,6 +207,9 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
 	u32 size;
 	int err;
 
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
index c2be157a6f5d..f91652886b67 100644
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

