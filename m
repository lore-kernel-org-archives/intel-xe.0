Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE45C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 05:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692A710E03C;
	Thu, 29 May 2025 05:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTV83mA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F110E03C
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 05:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748496199; x=1780032199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJNzXTGSYvbbVLEv1DfbsQiXKYhVxOYJ4oKYT09mpM4=;
 b=aTV83mA+/vSWUZ8zI/G420T9dwVk+3Bd+wHjBc4SwqIoIeWlTpFpmJru
 mIivYOHR7dAOmW+kp7Icevd6KYCd6fzhGZn6kAaU4REmPPEUed3NwcfJ1
 mXj0qZgba3zZLx+tur1BIXQAyyBR1tWyFCG0xWGDGuueQkmkx6QhjR8cX
 mx1CfxlS1s2ko39iOIWuMhXHSh2xFw9VqT3Sl1com5wNfTxy3l0jczt/D
 GZc3CAKPbCCt8aei9opc8s6xqiZFI7CZTOI/qdEXT/tkWjajklOhfaisj
 xUPd94u0rqjzcpuqE7VQEy1H3u8WSGUVlDejpsCupTXwoxMASV4VwZXC6 w==;
X-CSE-ConnectionGUID: 3kTKsQj/Sp+Xf6mFTxE0ZQ==
X-CSE-MsgGUID: m4XaCSRvRamSqEU2UvD1JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50242519"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="50242519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:23:19 -0700
X-CSE-ConnectionGUID: MyJsIobDQ5G8tTchYEKgIA==
X-CSE-MsgGUID: xj8jNjOuRduB1xc2Fvl0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="174457693"
Received: from nvishwa1-desk1.sc.intel.com ([172.25.29.28])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:23:19 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten@lankhorst.se,
	stuart.summers@intel.com,
	matthew.brost@intel.com
Subject: [PATCH v2] drm/xe: Create LRC BO without VM
Date: Wed, 28 May 2025 22:20:32 -0700
Message-ID: <20250529052031.2429120-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Specifying VM during lrc->bo creation requires VM's reference
to be held for the lifetime of lrc->bo as it will use VM's dma
reservation object. Using VM's dma reservation object for
lrc->bo doesn't provide any advantage. Hence do not pass VM
while creating lrc->bo.

v2: Use xe_bo_unpin_map_no_vm (Matthew Brost)

Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  9 ---------
 drivers/gpu/drm/xe/xe_lrc.c        | 23 ++++-------------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ce78cee5dec6..32c6923df7c3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -132,12 +132,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
-	if (vm) {
-		err = xe_vm_lock(vm, true);
-		if (err)
-			return err;
-	}
-
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -146,9 +140,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 		}
 	}
 
-	if (vm)
-		xe_vm_unlock(vm);
-
 	err = q->ops->init(q);
 	if (err)
 		goto err_lrc;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9..63d74e27f54c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -909,10 +909,7 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
-	xe_bo_lock(lrc->bo, false);
-	xe_bo_unpin(lrc->bo);
-	xe_bo_unlock(lrc->bo);
-	xe_bo_put(lrc->bo);
+	xe_bo_unpin_map_no_vm(lrc->bo);
 	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
 }
 
@@ -1007,7 +1004,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
-	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
 				       ttm_bo_type_kernel,
 				       bo_flags);
 	if (IS_ERR(lrc->bo))
@@ -1795,9 +1792,6 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc->bo->vm)
-		xe_vm_get(lrc->bo->vm);
-
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
 	snapshot->ring_addr = __xe_lrc_ring_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
@@ -1819,14 +1813,12 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 {
 	struct xe_bo *bo;
-	struct xe_vm *vm;
 	struct iosys_map src;
 
 	if (!snapshot)
 		return;
 
 	bo = snapshot->lrc_bo;
-	vm = bo->vm;
 	snapshot->lrc_bo = NULL;
 
 	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
@@ -1846,8 +1838,6 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 	xe_bo_unlock(bo);
 put_bo:
 	xe_bo_put(bo);
-	if (vm)
-		xe_vm_put(vm);
 }
 
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
@@ -1900,14 +1890,9 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 		return;
 
 	kvfree(snapshot->lrc_snapshot);
-	if (snapshot->lrc_bo) {
-		struct xe_vm *vm;
-
-		vm = snapshot->lrc_bo->vm;
+	if (snapshot->lrc_bo)
 		xe_bo_put(snapshot->lrc_bo);
-		if (vm)
-			xe_vm_put(vm);
-	}
+
 	kfree(snapshot);
 }
 
-- 
2.43.0

