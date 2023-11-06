Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B7C001DB
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A552110E2D6;
	Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA4010E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269754; x=1730805754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFY5/mVJ2BymwL/gotwgZXnhM9gKZmkrmb/uvci/5Zg=;
 b=Aq7GTU/VAdVAl5KE6bvYVNGL35o0VDgm2ciKlrMhPXJ846S3tNUqHcZc
 oZxJgEQZgsniLbqkxZLT4+JhH79QGEi3fl9AzGTKL9fQhC9XQ91kGBy+T
 EJy3zaxIncr3mwv0CFj2EDbHrGNryh9dZDvtHt3zZyJlRBOuSoDmrUESs
 inyRjjBJtjCYlNFTPW1Q+0k5/jzvWg9rjCf3iYuJe4O5QDbistZewffRM
 YEWr+Ge0Ysl3S3vja5kgFFgy4GJGjGP3+iWLgRh3Lyqk6qLszK46ybjfE
 /9yugBjZgJr1Mcg3ekWIhffiAjYht2NBDtRvzWRp7BSWY08yA5hJ1A42D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646799"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646799"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411601"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411601"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:24 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:30 +0200
Message-Id: <20231106111845.2333093-11-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 10/25] drm/xe: Move and export xe_hw_engine lookup.
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++--------------------------
 drivers/gpu/drm/xe/xe_hw_engine.c  | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  6 +++++
 3 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bc21026a6083..bf86a3d7ffb3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -504,34 +504,6 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
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
-	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
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
@@ -553,8 +525,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 		if (xe_hw_engine_is_reserved(hwe))
 			continue;
 
-		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
+		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			logical_mask |= BIT(hwe->logical_instance);
 	}
 
@@ -583,7 +554,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 
 			n = j * width + i;
 
-			hwe = find_hw_engine(xe, eci[n]);
+			hwe = xe_hw_engine_lookup(xe, eci[n]);
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return 0;
 
@@ -664,7 +635,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, !logical_mask))
 				return -EINVAL;
 
-			hwe = find_hw_engine(xe, eci[0]);
+			hwe = xe_hw_engine_lookup(xe, eci[0]);
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
@@ -705,7 +676,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (XE_IOCTL_DBG(xe, !logical_mask))
 			return -EINVAL;
 
-		hwe = find_hw_engine(xe, eci[0]);
+		hwe = xe_hw_engine_lookup(xe, eci[0]);
 		if (XE_IOCTL_DBG(xe, !hwe))
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b86632972e7c..8b8cf2ab1d33 100644
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
@@ -849,3 +852,30 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
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
+xe_hw_engine_lookup(struct xe_device *xe, struct drm_xe_engine_class_instance eci)
+{
+	u32 idx;
+
+	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
+		return NULL;
+
+	if (eci.gt_id >= xe->info.tile_count)
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
index f83a42b2f0d3..d67c85282ed0 100644
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

