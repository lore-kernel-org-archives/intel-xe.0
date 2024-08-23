Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DD1C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 16:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5310EC6C;
	Fri, 23 Aug 2024 16:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkW8ub3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3918610EC6C
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724430073; x=1755966073;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4QW4lmPEN5ceMY7y81prgujQMdi8o9GZsD1H5sRnUqI=;
 b=FkW8ub3f+Yov67A42sRG/RQ70ShkpcIQ2o1ZeEoelGrM2LUufKNhuhAg
 JwFhm13UBrC+tkq6Icre0K9dI9EH61QAWIGa0N9AOlrpYv+mK6mR08nrq
 iFymjU5K9jKg5FFhZcFFFrWYCbOOXQjsxZa94thbT8KgGv2tt60n4DK3P
 42hCtgACAI00kf6mYGRPsO2iDF64OV2DTEddpciaDTdwnr3A8sVrP95cs
 SiLH6ZhcduXPoYx46YKbDxl9TfL2780MQlyk7cV6iT0DZ/E3frHtkW8uo
 KQvbGaFLOUWvm6N6ERZBiRPCroZ5eC8sR5Z8oKYOzUi5N4dta0nKAdLH7 A==;
X-CSE-ConnectionGUID: UgCyInGaQ6OJ0KM9ytfneg==
X-CSE-MsgGUID: /4C21EPxQNGBSqzVh78h/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33528218"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="33528218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:21:12 -0700
X-CSE-ConnectionGUID: N0XIO8yRQnCpCY7H13vmVw==
X-CSE-MsgGUID: xMd6dO+yR+yyE0uYI1lXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62361548"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:21:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] Revert "drm/xe: Invalidate media_gt TLBs in PT code"
Date: Fri, 23 Aug 2024 09:22:07 -0700
Message-Id: <20240823162207.2168887-1-matthew.brost@intel.com>
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

This reverts commit 40520283e0fd11237ed9dfc0991503b3403d5fa4.

We can't install dma-fence-chain in timeline sync objs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 99 ++++++++------------------------------
 1 file changed, 19 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6c6714af3d5d..579ed31b46db 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,8 +3,6 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <linux/dma-fence-chain.h>
-
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -1851,20 +1849,13 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma, struct dma_fence *fence,
-			   struct dma_fence *fence2)
+			   struct xe_vma *vma, struct dma_fence *fence)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
-		if (fence2)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
-					   pt_update_ops->wait_vm_bookkeep ?
-					   DMA_RESV_USAGE_KERNEL :
-					   DMA_RESV_USAGE_BOOKKEEP);
-	}
 	vma->tile_present |= BIT(tile->id);
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
@@ -1884,20 +1875,13 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 
 static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
-			     struct xe_vma *vma, struct dma_fence *fence,
-			     struct dma_fence *fence2)
+			     struct xe_vma *vma, struct dma_fence *fence)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
-		if (fence2)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
-					   pt_update_ops->wait_vm_bookkeep ?
-					   DMA_RESV_USAGE_KERNEL :
-					   DMA_RESV_USAGE_BOOKKEEP);
-	}
 	vma->tile_present &= ~BIT(tile->id);
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
@@ -1914,8 +1898,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
-		      struct xe_vma_op *op, struct dma_fence *fence,
-		      struct dma_fence *fence2)
+		      struct xe_vma_op *op, struct dma_fence *fence)
 {
 	xe_vm_assert_held(vm);
 
@@ -1924,28 +1907,26 @@ static void op_commit(struct xe_vm *vm,
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
 			break;
 
-		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
-			       fence2);
+		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence,
-				 fence2);
+				 gpuva_to_vma(op->base.remap.unmap->va), fence);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
-				       fence, fence2);
+				       fence);
 		if (op->remap.next)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
-				       fence, fence2);
+				       fence);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
+				 gpuva_to_vma(op->base.unmap.va), fence);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
+			       gpuva_to_vma(op->base.prefetch.va), fence);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -1982,8 +1963,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL, *mfence = NULL;
-	struct dma_fence_chain *chain_fence = NULL;
+	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -2016,18 +1996,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			err = -ENOMEM;
 			goto kill_vm_tile1;
 		}
-		if (tile->media_gt) {
-			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-			if (!mfence) {
-				err = -ENOMEM;
-				goto free_ifence;
-			}
-			chain_fence = dma_fence_chain_alloc();
-			if (!chain_fence) {
-				err = -ENOMEM;
-				goto free_ifence;
-			}
-		}
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
@@ -2059,46 +2027,19 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	/* tlb invalidation must be done before signaling rebind */
 	if (ifence) {
-		if (mfence)
-			dma_fence_get(fence);
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
-		if (mfence) {
-			invalidation_fence_init(tile->media_gt, mfence, fence,
-						pt_update_ops->start,
-						pt_update_ops->last, vm->usm.asid);
-			dma_fence_chain_init(chain_fence, &ifence->base.base,
-					     &mfence->base.base, 0);
-			fence = &chain_fence->base;
-		} else {
-			fence = &ifence->base.base;
-		}
+		fence = &ifence->base.base;
 	}
 
-	if (!mfence) {
-		dma_resv_add_fence(xe_vm_resv(vm), fence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		list_for_each_entry(op, &vops->list, link)
-			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
-	} else {
-		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_add_fence(xe_vm_resv(vm), fence,
+			   pt_update_ops->wait_vm_bookkeep ?
+			   DMA_RESV_USAGE_KERNEL :
+			   DMA_RESV_USAGE_BOOKKEEP);
 
-		list_for_each_entry(op, &vops->list, link)
-			op_commit(vops->vm, tile, pt_update_ops, op,
-				  &ifence->base.base, &mfence->base.base);
-	}
+	list_for_each_entry(op, &vops->list, link)
+		op_commit(vops->vm, tile, pt_update_ops, op, fence);
 
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
@@ -2108,8 +2049,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 free_rfence:
 	kfree(rfence);
 free_ifence:
-	dma_fence_chain_free(chain_fence);
-	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
 	if (err != -EAGAIN && tile->id)
-- 
2.34.1

