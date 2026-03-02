Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37926D58E7C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7CA10E1A6;
	Mon,  2 Mar 2026 08:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNJ9VPPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D187910E1A6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772440253; x=1803976253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/iikNXfsk1J4pkd0G9CgYItXSOY9f92Etp5hSzq+tXI=;
 b=fNJ9VPPM4rgl0L/Bh2W+XFJmwOzMWs4ujS0MUknQ6LoNmwaUCHpAFPXI
 dNHc4hQNuncBY6SHGnFiE4SSKL8RfdVpmIwmaUE5eqfBL4Z7gtn/yXQKD
 y0x88ypnMZG1wjX9eP9fmYxw6pUo0RpJSiUcnyyQEWemOeBGsQyjv70T0
 GsrcYes5fgFyQnrNQoVX5AXAVNSPaCpNfttj8iylYfr7H2c9SkWhemox4
 e+fE3f0QD+14GuUXtPPTOV3gz9Tsm0SlO1BB3GMJ5VGYaup/Qksv7vAJw
 2Ktqde/otDPHFWHY5yrPL+MRWHsGxFKXU/0ONH692qGcV5mI4blJkci3+ g==;
X-CSE-ConnectionGUID: eft+rrn2RyGMbnscYD7Z6w==
X-CSE-MsgGUID: 6aUjbUbDT36sEIrE16eHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77281669"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77281669"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:30:52 -0800
X-CSE-ConnectionGUID: IcgATwPLSXe8YnIp+9grNg==
X-CSE-MsgGUID: B8zxn9gcQruRSJBCU/w0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="248084838"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 00:30:51 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()
Date: Mon,  2 Mar 2026 13:57:57 +0530
Message-ID: <20260302082757.3516577-1-raag.jadav@intel.com>
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

Currently xe_lrc_init() does two things.

1. Allocates LRC bo based on exec queue parameters.
2. Initializes LRC bo with actual context details.

Introduce xe_lrc_ctx_init() and split these two implementations for
better maintainability.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 142 ++++++++++++++++++++----------------
 1 file changed, 79 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 84360fcdf743..ebab5d78f7cc 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1438,65 +1438,16 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
 	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
 }
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, void *replay_state, u32 ring_size,
-		       u16 msix_vec,
-		       u32 init_flags)
+static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
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
@@ -1546,14 +1492,20 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
 					      __xe_lrc_ring_ggtt_addr(lrc));
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START_UDW, 0);
-		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, 0);
+
+		/* Match head and tail pointers */
+		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, lrc->ring.tail);
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_TAIL, lrc->ring.tail);
+
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_CTL,
 					      RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	} else {
 		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
-		xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
+
+		/* Match head and tail pointers */
+		xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, lrc->ring.tail);
 		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
+
 		xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
 				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	}
@@ -1602,12 +1554,76 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	err = setup_wa_bb(lrc, hwe);
 	if (err)
-		goto err_lrc_finish;
+		return err;
 
 	err = setup_indirect_ctx(lrc, hwe);
+
+	return err;
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
+	err = xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
 	if (err)
 		goto err_lrc_finish;
 
+	if (vm && vm->xef)
+		xe_drm_client_add_bo(vm->xef->client, lrc->bo);
+
 	return 0;
 
 err_lrc_finish:
-- 
2.43.0

