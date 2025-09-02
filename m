Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C17CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945AF10E32C;
	Tue,  2 Sep 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCpLCiRv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B97610E32C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816865; x=1788352865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uh1AkRjxoF9n14ISAKMU7NVebGRo+KAyaousqRfd/3U=;
 b=bCpLCiRvwtKh4hxwrS+OuYpzsItYif88HTg/WBKum+pMhmWAPI73DMqA
 bHD4zWJVm+sBq4ib4RfLSPtx4XkfXRTvZ/R3I236Ma6GBhZXvzp0Kok8A
 Cm+gx1BhnmiGQzWo6J42APfjNedXsQdlXLpwKNyoO+z5PyLP2hTSvQInl
 eRFsakb7t13sBGknnWsqpxIwPYcXd38iN9jHzdkXzjBDB3XFKT9OSDo6z
 GN0xaeOl5PHEQj376VkdWMg4uymXcqrMD85/cnpFkqwbgRRaWYXqdP4yY
 fWctRBxgxQ/sHogidG9y+7eaEoCB8AfU5U/1pwTEtjPF3oeECsPQGuKud A==;
X-CSE-ConnectionGUID: CAOs+eQXTPakBtr4Xu5c7g==
X-CSE-MsgGUID: 5cv6AA/uTyKwMEYOejxIXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59157314"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59157314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:05 -0700
X-CSE-ConnectionGUID: EvVuGwVRTn2zvKsz6hD8Eg==
X-CSE-MsgGUID: 02oPYhQcT6qXZFdQ6oyeVg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 04/13] drm/xe: Convert SVM validation for exhaustive
 eviction
Date: Tue,  2 Sep 2025 14:40:12 +0200
Message-ID: <20250902124021.70211-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Convert SVM validation to support exhaustive eviction,
using xe_validation_guard().

v2:
- Wrap also xe_vm_range_rebind (Matt Brost)
- Adapt to argument changes of xe_validation_guard().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 99 +++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 83aa9f3e50b2..9e95b6317225 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -755,51 +755,48 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
+	struct xe_validation_ctx vctx;
 	struct list_head *blocks;
-	struct drm_exec *exec;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	ktime_t time_end = 0;
-	int err, idx;
+	int err = 0, idx;
 
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
 	xe_pm_runtime_get(xe);
-	exec = XE_VALIDATION_UNIMPLEMENTED;
-
- retry:
-	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
-				 ttm_bo_type_device,
-				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
-				 XE_BO_FLAG_CPU_ADDR_MIRROR, exec);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		if (xe_vm_validate_should_retry(NULL, err, &time_end))
-			goto retry;
-		goto out_pm_put;
-	}
 
-	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
-				&dpagemap_devmem_ops, dpagemap, end - start);
+	xe_validation_guard(&vctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
+		bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
+					 ttm_bo_type_device,
+					 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
+					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&vctx, &err);
+			break;
+		}
 
-	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-	list_for_each_entry(block, blocks, link)
-		block->private = vr;
+		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
+					&dpagemap_devmem_ops, dpagemap, end - start);
 
-	xe_bo_get(bo);
+		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+		list_for_each_entry(block, blocks, link)
+			block->private = vr;
 
-	/* Ensure the device has a pm ref while there are device pages active. */
-	xe_pm_runtime_get_noresume(xe);
-	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-					    start, end, timeslice_ms,
-					    xe_svm_devm_owner(xe));
-	if (err)
-		xe_svm_devmem_release(&bo->devmem_allocation);
+		xe_bo_get(bo);
 
-	xe_bo_unlock(bo);
-	xe_bo_put(bo);
-
-out_pm_put:
+		/* Ensure the device has a pm ref while there are device pages active. */
+		xe_pm_runtime_get_noresume(xe);
+		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
+						    start, end, timeslice_ms,
+						    xe_svm_devm_owner(xe));
+		if (err)
+			xe_svm_devmem_release(&bo->devmem_allocation);
+		xe_bo_unlock(bo);
+		xe_bo_put(bo);
+	}
 	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
 
@@ -862,12 +859,13 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
+	struct xe_validation_ctx vctx;
+	struct drm_exec exec;
 	struct xe_svm_range *range;
 	struct dma_fence *fence;
 	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
-	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -943,27 +941,32 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT - BIND");
 
-retry_bind:
-	xe_vm_lock(vm, false);
-	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
-	if (IS_ERR(fence)) {
-		xe_vm_unlock(vm);
-		err = PTR_ERR(fence);
-		if (err == -EAGAIN) {
-			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
-			range_debug(range, "PAGE FAULT - RETRY BIND");
-			goto retry;
+	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct xe_val_flags) {}, err) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+
+		xe_vm_set_validation_exec(vm, &exec);
+		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
+		xe_vm_set_validation_exec(vm, NULL);
+		if (IS_ERR(fence)) {
+			drm_exec_retry_on_contention(&exec);
+			err = PTR_ERR(fence);
+			xe_validation_retry_on_oom(&vctx, &err);
 		}
-		if (xe_vm_validate_should_retry(NULL, err, &end))
-			goto retry_bind;
-		goto err_out;
 	}
-	xe_vm_unlock(vm);
+	if (err)
+		goto err_out;
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
+	return 0;
 
 err_out:
+	if (err == -EAGAIN) {
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
+		range_debug(range, "PAGE FAULT - RETRY BIND");
+		goto retry;
+	}
 
 	return err;
 }
-- 
2.50.1

