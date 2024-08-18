Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCC1C531DC
	for <intel-xe@archiver.kernel.org>; Sun, 18 Aug 2024 00:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F13210E065;
	Sun, 18 Aug 2024 00:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzfCN62u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB9510E065
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Aug 2024 00:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723942202; x=1755478202;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YOvTSFHdQo7A9YT0o5OCfkiIDWMpAy5Pc+IZvG9Ohy0=;
 b=MzfCN62uY8drQgZHnEw8IV+mo5XxiYUamWB7TXghNUh9U6gPfpwZrOhB
 lwjGL42W3BMteOsPmLSYkFix4dDlA7E1EiLs6jytOvXnK5mtc2XpArXY4
 XIV+IhNFxwHRKNynRZrxuwGRGcfwxpQgRoOJr0WYKoCiQJquNJQLhpVSa
 g/YiaGb7aUVyAzDAC9ZcvPRSoQXjLy4r5JIdMaJRdaUcZ6HIEHBU/Je2r
 eq4pHZ/cto8Ko0eXpN2FWPLfx3+WL6w03qHHB+D7YPEfaeJ0VpcdjPsaK
 96bTwajMolWxpgSu8zeB2ABMolCIuMkIhGEX6Xo51fneDpelLBg95PZDc w==;
X-CSE-ConnectionGUID: sBK3oEA3Tjucquu9rCAq/g==
X-CSE-MsgGUID: v+ZD4bnISJ6/FFR/Hkl0gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32879629"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="32879629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 17:50:01 -0700
X-CSE-ConnectionGUID: F7DkqtGwRgidrcJ5rDDhbQ==
X-CSE-MsgGUID: pbJPt9MKS1K7PjjCiThAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="64192520"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 17:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Invalidate media_gt TLBs in PT code
Date: Sat, 17 Aug 2024 17:50:55 -0700
Message-Id: <20240818005055.357593-1-matthew.brost@intel.com>
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

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 99 ++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 579ed31b46db..9d16e5772464 100644
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
@@ -2030,16 +2062,42 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
-		fence = &ifence->base.base;
+		if (mfence) {
+			dma_fence_get(fence);
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
@@ -2049,6 +2107,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 free_rfence:
 	kfree(rfence);
 free_ifence:
+	if (chain_fence)
+		dma_fence_chain_free(chain_fence);
+	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
 	if (err != -EAGAIN && tile->id)
-- 
2.34.1

