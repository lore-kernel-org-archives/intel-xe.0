Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFE0C07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501C710FE61;
	Wed, 24 Apr 2024 17:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnlqUrfc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539AB10FEF2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713979465; x=1745515465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GrH2oTFDu+8CYZ3tfKSm/gt4yFpS60yQC+1/i3jWL6Y=;
 b=mnlqUrfcYZl2T5CZ7Xa0Og5NwRsL3618JqwL6qPB/B1DTFep7x1ZHW0k
 5O9vDEmaYDm7TXJuZ5EKNuRQpf5K2n5kTXMtHV8t3U0YpXJ6jMYFvnsvY
 HtM+IzQb2lTWDl9oGKE++tHqHSjQVmCsyNc3Ii+WFtWdBpO74m5PqqRB7
 pAp7qYT2AhJmKqUK+yPCqBmK+Rg008LIZ5CWvPwi/fFz535mKrA/eek3G
 bBdgg+uN4JpmVeO+BlrmmQCe4/QYV0LQuOC3G2i0IL0jQEixiUSeFZfa3
 zPZWAgYWUhQDV3QDGd2bkUwHB8d7brnFK9NOdr3E6yIuBOGhWHtGrLZp7 A==;
X-CSE-ConnectionGUID: J76coDebRsO5oyO8srS8rw==
X-CSE-MsgGUID: ROTJb7stSfGLielc3F5fAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12561483"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12561483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:23 -0700
X-CSE-ConnectionGUID: j00Fo76zSDKiBl0fkkmqSg==
X-CSE-MsgGUID: ETc4In4uRHqVLo0/bDiYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24825507"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 09/13] drm/xe: Add vm_bind_ioctl_ops_fini helper
Date: Wed, 24 Apr 2024 10:23:48 -0700
Message-Id: <20240424172352.1704851-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
References: <20240424172352.1704851-1-matthew.brost@intel.com>
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

Simplify VM bind code by signaling out-fences / destroying VMAs in a
single location. Will help with transition single job for many bind ops.

v2:
 - s/vm_bind_ioctl_ops_install_fences/vm_bind_ioctl_ops_fini (Oak)
 - Set last fence in vm_bind_ioctl_ops_fini (Oak)

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 62 +++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e91067fc0ea..93a2c113ad1a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1630,7 +1630,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(vma->tile_present);
 	int err;
 	u8 id;
@@ -1688,10 +1688,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	fence = cf ? &cf->base : !fence ?
 		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], fence);
-	}
 
 	return fence;
 
@@ -1715,7 +1711,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(tile_mask);
 	int err;
 	u8 id;
@@ -1762,12 +1758,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		}
 	}
 
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i],
-					     cf ? &cf->base : fence);
-	}
-
 	return cf ? &cf->base : fence;
 
 err_fences:
@@ -1819,20 +1809,11 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 		if (IS_ERR(fence))
 			return fence;
 	} else {
-		int i;
-
 		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
 		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-		if (last_op) {
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], fence);
-		}
 	}
 
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-
 	return fence;
 }
 
@@ -1842,7 +1823,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	     u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1851,10 +1831,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return fence;
 
-	xe_vma_destroy(vma, fence);
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-
 	return fence;
 }
 
@@ -2009,17 +1985,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
 				  vma->tile_mask, true, first_op, last_op);
 	} else {
-		struct dma_fence *fence =
-			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-		int i;
-
-		/* Nothing to do, signal fences now */
-		if (last_op) {
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], fence);
-		}
-
-		return fence;
+		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 	}
 }
 
@@ -2822,6 +2788,26 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	return fence;
 }
 
+static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
+				   struct dma_fence *fence)
+{
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
+	struct xe_vma_op *op;
+	int i;
+
+	list_for_each_entry(op, &vops->list, link) {
+		if (op->base.op == DRM_GPUVA_OP_UNMAP)
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
+		else if (op->base.op == DRM_GPUVA_OP_REMAP)
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
+				       fence);
+	}
+	for (i = 0; i < vops->num_syncs; i++)
+		xe_sync_entry_signal(vops->syncs + i, fence);
+	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
+	dma_fence_put(fence);
+}
+
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops)
 {
@@ -2846,7 +2832,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			xe_vm_kill(vm, false);
 			goto unlock;
 		} else {
-			dma_fence_put(fence);
+			vm_bind_ioctl_ops_fini(vm, vops, fence);
 		}
 	}
 
-- 
2.34.1

