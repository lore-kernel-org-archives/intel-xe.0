Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7ADC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D951010E414;
	Tue, 20 Aug 2024 16:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtA/GnAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2B10E414
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724170538; x=1755706538;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2osd4Aczt4Nk5Eqx6fxK30fx9B4tja/gmYjqe6HiDxo=;
 b=WtA/GnAwjISRnhrO7Ekg50V6JpYJjj2aJQp9e/WU1WVb48wHG5yd6Qy8
 uGWn46uN8IyQVqHlGGFGCAXvtk5m8FyW9v79sS4HeY74T9f8bt/M0XLfi
 09scQyN5zfhdU7j7mlLHnUlKdcQ9/IRsUGCgBUvzWyk9XVT2yHR8/y0JD
 2QUG1pexXvOx4dT/FbRGmBHkSxgHPM7yYPUawnw5QLChr0sUV3V/HG682
 prYghLycnipt06GywP7GOy4MN6LfqUuoJugim04VAfVXEyZVUyoSEOi29
 rO3wK2KZee1b5SKRqAgshfQO8QJQhB62fKdBvhbVW/wV0kOzriIwcHDp8 g==;
X-CSE-ConnectionGUID: m8AAO11jSYWzDDV5W7A1dw==
X-CSE-MsgGUID: sf/Vf6p9Rj+QC4+JYmKBbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33868496"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33868496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:15:38 -0700
X-CSE-ConnectionGUID: 942GLAZPRRuonLE5q5YcNQ==
X-CSE-MsgGUID: GxRzg9ZpQcGNvx6HllHhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60473167"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:15:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Invalidate media_gt TLBs in PT code
Date: Tue, 20 Aug 2024 09:16:32 -0700
Message-Id: <20240820161632.987369-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Testing on LNL has shown media GT's TLBs need to be invalidated via the
GuC, update PT code appropriately.

v2:
 - Do dma_fence_get before first call of invalidation_fence_init (Himal)
 - No need to check for valid chain fence (Himal)

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 99 ++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 579ed31b46db..6c6714af3d5d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/dma-fence-chain.h>
+
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -1849,13 +1851,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma, struct dma_fence *fence)
+			   struct xe_vma *vma, struct dma_fence *fence,
+			   struct dma_fence *fence2)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
+		if (fence2)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
+					   pt_update_ops->wait_vm_bookkeep ?
+					   DMA_RESV_USAGE_KERNEL :
+					   DMA_RESV_USAGE_BOOKKEEP);
+	}
 	vma->tile_present |= BIT(tile->id);
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
@@ -1875,13 +1884,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 
 static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
-			     struct xe_vma *vma, struct dma_fence *fence)
+			     struct xe_vma *vma, struct dma_fence *fence,
+			     struct dma_fence *fence2)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
+		if (fence2)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
+					   pt_update_ops->wait_vm_bookkeep ?
+					   DMA_RESV_USAGE_KERNEL :
+					   DMA_RESV_USAGE_BOOKKEEP);
+	}
 	vma->tile_present &= ~BIT(tile->id);
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
@@ -1898,7 +1914,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
-		      struct xe_vma_op *op, struct dma_fence *fence)
+		      struct xe_vma_op *op, struct dma_fence *fence,
+		      struct dma_fence *fence2)
 {
 	xe_vm_assert_held(vm);
 
@@ -1907,26 +1924,28 @@ static void op_commit(struct xe_vm *vm,
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
 			break;
 
-		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
+		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
+			       fence2);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence);
+				 gpuva_to_vma(op->base.remap.unmap->va), fence,
+				 fence2);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
-				       fence);
+				       fence, fence2);
 		if (op->remap.next)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
-				       fence);
+				       fence, fence2);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence);
+				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence);
+			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -1963,7 +1982,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL;
+	struct invalidation_fence *ifence = NULL, *mfence = NULL;
+	struct dma_fence_chain *chain_fence = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -1996,6 +2016,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			err = -ENOMEM;
 			goto kill_vm_tile1;
 		}
+		if (tile->media_gt) {
+			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+			if (!mfence) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+			chain_fence = dma_fence_chain_alloc();
+			if (!chain_fence) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+		}
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
@@ -2027,19 +2059,46 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	/* tlb invalidation must be done before signaling rebind */
 	if (ifence) {
+		if (mfence)
+			dma_fence_get(fence);
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
-		fence = &ifence->base.base;
+		if (mfence) {
+			invalidation_fence_init(tile->media_gt, mfence, fence,
+						pt_update_ops->start,
+						pt_update_ops->last, vm->usm.asid);
+			dma_fence_chain_init(chain_fence, &ifence->base.base,
+					     &mfence->base.base, 0);
+			fence = &chain_fence->base;
+		} else {
+			fence = &ifence->base.base;
+		}
 	}
 
-	dma_resv_add_fence(xe_vm_resv(vm), fence,
-			   pt_update_ops->wait_vm_bookkeep ?
-			   DMA_RESV_USAGE_KERNEL :
-			   DMA_RESV_USAGE_BOOKKEEP);
+	if (!mfence) {
+		dma_resv_add_fence(xe_vm_resv(vm), fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
+	} else {
+		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
 
-	list_for_each_entry(op, &vops->list, link)
-		op_commit(vops->vm, tile, pt_update_ops, op, fence);
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op,
+				  &ifence->base.base, &mfence->base.base);
+	}
 
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
@@ -2049,6 +2108,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 free_rfence:
 	kfree(rfence);
 free_ifence:
+	dma_fence_chain_free(chain_fence);
+	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
 	if (err != -EAGAIN && tile->id)
-- 
2.34.1

