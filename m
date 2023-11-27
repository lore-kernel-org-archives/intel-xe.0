Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E46C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB95B10E2BC;
	Mon, 27 Nov 2023 14:04:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B3610E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701093866; x=1732629866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Q8MvUc6yDHBM6tYRsAj2dbhAlo3YKJ618AVM4sk1XM=;
 b=WBep0wfA0YhtMmYvAz4vqlQT43JF7FljyAbJIsaj859LyRzB1yjS1l9G
 Kj8DmPiIb78R3L20aGO3lxTJTOeSdlBeB7v6frIfnbDQojYldhF6XWC2H
 6a/4XjXOHB4PdGgYQh/smj6I2JUURlAfiLXhQDAR5Dk5qUaqrUw2LyzXC
 ouJZ963zCe4UfWkyKcCj4Ni2SWK/gVA822udB0vypiWLK5ihWQhRPzmRR
 Sw/3wQX2xGcXakB1Hp4acLCWdEPBFptVz/k+7YWeQNmRh6FndU/2ePkUw
 4dxmiRtlhqjAKCmkNF5BW0mHfWkuTpZub9DU/veob5ydUp/bitPvUcD9H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="457039788"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="457039788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761604435"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761604435"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:11 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 19:41:18 +0530
Message-Id: <20231127141125.2913415-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231127141125.2913415-1-riana.tauro@intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/8] RFC drm/xe: Move user engine class mappings
 to header
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

Move user engine class <-> hw engine class to header
files so that it can be used by perf component.

No functional changes.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 17 +++++------------
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_query.c           | 22 +++-------------------
 3 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 62d0237e724e..6f27b78666f6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -482,31 +482,24 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
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
 	u32 idx;
 
-	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
+	if (eci.engine_class > ARRAY_SIZE(xe_user_to_engine_class))
 		return NULL;
 
 	if (eci.gt_id >= xe->info.gt_count)
 		return NULL;
 
 	idx = array_index_nospec(eci.engine_class,
-				 ARRAY_SIZE(user_to_xe_engine_class));
+				 ARRAY_SIZE(xe_user_to_engine_class));
+
 
 	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+			       xe_user_to_engine_class[idx],
 			       eci.engine_instance, true);
 }
 
@@ -532,7 +525,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			continue;
 
 		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
+		    xe_user_to_engine_class[DRM_XE_ENGINE_CLASS_COPY])
 			logical_mask |= BIT(hwe->logical_instance);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 39908dec042a..8269f77c4ca2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_HW_ENGINE_TYPES_H_
 #define _XE_HW_ENGINE_TYPES_H_
 
+#include <drm/xe_drm.h>
+
 #include "xe_force_wake_types.h"
 #include "xe_lrc_types.h"
 #include "xe_reg_sr_types.h"
@@ -58,6 +60,22 @@ enum xe_hw_engine_id {
 	XE_NUM_HW_ENGINES,
 };
 
+static const u16 xe_engine_to_user_class[] = {
+	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
+	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
+	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
+};
+
+static const enum xe_engine_class xe_user_to_engine_class[] = {
+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
+};
+
 /* FIXME: s/XE_HW_ENGINE_MAX_INSTANCE/XE_HW_ENGINE_MAX_COUNT */
 #define XE_HW_ENGINE_MAX_INSTANCE	9
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 61a7d92b7e88..caa98c6b5853 100644
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
@@ -138,10 +122,10 @@ query_engine_cycles(struct xe_device *xe,
 	if (!gt)
 		return -EINVAL;
 
-	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
+	if (eci->engine_class >= ARRAY_SIZE(xe_user_to_engine_class))
 		return -EINVAL;
 
-	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
+	hwe = xe_gt_hw_engine(gt, xe_user_to_engine_class[eci->engine_class],
 			      eci->engine_instance, true);
 	if (!hwe)
 		return -EINVAL;
@@ -212,7 +196,7 @@ static int query_engines(struct xe_device *xe,
 				continue;
 
 			hw_engine_info[i].engine_class =
-				xe_to_user_engine_class[hwe->class];
+				xe_engine_to_user_class[hwe->class];
 			hw_engine_info[i].engine_instance =
 				hwe->logical_instance;
 			hw_engine_info[i].gt_id = gt->info.id;
-- 
2.40.0

