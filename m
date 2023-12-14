Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23494C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E6610E90D;
	Thu, 14 Dec 2023 11:24:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50310E904
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553073; x=1734089073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j1SdQrA2CA6NM4z5XlGnd08aZUwlr+69ejUDAt+GOn8=;
 b=N3+xUlbtWcDR67vUf26KZ5K1PjQkXiQPDzmMH2N4XCf+SY4e2v51vyrc
 0/aQHzgzX0fFsyWmWyigcbKRy7CW6vU7RH6OsO1DzFYc5cwuN9OtF3V5b
 1lHEKTYGctU6ausP+rwO3FhzB6ScykYB2TfYGe5IX2WQMDr0tVn8kdLON
 4XuGaYsMptWSHlEvoGV6S9WX7zHIZjGiLoGjG8ZQ5+1SmCyFyT5FiFgaP
 4Q2QN00ZfO1XYgloSBThu2Mj4eLNewlfjxlXEn8i/Ww1EYjvau4/w+rCq
 pWLbhR9c7mA3qrIBbd0weq9WtyJihHK3+W+LK9AlWluq/w5avmcZbY+f4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940167"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714165"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:31 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 03/10] drm/xe: Move user engine class mappings to functions
Date: Thu, 14 Dec 2023 17:01:37 +0530
Message-Id: <20231214113144.251726-4-riana.tauro@intel.com>
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

Move user engine class <-> hw engine class to function
calls so that it can be used in different files.

No functional changes.

v2: change array to function

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 19 ++----------
 drivers/gpu/drm/xe/xe_hw_engine.c  | 50 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  3 ++
 drivers/gpu/drm/xe/xe_query.c      | 23 ++------------
 4 files changed, 57 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index eeb9605dd45f..98b1da77f8be 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -482,31 +482,16 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
 static struct xe_hw_engine *
 find_hw_engine(struct xe_device *xe,
 	       struct drm_xe_engine_class_instance eci)
 {
-	u32 idx;
-
-	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
-		return NULL;
 
 	if (eci.gt_id >= xe->info.gt_count)
 		return NULL;
 
-	idx = array_index_nospec(eci.engine_class,
-				 ARRAY_SIZE(user_to_xe_engine_class));
-
 	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+			       xe_hw_engine_from_user_class(eci.engine_class),
 			       eci.engine_instance, true);
 }
 
@@ -532,7 +517,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			continue;
 
 		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
+		    xe_hw_engine_from_user_class(DRM_XE_ENGINE_CLASS_COPY))
 			logical_mask |= BIT(hwe->logical_instance);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 86b863b99065..5b529324c89f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -264,6 +264,56 @@ static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 	return xe_mmio_read32(hwe->gt, reg);
 }
 
+/**
+ * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
+ * @engine_class: hw engine class
+ *
+ * Returns: user engine class on success, -1 on error
+ */
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
+{
+	switch (engine_class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return DRM_XE_ENGINE_CLASS_RENDER;
+	case XE_ENGINE_CLASS_COPY:
+		return DRM_XE_ENGINE_CLASS_COPY;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case XE_ENGINE_CLASS_COMPUTE:
+		return DRM_XE_ENGINE_CLASS_COMPUTE;
+	default:
+		XE_WARN_ON(engine_class);
+		return -1;
+	}
+}
+
+/**
+ * xe_hw_engine_from_user_class - converts xe user engine class to hw engine class
+ * @engine_class: user engine class
+ *
+ * Returns: hw engine class on success
+ */
+enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class)
+{
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return XE_ENGINE_CLASS_RENDER;
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return XE_ENGINE_CLASS_COPY;
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return XE_ENGINE_CLASS_VIDEO_DECODE;
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return XE_ENGINE_CLASS_COMPUTE;
+	default:
+		XE_WARN_ON(engine_class);
+		return XE_ENGINE_CLASS_MAX;
+	}
+}
+
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ccs_mask =
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..89ca96063644 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -62,6 +62,9 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
+enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class);
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
+
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe->name;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 56d61bf596b2..8b28cc376fff 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -22,22 +22,6 @@
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const u16 xe_to_user_engine_class[] = {
-	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
-	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
-	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
-};
-
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
 static size_t calc_hw_engine_info_size(struct xe_device *xe)
 {
 	struct xe_hw_engine *hwe;
@@ -139,10 +123,7 @@ query_engine_cycles(struct xe_device *xe,
 	if (!gt)
 		return -EINVAL;
 
-	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
-		return -EINVAL;
-
-	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
+	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(eci->engine_class),
 			      eci->engine_instance, true);
 	if (!hwe)
 		return -EINVAL;
@@ -208,7 +189,7 @@ static int query_engines(struct xe_device *xe,
 				continue;
 
 			engines->engines[i].instance.engine_class =
-				xe_to_user_engine_class[hwe->class];
+				xe_hw_engine_to_user_class(hwe->class);
 			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
 			engines->engines[i].instance.gt_id = gt->info.id;
-- 
2.40.0

