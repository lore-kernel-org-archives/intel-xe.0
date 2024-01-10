Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C07C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CF310E79F;
	Wed, 10 Jan 2024 17:46:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F4510E79F
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908802; x=1736444802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5HG+6TAjKXCyBC+Gvv5RX35GDUhhQaArQ5wlOACn0OI=;
 b=GE2RvNOgSbudhHXfXV6uobfMTeKAKKsxP1rli/e2PBjshQporwIeTmE6
 oT2Wth5Scv1WvKGK51pG3XN4oWlJVuj/PM85ezXKpMf6Z7jboaZW38Gtp
 WuSA1n23J6SdHzLZ4g8gEw2A5l5yayHbsqJHB8MlUCfr0ujbYWGlYi36T
 3Adiu6hma5ClzwAEwrEN4WJJM+Q4doJq3lJDcgQO+E7G4PbYVLudbUbpz
 sUnw3GwSGL3411eu4xBal6wAkLkKulCMWzqQLG8vTCtXKpDQGUxLSIBt4
 Bx5nQJiPFgqXW9POS2A95ugX5fVHweru000v60SszQIoHEN9dJdVfbLvQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389032013"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389032013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:46:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="24029896"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.210])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:46:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe/guc: Use GuC ID Manager in submission code
Date: Wed, 10 Jan 2024 18:46:22 +0100
Message-Id: <20240110174622.409-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240110174622.409-1-michal.wajdeczko@intel.com>
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++--------------------------
 drivers/gpu/drm/xe/xe_guc_types.h  |  4 ----
 drivers/gpu/drm/xe/xe_uc.c         |  5 +++++
 3 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 022e93796bf8..845b03f0b6b2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -25,6 +25,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_id_mgr.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
@@ -235,16 +236,10 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
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
@@ -267,22 +262,14 @@ int xe_guc_submit_init(struct xe_guc *guc)
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
@@ -305,12 +292,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
 	for (i = 0; i < xa_count; ++i)
 		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
 
-	if (xe_exec_queue_is_parallel(q))
-		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
-				      q->guc->id - GUC_ID_START_MLRC,
-				      order_base_2(q->width));
-	else
-		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
+	xe_guc_id_mgr_release_locked(&guc->idm, q->guc->id, order_base_2(q->width));
 }
 
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -328,21 +310,11 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	 */
 	lockdep_assert_held(&guc->submission_state.lock);
 
-	if (xe_exec_queue_is_parallel(q)) {
-		void *bitmap = guc->submission_state.guc_ids_bitmap;
-
-		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
-					      order_base_2(q->width));
-	} else {
-		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
-				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
-	}
+	ret = xe_guc_id_mgr_reserve_locked(&guc->idm, order_base_2(q->width));
 	if (ret < 0)
 		return ret;
 
 	q->guc->id = ret;
-	if (xe_exec_queue_is_parallel(q))
-		q->guc->id += GUC_ID_START_MLRC;
 
 	for (i = 0; i < q->width; ++i) {
 		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 04529be0917e..d2668889919f 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -68,10 +68,6 @@ struct xe_guc {
 	struct {
 		/** @exec_queue_lookup: Lookup an xe_engine from guc_id */
 		struct xarray exec_queue_lookup;
-		/** @guc_ids: used to allocate new guc_ids, single-lrc */
-		struct ida guc_ids;
-		/** @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
-		unsigned long *guc_ids_bitmap;
 		/** @stopped: submissions are stopped */
 		atomic_t stopped;
 		/** @lock: protects submission state */
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 4408ea1751e7..3a0023d3fa2c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -10,6 +10,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_db_mgr.h"
+#include "xe_guc_id_mgr.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
@@ -65,6 +66,10 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+	ret = xe_guc_id_mgr_init(&uc->guc.idm, ~0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:
-- 
2.25.1

