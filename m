Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595F8C4829F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F5A112F65;
	Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuEoJ8sM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B272112F64
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4NqE8pJc1Aa4HAgzUEgf1bEk8Oikn7ewpenAzGbIYU=;
 b=HuEoJ8sMpdT+AWgSB1jf6QatnSHD6s0t2OQpn8Sk7gafZ5/zJyzYWEWh
 QeG58DpoGMPiKdMwfZiKI+95agYEmoGmuJQLvyNiQPKwSA+l1FQ5p+Ogl
 ukpgTc2kq4B/LpNGW5yj2pGYTXQ+WhFwe/XCj9odOSmuJelKWelhsbEz7
 KvDPlrau9JAep9eelvb4dgirmXNQA11jA5vowNeYRKpyRFJ5QsEtu4rOf
 qNjyK4Nt+QNp3Ds1REfvJ0ZQHqFO5/8FZaISodCNZXAe7AjcvCW8TD5Fh
 Qiz+eD3OclRlKYW+6ADU19Fi8JNlX+Uo69GbhboSYUYIzhzX4TtwgZ2QD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776792"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793806"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 09/22] drm/xe: Add vm_bind_ioctl_ops_install_fences helper
Date: Tue,  6 Feb 2024 15:37:16 -0800
Message-Id: <20240206233729.3173206-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com
---
 drivers/gpu/drm/xe/xe_vm.c | 55 ++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ebe822855233..383d05f87a79 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1625,7 +1625,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(vma->tile_present);
 	int err;
 	u8 id;
@@ -1673,10 +1673,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	fence = cf ? &cf->base : !fence ?
 		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL, fence);
-	}
 
 	return fence;
 
@@ -1700,7 +1696,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(vma->tile_mask);
 	int err;
 	u8 id;
@@ -1747,12 +1743,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		}
 	}
 
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL,
-					     cf ? &cf->base : fence);
-	}
-
 	return cf ? &cf->base : fence;
 
 err_fences:
@@ -1782,15 +1772,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 		if (IS_ERR(fence))
 			return fence;
 	} else {
-		int i;
-
 		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
-
 		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-		if (last_op) {
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
-		}
 	}
 
 	if (last_op)
@@ -1814,7 +1797,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return fence;
 
-	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 
@@ -1972,17 +1954,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
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
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
-		}
-
-		return fence;
+		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 	}
 }
 
@@ -2764,6 +2736,25 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 	return fence;
 }
 
+static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
+					     struct xe_vma_ops *vops,
+					     struct dma_fence *fence)
+{
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
+		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
+	dma_fence_put(fence);
+}
+
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops)
 {
@@ -2787,7 +2778,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			xe_vm_kill(vm, false);
 			goto unlock;
 		} else {
-			dma_fence_put(fence);
+			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 		}
 	}
 
-- 
2.34.1

