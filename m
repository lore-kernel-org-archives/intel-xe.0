Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91B0C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FE810E4C7;
	Tue,  7 Nov 2023 05:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916D910E4B1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bYGvBlzmGLSTgyT+eHUfdMk2mb5+hBHWtihZ3WaOO0o=;
 b=NBUbME/lFE4+mt3UCRruLTUaEjSyZ9nNvxEKQYPaOJE4fHXmGThmy4KR
 IGln3ziOH7SvurKKnMad5HYMKnGeq/ZQFDuaK6C81OlvwruLuZLGZoW+U
 kPxbS5YnuvBwpaGOBdN1lI5CiFzOMvtaPenefStu5+wpY0wjWnhuadDBg
 Mp3okEHHeAwBESB99wg1vBjzpOdd2m5TJnIO6j5+QJla1X+1zSegzRuvH
 PgrpohyZTP5EtnMfaCTfidFRJc8JcsiYs695/PxA87IUafQDHw4aFQc2E
 yK9TBOEoC6Ciz09DxemsDzlnkaclJ5CWjBBWZg378RqchwK0hb2iueSEf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769525"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769525"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689854"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689854"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:49 -0800
Message-Id: <20231107052603.124361-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 13/27] drm/xe: Add
 vm_bind_ioctl_ops_install_fences helper
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

Will help with transition single job for many bind ops. Also fix some
reference counting errors.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  8 +++--
 drivers/gpu/drm/xe/xe_sync.c       |  4 +--
 drivers/gpu/drm/xe/xe_vm.c         | 57 ++++++++++++------------------
 3 files changed, 30 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 35710b66e5de..6d142fb75dfc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -964,20 +964,24 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
  * @q: The exec queue
  * @vm: The VM the engine does a bind or exec for
  *
- * Get last fence, does not take a ref
+ * Get last fence, takes a ref
  *
  * Returns: last fence if not signaled, dma fence stub if signaled
  */
 struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
 					       struct xe_vm *vm)
 {
+	struct dma_fence *fence;
+
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
 
 	if (q->last_fence &&
 	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
 		xe_exec_queue_last_fence_put(q, vm);
 
-	return q->last_fence ? q->last_fence : dma_fence_get_stub();
+	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
+	dma_fence_get(fence);
+	return fence;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 6b38c74a1de1..2e08957aec22 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -312,9 +312,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
 	/* Easy cases... */
 	if (!num_in_fence) {
-		fence = xe_exec_queue_last_fence_get(q, vm);
-		dma_fence_get(fence);
-		return fence;
+		return xe_exec_queue_last_fence_get(q, vm);
 	} else if (num_in_fence == 1) {
 		dma_fence_get(fence);
 		return fence;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6e9a3284238e..f708c08633a7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1723,7 +1723,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(vma->tile_present);
 	int err;
 	u8 id;
@@ -1769,12 +1769,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		}
 	}
 
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL,
-					     cf ? &cf->base : fence);
-	}
-
 	return cf ? &cf->base : !fence ?
 		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
 
@@ -1798,7 +1792,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(vma->tile_mask);
 	int err;
 	u8 id;
@@ -1845,12 +1839,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
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
@@ -1886,15 +1874,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
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
@@ -1920,7 +1901,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return fence;
 
-	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, q))
@@ -2077,17 +2057,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
 				  true, first_op, last_op);
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
-		return dma_fence_get(fence);
+		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 	}
 }
 
@@ -2862,6 +2832,25 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
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
@@ -2884,7 +2873,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			/* FIXME: Killing VM rather than proper error handling */
 			xe_vm_kill(vm, false);
 		} else {
-			dma_fence_put(fence);
+			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 		}
 	}
 
-- 
2.34.1

