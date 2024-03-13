Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC125C54E68
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3B10F082;
	Wed, 13 Mar 2024 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2GCw/GX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833CA10F027
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367890; x=1741903890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oavOsGibw9xymeic0gVfKTSiedONgBHCref8yaNj6Lo=;
 b=N2GCw/GXn7Fv+MgopvwjV5lYFcJomjaMJ4FXMc2dMlG9Rds96tXwDFMu
 mED70l13W9gANzauaqr8Ci4UMl+wusKHC3fGad2M/LsF/h/yUfJ29VPoU
 sylegwCK0bE+wbjWpuLLW9SDiHcchwi6VjlkQPqccyUqNgDDKfPtRlHA9
 KIAbuGtIKQSkkcETOkoWxzIOEIRfRGgfRL4xBoInM2U+ebHkRyuAL5rBl
 dT05Wdcam6pAjXIqdRMja74FykFzwnWEMIyRr9RPReLSBMpGcFWDMP3Jx
 1WOUTUvO2SMUp67ohYVOEKrk2Vwfn60kyprxljRJaFgWjdECLDpzfJLGH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5027642"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5027642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11964323"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] drm/xe/guc: Use GuC ID Manager in submission code
Date: Wed, 13 Mar 2024 23:11:12 +0100
Message-Id: <20240313221112.1089-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313221112.1089-1-michal.wajdeczko@intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
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

We are ready to replace private guc_ids management code with
separate GuC ID Manager that can be shared with upcoming SR-IOV
PF provisioning code.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 42 +++++++-----------------------
 drivers/gpu/drm/xe/xe_guc_types.h  |  4 ---
 2 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9f8ce2d1f6a0..78b471636470 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -27,6 +27,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_guc_id_mgr.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
@@ -236,16 +237,10 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
-	ida_destroy(&guc->submission_state.guc_ids);
-	bitmap_free(guc->submission_state.guc_ids_bitmap);
 	free_submit_wq(guc);
 	mutex_destroy(&guc->submission_state.lock);
 }
 
-#define GUC_ID_NUMBER_MLRC	4096
-#define GUC_ID_NUMBER_SLRC	(GUC_ID_MAX - GUC_ID_NUMBER_MLRC)
-#define GUC_ID_START_MLRC	GUC_ID_NUMBER_SLRC
-
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
 
 static void primelockdep(struct xe_guc *guc)
@@ -268,22 +263,14 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int err;
 
-	guc->submission_state.guc_ids_bitmap =
-		bitmap_zalloc(GUC_ID_NUMBER_MLRC, GFP_KERNEL);
-	if (!guc->submission_state.guc_ids_bitmap)
-		return -ENOMEM;
-
 	err = alloc_submit_wq(guc);
-	if (err) {
-		bitmap_free(guc->submission_state.guc_ids_bitmap);
+	if (err)
 		return err;
-	}
 
 	gt->exec_queue_ops = &guc_exec_queue_ops;
 
 	mutex_init(&guc->submission_state.lock);
 	xa_init(&guc->submission_state.exec_queue_lookup);
-	ida_init(&guc->submission_state.guc_ids);
 
 	spin_lock_init(&guc->submission_state.suspend.lock);
 	guc->submission_state.suspend.context = dma_fence_context_alloc(1);
@@ -294,6 +281,10 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -306,12 +297,8 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
 	for (i = 0; i < xa_count; ++i)
 		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
 
-	if (xe_exec_queue_is_parallel(q))
-		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
-				      q->guc->id - GUC_ID_START_MLRC,
-				      order_base_2(q->width));
-	else
-		ida_free(&guc->submission_state.guc_ids, q->guc->id);
+	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
+				     q->guc->id, q->width);
 }
 
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -329,21 +316,12 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	 */
 	lockdep_assert_held(&guc->submission_state.lock);
 
-	if (xe_exec_queue_is_parallel(q)) {
-		void *bitmap = guc->submission_state.guc_ids_bitmap;
-
-		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
-					      order_base_2(q->width));
-	} else {
-		ret = ida_alloc_max(&guc->submission_state.guc_ids,
-				    GUC_ID_NUMBER_SLRC - 1, GFP_NOWAIT);
-	}
+	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
+					   q->width);
 	if (ret < 0)
 		return ret;
 
 	q->guc->id = ret;
-	if (xe_exec_queue_is_parallel(q))
-		q->guc->id += GUC_ID_START_MLRC;
 
 	for (i = 0; i < q->width; ++i) {
 		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 69be1fb83047..82bd93f7867d 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -68,10 +68,6 @@ struct xe_guc {
 		struct xe_guc_id_mgr idm;
 		/** @submission_state.exec_queue_lookup: Lookup an xe_engine from guc_id */
 		struct xarray exec_queue_lookup;
-		/** @submission_state.guc_ids: used to allocate new guc_ids, single-lrc */
-		struct ida guc_ids;
-		/** @submission_state.guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
-		unsigned long *guc_ids_bitmap;
 		/** @submission_state.stopped: submissions are stopped */
 		atomic_t stopped;
 		/** @submission_state.lock: protects submission state */
-- 
2.43.0

