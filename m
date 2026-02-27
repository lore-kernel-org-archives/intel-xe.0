Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C249BFEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8147D10EBD6;
	Fri, 27 Feb 2026 17:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGOycpnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EC710EBD6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211815; x=1803747815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrw083NkY4UcAW5EPVPa3+mKYt9Ok46jrkIkYmBDuFU=;
 b=NGOycpnF4O3vpDLZi8THQPSIB7gMCeWHsMQ/vWMoJzFTg6UwegpHvr9F
 7mRYoKVSz2fbm+AHsoLXHYf9A0q/I375y33uI6MjIKMY4ZNPiJWTNMrEa
 asxhzttk4v7iN9yVPFaLgoa+AHewhqGcgmMy9Jg449nO141srOpNFNVc8
 uZNiAycaFryd2yoInaACkM/6O3tDr7IWY7j/AFQkRnLpwiZhhQUTQlaTZ
 KQ+cTFgvddWB3GZk5zl7W0mQk01Yu20h2kaeHOTzitlJRHo/tMSy9Vwil
 if+jNODq83u0NlD6OxBeBUX//IWcNR4Ia7WvXfjCbdGt1SPjWA0xHaR9B g==;
X-CSE-ConnectionGUID: wu2OnTlBSo2Ldu2q06LRPg==
X-CSE-MsgGUID: oErvt+/ZQTy9yWMJ/IpmQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73169921"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73169921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:03:35 -0800
X-CSE-ConnectionGUID: HA0TAHNVQS2U3ocDQ9Ld/g==
X-CSE-MsgGUID: 1G3KOxaQSN6jpqjRPenIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216964782"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 09:03:31 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 6/9] drm/xe/lrc: Introduce xe_lrc_reinit()
Date: Fri, 27 Feb 2026 22:30:46 +0530
Message-ID: <20260227170049.3418863-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227170049.3418863-1-raag.jadav@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
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

In preparation of usecases which require re-initializing LRC after PCIe
FLR, introduce xe_lrc_reinit() helper. The LRC bo already exists but
since it's contents are on VRAM, they are lost on PCIe FLR. Recreate
ring context as part of re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_lrc.c | 149 +++++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_lrc.h |   2 +
 2 files changed, 90 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 84360fcdf743..9fc8720f62ca 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1438,65 +1438,16 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
 	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
 }
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, void *replay_state, u32 ring_size,
-		       u16 msix_vec,
-		       u32 init_flags)
+static int xe_lrc_init_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+			   void *replay_state, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
-	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
-	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_bo *seqno_bo;
 	struct iosys_map map;
 	u32 arb_enable;
-	u32 bo_flags;
 	int err;
 
-	kref_init(&lrc->refcount);
-	lrc->gt = gt;
-	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
-	lrc->size = lrc_size;
-	lrc->flags = 0;
-	lrc->ring.size = ring_size;
-	lrc->ring.tail = 0;
-
-	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
-		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
-		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
-	}
-
-	if (xe_gt_has_indirect_ring_state(gt))
-		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
-
-	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
-		   XE_BO_FLAG_GGTT_INVALIDATE;
-
-	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
-
-	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
-					    bo_size,
-					    ttm_bo_type_kernel,
-					    bo_flags, false);
-	if (IS_ERR(lrc->bo))
-		return PTR_ERR(lrc->bo);
-
-	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
-					     ttm_bo_type_kernel,
-					     XE_BO_FLAG_GGTT |
-					     XE_BO_FLAG_GGTT_INVALIDATE |
-					     XE_BO_FLAG_SYSTEM, false);
-	if (IS_ERR(seqno_bo)) {
-		err = PTR_ERR(seqno_bo);
-		goto err_lrc_finish;
-	}
-	lrc->seqno_bo = seqno_bo;
-
-	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
-			     hwe->fence_irq, hwe->name);
-
 	/*
 	 * Init Per-Process of HW status Page, LRC / context state to known
 	 * values. If there's already a primed default_lrc, just copy it, otherwise
@@ -1508,7 +1459,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
-				 lrc_size - LRC_PPHWSP_SIZE);
+				 lrc->size - LRC_PPHWSP_SIZE);
 		if (replay_state)
 			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 					 replay_state, lrc->replay_size);
@@ -1516,21 +1467,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		void *init_data = empty_lrc_data(hwe);
 
 		if (!init_data) {
-			err = -ENOMEM;
-			goto err_lrc_finish;
+			return -ENOMEM;
 		}
 
-		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
+		xe_map_memcpy_to(xe, &map, 0, init_data, lrc->size);
 		kfree(init_data);
 	}
 
-	if (vm) {
+	if (vm)
 		xe_lrc_set_ppgtt(lrc, vm);
 
-		if (vm->xef)
-			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
-	}
-
 	if (xe_device_has_msix(xe)) {
 		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
 				     xe_memirq_status_ptr(&tile->memirq, hwe));
@@ -1602,12 +1548,93 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	err = setup_wa_bb(lrc, hwe);
 	if (err)
-		goto err_lrc_finish;
+		return err;
 
 	err = setup_indirect_ctx(lrc, hwe);
+
+	return err;
+}
+
+/**
+ * xe_lrc_reinit() - Re-initialize LRC
+ * @lrc: Pointer to the LRC
+ * @hwe: Hardware Engine
+ * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
+ * @msix_vec: MSI-X interrupt vector (for platforms that support it)
+ * @init_flags: LRC initialization flags
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		  void *replay_state, u16 msix_vec, u32 init_flags)
+{
+	return xe_lrc_init_ctx(lrc, hwe, vm, replay_state, msix_vec, init_flags);
+}
+
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
+{
+	struct xe_gt *gt = hwe->gt;
+	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
+	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *bo;
+	u32 bo_flags;
+	int err;
+
+	kref_init(&lrc->refcount);
+	lrc->gt = gt;
+	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
+	lrc->size = lrc_size;
+	lrc->flags = 0;
+	lrc->ring.size = ring_size;
+	lrc->ring.tail = 0;
+
+	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
+		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
+	}
+
+	if (xe_gt_has_indirect_ring_state(gt))
+		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
+
+	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
+		   XE_BO_FLAG_GGTT_INVALIDATE;
+
+	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
+
+	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
+				       ttm_bo_type_kernel,
+				       bo_flags, false);
+	if (IS_ERR(lrc->bo))
+		return PTR_ERR(lrc->bo);
+
+	lrc->bo = bo;
+
+	bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE |
+				       XE_BO_FLAG_SYSTEM, false);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		goto err_lrc_finish;
+	}
+	lrc->seqno_bo = bo;
+
+	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
+			     hwe->fence_irq, hwe->name);
+
+	err = xe_lrc_init_ctx(lrc, hwe, vm, replay_state, msix_vec, init_flags);
 	if (err)
 		goto err_lrc_finish;
 
+	if (vm && vm->xef)
+		xe_drm_client_add_bo(vm->xef->client, lrc->bo);
+
 	return 0;
 
 err_lrc_finish:
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 3e500004f1ae..af31de8df408 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -52,6 +52,8 @@ struct xe_lrc_snapshot {
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		  void *replay_state, u16 msix_vec, u32 init_flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.0

