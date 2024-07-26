Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFC1C3DA70
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAD910E9A4;
	Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wv88Hytw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A5810E9A3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MOLCSYAMesv1wlz+ugyZBZWAPYlni/wYX8Po3UVSVQQ=;
 b=Wv88HytwCJajXkc+OyENPD+qbiPbSgxJZ8B2Faq82Bv3Xl+Y6e1HFAxG
 /uX3U6qnFWwOuBskl2Lb/sXSgWF+0g/px1w6TicC9e7O+5yqtrI9T/gyg
 HEknP0oPmd4HZur5pHTPjZtHM/Mj5YaCCNjrIPQVI421ZQVpv0MKxxRYB
 51rt1RDlGyExnIVHLBd+1f4J6G8Qwgixs1XSML7y37gvPQbovdzDDJ/ZN
 rpo+SmOcA6beiSeYeA86c6mhMqLQflti1ig4H20D+QzKMD2wcW5FTZg48
 8nWi0znzwVSudt3yw58Pe2OstQQZLbDApuAgcdkIgfyzz5hfUlTLbQ3tV A==;
X-CSE-ConnectionGUID: rS3hXRtcTReI8VIuBglqmQ==
X-CSE-MsgGUID: 0pTFlSNCTY6nLBrAqk9Utw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598744"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:17 -0700
X-CSE-ConnectionGUID: +vx/YjUmQ+6Lwwo6KiKTjw==
X-CSE-MsgGUID: Bvgnn7IzRT2gttbkLrknSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861343"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:16 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 02/21] drm/xe: Move and export xe_hw_engine lookup.
Date: Fri, 26 Jul 2024 17:07:59 +0300
Message-Id: <20240726140818.54304-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++--------------------------
 drivers/gpu/drm/xe/xe_hw_engine.c  | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  6 +++++
 3 files changed, 41 insertions(+), 33 deletions(-)

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
index b8c0cfbf8b49..20c4fdf40790 100644
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
@@ -1134,3 +1137,31 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
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
index 08c3a9df7154..0383aa7d8e89 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -9,6 +9,8 @@
 #include "xe_hw_engine_types.h"
 
 struct drm_printer;
+struct drm_xe_engine_class_instance;
+struct xe_device;
 
 #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
 #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
@@ -67,6 +69,10 @@ void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val
 
 u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
 
+struct xe_hw_engine *
+xe_hw_engine_lookup(struct xe_device *xe,
+		    struct drm_xe_engine_class_instance eci);
+
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe->name;
-- 
2.34.1

