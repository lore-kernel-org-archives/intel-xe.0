Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B65C79FBF
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D586210F114;
	Wed,  9 Sep 2026 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FP5VHIhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADB010F114
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957735; x=1820493735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F4kXF5oUc9Mp8wExrzAg8pv89BiZy7e+VKzuSNJ+5Ms=;
 b=FP5VHIhWdgDUy5XcN8AEA+ADYEcwsY+ClyIT5xKdS0uLJ+u7k2qb3FI4
 8k/Uv6COCejs8z/shsIiE+iMzAm2A/O6i9SrAhbTA0uKOfwgBv8BPQfTe
 pAN9GBbKDu5VR0LxEn9uUfqN93a4BttqgbU2utGf80A+lrxxhcH9BSFZ3
 xya6RFva9fKQIsVxEKWj7f2i4hR4UKXObHS0+Il4KKDnGsiMouppVvOJv
 4BpAGFKI3bfnJ7UroUu5Z5ZneUIv6znAisJJDVGQCvdiMRMGAr9UJyj7L
 Na7TUbUEkbe8+VbwdxWc+ZQo0iYUYhiVgzNgVrq2O7zKTzcqneW8tv0h6 A==;
X-CSE-ConnectionGUID: jToMYPUjRwCMfyFvnSHLAg==
X-CSE-MsgGUID: Yxyl8x0ZTjuTJsfz2Br2QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715571"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715571"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:15 -0700
X-CSE-ConnectionGUID: 0l9S6XF7THCZKjSZwpJiwQ==
X-CSE-MsgGUID: O0k2UiINReidFWEO6oVoZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246657"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 16/21] drm/xe/vm: Add xe_vma_supports_access_ctr() helper
Date: Wed,  9 Sep 2026 18:15:10 +0530
Message-ID: <20260909124457.1610890-39-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Hardware access counter slots are finite resources. Add a helper
to determine whether a VMA is eligible for access counting, so
callers will avoid wasting slots on BOs that cannot benefit from
migration hints.

A VMA is eligible if:
  - The device is a discrete GPU (access counters unused on iGPU)
  - It is a CPU address mirror (SVM) VMA, which is always migratable
  - The backing BO has more than one placement region
  - The BO is not already resident in VRAM local to the triggering tile

Userptr and null VMAs are excluded as they have no associated BO.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 32 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c             | 44 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h             |  3 ++
 3 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index 1aff8b710862..ed1ed6091ac5 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -68,7 +68,7 @@ static int xe_access_counter_vma_setup(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
-	struct dma_fence *fence;
+	struct dma_fence *fence = NULL;
 	int err = 0;
 
 	/*TODO : Handle userptr move to vram */
@@ -89,9 +89,22 @@ static int xe_access_counter_vma_setup(struct xe_vm *vm, struct xe_vma *vma,
 	dma_fence_put(vma->ac_move_fence);
 	vma->ac_move_fence = NULL;
 
-	/* Lock VM and BOs dma-resv */
-	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
+	/*
+	 * Ignore duplicate locks: the eligibility check below needs the BO
+	 * resv held, so we lock the VMA explicitly and xe_vma_lock_and_validate()
+	 * then locks the same BO again.
+	 */
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
+			       (struct xe_val_flags) { .exec_ignore_duplicates = true });
 	drm_exec_until_all_locked(&exec) {
+		err = xe_vm_lock_vma(&exec, vma);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			break;
+
+		if (!xe_vma_supports_access_ctr(vm->xe, vma, tile))
+			break;
+
 		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
@@ -110,7 +123,7 @@ static int xe_access_counter_vma_setup(struct xe_vm *vm, struct xe_vma *vma,
 	 * store the fence on the VMA so the page-fault handler can wait on it
 	 * if needed, rather than blocking here under vm->lock.
 	 */
-	if (!err && !IS_ERR(fence))
+	if (!err && fence && !IS_ERR(fence))
 		vma->ac_move_fence = fence;
 
 	xe_validation_ctx_fini(&ctx);
@@ -143,6 +156,12 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 		goto unlock_vm;
 	}
 
+	if (!IS_DGFX(xe)) {
+		/* Access counter migration hints target device VRAM only. */
+		ac->consumer.page_va = ac->gran_end;
+		goto unlock_vm;
+	}
+
 	page_va = ac->consumer.page_va;
 	gran_end = ac->gran_end;
 
@@ -180,6 +199,11 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 	if (xe_vma_is_cpu_addr_mirror(vma)) {
 		struct xe_svm_range *range;
 
+		if (!xe_vma_supports_access_ctr(xe, vma, gt_to_tile(gt))) {
+			ac->consumer.page_va = min(xe_vma_end(vma), gran_end);
+			goto unlock_vm;
+		}
+
 		/*
 		 * Find the first existing SVM range in [hint_va, gran_end).
 		 * We use range_find (not find_or_insert) because AC events are
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 68adb2a7422c..5f09f446d86f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4874,6 +4874,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	kvfree(snap);
 }
 
+/**
+ * xe_vma_supports_access_ctr - Determine if VMA is eligible for access counting
+ * @xe: Pointer to the Xe device structure
+ * @vma: The VMA
+ * @tile: Tile with which VMA bound is associated to
+ *
+ * Note, access counters are not used unless enabled in LRC.
+ */
+bool xe_vma_supports_access_ctr(struct xe_device *xe,
+				struct xe_vma *vma,
+				struct xe_tile *tile)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct ttm_resource *res;
+
+	if (!IS_DGFX(xe))
+		return false;
+
+	if (xe_vma_is_cpu_addr_mirror(vma)) {
+		/*TODO: Add policy based on preferred locations */
+		return true;
+	}
+
+	/* userptr or using null vma */
+	if (!bo)
+		return false;
+
+	xe_bo_assert_held(bo);
+	res = bo->ttm.resource;
+	/* if for some reason no backing store, nothing to migrate */
+	if (!res)
+		return false;
+
+	/* cannot migrate if single placement */
+	if (bo->placement.num_placement <= 1)
+		return false;
+
+	/* cannot migrate to ourself (already in VRAM local to @tile) */
+	if (!tile->mem.vram || res->mem_type == tile->mem.vram->placement)
+		return false;
+
+	return true;
+}
+
 /**
  * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
  * @xe: Pointer to the Xe device structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index ef34fe742d22..2a5ae0aacc97 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -185,6 +185,9 @@ struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
 
+bool xe_vma_supports_access_ctr(struct xe_device *xe, struct xe_vma *vma,
+				struct xe_tile *tile);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
-- 
2.43.0

