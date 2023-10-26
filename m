Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E525FC25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9584810E753;
	Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E7710E753
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292913; x=1729828913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6B7sZSS/2D1soILj/cwJTnQsrF0ZLwEM7MdVaKSAqDc=;
 b=JOStpjkJTG0S5a61m6kOaOW2NiGzOg5NbWqWDzaBvUdQ7DzJxV8GbqIb
 P8gkPLvtBtewr2k/hm7pXms+aPHopvzC9DumIobZA2xTAdF3aiPY774qJ
 A15tT80Oz3WLvloKfh3GPf4leN3+OmkhX/l/MtQZ8ta/V1JPrt0zEgmDe
 qz6hURQh2sg1GpKwVWNkNdw3WKHAEZF+2ReOiSYjM1k6r18NaIaAsh50W
 /XJFQxxm+Qkp7eKw7Gp8riSxbcGDvyKi5Q9ff3/bQqpRReIBwjY6mQU4H
 j5Sv9fRAyqsE9g+cYhhWiwQDRsUIqKrbTnDPDv8R54L2UiW47twhChCk4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822002"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822002"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682366"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682366"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:01:59 -0700
Message-Id: <20231026040213.1272993-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/26] drm/xe: Add
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
 drivers/gpu/drm/xe/xe_exec.c       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c |  8 +++--
 drivers/gpu/drm/xe/xe_vm.c         | 58 +++++++++++++-----------------
 3 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4666f5b145f7..f42d3274731b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -243,6 +243,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 			for (i = 0; i < num_syncs; i++)
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
+			dma_fence_put(fence);
 		}
 
 		goto err_exec;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b442d86d34fe..c2e479c78328 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -961,20 +961,24 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b90d2c2ee1ae..a4e686d1b8e2 100644
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
 
@@ -2851,6 +2821,25 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
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
@@ -2873,7 +2862,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			/* FIXME: Killing VM rather than proper error handling */
 			xe_vm_kill(vm, false);
 		} else {
-			dma_fence_put(fence);
+			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 		}
 	}
 
@@ -3200,6 +3189,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
 
 		xe_sync_entry_signal(&syncs[i], NULL, fence);
+		dma_fence_put(fence);
 	}
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
-- 
2.34.1

