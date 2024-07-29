Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEF2C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 13:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318110E3CC;
	Mon, 29 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv4+f6to";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F5510E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722258651; x=1753794651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JglDfZ/VUC6wa/ZqWCafTUvYyy9OFXGlz/KyGx02oB8=;
 b=Iv4+f6tomqDKvHRWfFZLI1VK/6ViCRkzERuO8OV00U14ADF7r5so7uOu
 w6O/eZUzRjwNGRD7uWeEC5oHfbZ+lKSlO8Y5rrV3T5KQjWlziq6b0lvjl
 4fQwoC5oGXQu3+Cp1oXIWsqXJc5fcH45MgYmR0IYVf4tQVxWadGB3Ffp0
 6noB17ghNIXVosdsl7KgmyT9W2xQ3ZXTm/mcJKS3/AyTJ4AqZDhcOx8XF
 iR5r1ViMHzUDqNmkR/afQFz98rhu3/HzKe3iFwT7msBTBN/p6XoN26Q7R
 h42M9vM262C0pJ/V1IfCo2Z/lQZSytGJ2WSfMEimPuIwAx0lat4tfNAUs A==;
X-CSE-ConnectionGUID: C1hcHTDeTsC3dcSWFjKqpg==
X-CSE-MsgGUID: +UeNjpnLQBeYMVy9WefBug==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31161311"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31161311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:10:50 -0700
X-CSE-ConnectionGUID: 7wP5aGhNR0izGdpnVimSfA==
X-CSE-MsgGUID: KIc3a9DcRXCdO5Qr8pEY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="77202421"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:10:48 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Move and export xe_hw_engine lookup.
Date: Mon, 29 Jul 2024 16:01:52 +0300
Message-Id: <20240729130152.100130-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Move and export xe_hw_engine lookup. This is in preparation
to use this in eudebug code where we want to find active
engine.

v2: s/tile/gt due to uapi changes (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++--------------------------
 drivers/gpu/drm/xe/xe_hw_engine.c  | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  7 ++++++
 3 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 69867a7b7c77..956dc15b432a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -413,34 +413,6 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
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
-static struct xe_hw_engine *
-find_hw_engine(struct xe_device *xe,
-	       struct drm_xe_engine_class_instance eci)
-{
-	u32 idx;
-
-	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
-		return NULL;
-
-	if (eci.gt_id >= xe->info.gt_count)
-		return NULL;
-
-	idx = array_index_nospec(eci.engine_class,
-				 ARRAY_SIZE(user_to_xe_engine_class));
-
-	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
-			       eci.engine_instance, true);
-}
-
 static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 					struct drm_xe_engine_class_instance *eci,
 					u16 width, u16 num_placements)
@@ -462,8 +434,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 		if (xe_hw_engine_is_reserved(hwe))
 			continue;
 
-		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
+		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			logical_mask |= BIT(hwe->logical_instance);
 	}
 
@@ -492,7 +463,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 
 			n = j * width + i;
 
-			hwe = find_hw_engine(xe, eci[n]);
+			hwe = xe_hw_engine_lookup(xe, eci[n]);
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return 0;
 
@@ -571,7 +542,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, !logical_mask))
 				return -EINVAL;
 
-			hwe = find_hw_engine(xe, eci[0]);
+			hwe = xe_hw_engine_lookup(xe, eci[0]);
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
@@ -608,7 +579,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (XE_IOCTL_DBG(xe, !logical_mask))
 			return -EINVAL;
 
-		hwe = find_hw_engine(xe, eci[0]);
+		hwe = xe_hw_engine_lookup(xe, eci[0]);
 		if (XE_IOCTL_DBG(xe, !hwe))
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 07ed9fd28f19..00ace5fcc284 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -5,7 +5,10 @@
 
 #include "xe_hw_engine.h"
 
+#include <linux/nospec.h>
+
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -1135,3 +1138,31 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
 {
 	return engine_infos[hwe->engine_id].domain;
 }
+
+static const enum xe_engine_class user_to_xe_engine_class[] = {
+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
+};
+
+struct xe_hw_engine *
+xe_hw_engine_lookup(struct xe_device *xe,
+		    struct drm_xe_engine_class_instance eci)
+{
+	unsigned int idx;
+
+	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
+		return NULL;
+
+	if (eci.gt_id >= xe->info.gt_count)
+		return NULL;
+
+	idx = array_index_nospec(eci.engine_class,
+				 ARRAY_SIZE(user_to_xe_engine_class));
+
+	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
+			       user_to_xe_engine_class[idx],
+			       eci.engine_instance, true);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 900c8c991430..d227ffe557eb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -9,6 +9,8 @@
 #include "xe_hw_engine_types.h"
 
 struct drm_printer;
+struct drm_xe_engine_class_instance;
+struct xe_device;
 
 #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
 #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
@@ -62,6 +64,11 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
+
+struct xe_hw_engine *
+xe_hw_engine_lookup(struct xe_device *xe,
+		    struct drm_xe_engine_class_instance eci);
+
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe->name;
-- 
2.34.1

