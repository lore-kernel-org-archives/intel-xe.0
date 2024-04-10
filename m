Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CEBCD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0467113173;
	Wed, 10 Apr 2024 05:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTrtCoDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7380D113178
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727634; x=1744263634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nD0GIswbpTe2lNhUjwhfimLLDObZxJ0cwTy8on3JcHE=;
 b=YTrtCoDpd4NWf+0X4S4munMzANcptURAbLYqHJVhpYInrBzcQkTux6t+
 cZOQ/jqXr8llVC1X6zKh21TwF0/6J8484N1xgb/6aHwjznbRMPBiaQBH9
 x5HMzge2J1j+n0ANtaytyhfZuhgKnj2tw/kJqgNR8qItDy5V2pz6H8fxG
 gZaGOH1dcon8LIhBSbVXSnnYUbw5rlsXT6RBCb76HclarVTjgVW68Ih+Y
 ic8geJMLVm7hN251J/V2jlXG4Qg7Sbx3FjQ3XfrVElX4Ab9MRBmrST4aG
 diBFZ5JTyRZM3Y0ajyFIL9u6BI7tV4ePvWDppOmMisuq/qjM+iR+D+Kh8 w==;
X-CSE-ConnectionGUID: Szkk2jkKTke3TpWtfsRCYg==
X-CSE-MsgGUID: TkhPG2+LQ26qls+EujScBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680008"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:34 -0700
X-CSE-ConnectionGUID: CPfSFGxFQ1WooIMxefno2w==
X-CSE-MsgGUID: AOxW1SIMTGGjLUb/vEsQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536845"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH 09/13] drm/xe: Add vm_bind_ioctl_ops_fini helper
Date: Tue,  9 Apr 2024 22:40:52 -0700
Message-Id: <20240410054056.478023-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410054056.478023-1-matthew.brost@intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 62 +++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 09871538484b..97384c77f662 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1748,7 +1748,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(vma->tile_present);
 	int err;
 	u8 id;
@@ -1806,10 +1806,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	fence = cf ? &cf->base : !fence ?
 		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], fence);
-	}
 
 	return fence;
 
@@ -1833,7 +1829,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
-	int cur_fence = 0, i;
+	int cur_fence = 0;
 	int number_tiles = hweight8(tile_mask);
 	int err;
 	u8 id;
@@ -1880,12 +1876,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
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
@@ -1937,20 +1927,11 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
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
 
@@ -1960,7 +1941,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	     u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1969,10 +1949,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return fence;
 
-	xe_vma_destroy(vma, fence);
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-
 	return fence;
 }
 
@@ -2127,17 +2103,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
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
 
@@ -2939,6 +2905,26 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
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
@@ -2963,7 +2949,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			xe_vm_kill(vm, false);
 			goto unlock;
 		} else {
-			dma_fence_put(fence);
+			vm_bind_ioctl_ops_fini(vm, vops, fence);
 		}
 	}
 
-- 
2.34.1

