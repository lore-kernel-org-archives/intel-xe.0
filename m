Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E387CC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 17:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF07B10E25E;
	Thu, 25 Jul 2024 17:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAHe5eXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B20010E25E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721929800; x=1753465800;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RhMqdxjretGZbv35klTPTWktNxxGpN5jhr1hoK/QNfs=;
 b=SAHe5eXRrQsTdTk2dCzo+tGeWjiE92rNn3ZOvYvPKsLSBSs3ml3M2WKN
 VEsJCr8oLWBfFX8Z8Kn8w+b6b5AnznVFUnjTGxoID13VgC0aCuFouEwTX
 d6uNQ/ppy7R6My5K6qZEyP/KW/AiHTo3eKMb/G09IXocw3lr+0B4Z8Nk0
 bFOACjidzZKbrD+WVxgvk8wEyBP82kKlkeWmpeJppbuw08Gp2ovOs/bpn
 q6WMf7qH6sB2x6jqcg2/964NVqT63f5p5WyC3Dv7ZlUuHc2k8sJ4NQ62s
 ITgWuHpUUOA8MuMd8T3C0iGwz8Qycr766BwLTJbajoyHjO/grZdwUxF+N g==;
X-CSE-ConnectionGUID: 0arX0yJgRDullBAut35ecg==
X-CSE-MsgGUID: Hs5slmNNS1mKM1ORJK8vQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37206752"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="37206752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:50:00 -0700
X-CSE-ConnectionGUID: WGaHPaFcRSinR73qKX5JRQ==
X-CSE-MsgGUID: WUJpIbaNSt+TcvR2N6snTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52926197"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:50:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Nuke VM's mapping upon close
Date: Thu, 25 Jul 2024 10:50:47 -0700
Message-Id: <20240725175047.1931917-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Clear root PT entry and invalidate entire VM's address space.

v2:
 - s/vma/vm in kernel doc (CI)
 - Don't nuke migration VM as this occur at driver unload (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 +++
 drivers/gpu/drm/xe/xe_pt.c                  | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_pt.h                  |  2 ++
 drivers/gpu/drm/xe/xe_vm.c                  |  8 +++++++
 5 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 87cb76a8718c..52cb55c6a7aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -379,6 +379,30 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
 
+/**
+ * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
+ * @gt: graphics tile
+ * @vm: VM to invalidate
+ *
+ * Invalidate entire VM's address space
+ */
+void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
+{
+	struct xe_gt_tlb_invalidation_fence fence;
+	u64 range = 1ull << vm->xe->info.va_bits;
+	int ret;
+
+	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+
+	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
+	if (ret < 0) {
+		xe_gt_tlb_invalidation_fence_fini(&fence);
+		return;
+	}
+
+	xe_gt_tlb_invalidation_fence_wait(&fence);
+}
+
 /**
  * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
  * @gt: graphics tile
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index a84065fa324c..d0cefc6f17e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -13,6 +13,7 @@
 struct xe_gt;
 struct xe_guc;
 struct xe_vma;
+struct xe_vm;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
@@ -23,6 +24,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
+void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
+
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 97a6a0b0b8ba..7a5b90a50c6d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -211,6 +211,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 	xe_pt_free(pt);
 }
 
+/**
+ * xe_pt_clear() - Clear a page-table.
+ * @xe: xe device.
+ * @pt: The page-table.
+ *
+ * Clears page-table by setting to zero.
+ */
+void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
+{
+	struct iosys_map *map = &pt->bo->vmap;
+
+	xe_map_memset(xe, map, 0, 0, SZ_4K);
+}
+
 /**
  * DOC: Pagetable building
  *
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..a7675e8905ed 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -35,6 +35,8 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
+void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
+
 int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
 struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 				       struct xe_vma_ops *vops);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12d43c35978c..9f1abc992f7a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1551,6 +1551,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct xe_vma *vma, *next_vma;
 	struct drm_gpuva *gpuva, *next;
 	u8 id;
+	bool migration = (vm->flags & XE_VM_FLAG_MIGRATION);
 
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
@@ -1608,12 +1609,19 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	for_each_tile(tile, xe, id) {
 		if (vm->pt_root[id]) {
+			if (!migration)
+				xe_pt_clear(xe, vm->pt_root[id]);
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 			vm->pt_root[id] = NULL;
 		}
 	}
 	xe_vm_unlock(vm);
 
+	if (!migration) {
+		for_each_tile(tile, xe, id)
+			xe_gt_tlb_invalidation_vm(tile->primary_gt, vm);
+	}
+
 	/*
 	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
 	 * Since we hold a refcount to the bo, we can remove and free
-- 
2.34.1

