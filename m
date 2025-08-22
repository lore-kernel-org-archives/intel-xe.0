Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3F2CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094910EAA7;
	Fri, 22 Aug 2025 09:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoG6zWnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CE210EAA7
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855667; x=1787391667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nN4fit9OIYsF6bJEvFSHujjpRvqAt0xEeYnce0ncTGs=;
 b=AoG6zWnt1mcbm8TB9bWtzGOKQHm6rCE7wtkifGZLKPo+vBxpTO13NfG+
 Aq1or1GiQQUkgS0R1Jv0gOoepG7wJP2atqTSjRcdykjOmDfpiFC/x7NGH
 CdzkXpiiGt0BLH3+yVpwWoOMcx2rnLgEMheJ2sHn8GJUAGVzux9zLS98e
 4BXKpsE872ckmffP2+srwK5F1dP95lOHksuwXneGEjQv3NLm6j4UWXEhQ
 Y/lO0LUwhv9MqPrKrlhkQB+kPJ/p2BnYFIjaPRl06oCQtmx5chXxp2GYL
 AhxKXGf+LZ0fZz/sLZOqVlbVcEUcCKUPPSdrzQBEQwOIovkn65ZmQzzkB g==;
X-CSE-ConnectionGUID: 7dfBOILsQTuGoUc9cpp3rA==
X-CSE-MsgGUID: 334VJppST8KMRCapHnns8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760611"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:07 -0700
X-CSE-ConnectionGUID: fYNRzTQZQ/qzVdQhSxOj4w==
X-CSE-MsgGUID: HCdAbq9MSjSXNq9hgUrY1Q==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 07/16] drm/xe: Convert SVM validation for exhaustive
 eviction
Date: Fri, 22 Aug 2025 11:40:21 +0200
Message-ID: <20250822094030.3499-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_svm.c | 99 +++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 39e3aa6df25a..667ca1f7cc29 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -699,51 +699,48 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
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
-
-	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-	list_for_each_entry(block, blocks, link)
-		block->private = vr;
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
 
-	xe_bo_get(bo);
+		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
+					&dpagemap_devmem_ops, dpagemap, end - start);
 
-	/* Ensure the device has a pm ref while there are device pages active. */
-	xe_pm_runtime_get_noresume(xe);
-	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-					    start, end, timeslice_ms,
-					    xe_svm_devm_owner(xe));
-	if (err)
-		xe_svm_devmem_release(&bo->devmem_allocation);
+		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+		list_for_each_entry(block, blocks, link)
+			block->private = vr;
 
-	xe_bo_unlock(bo);
-	xe_bo_put(bo);
+		xe_bo_get(bo);
 
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
 
@@ -820,11 +817,12 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
+	struct xe_validation_ctx vctx;
+	struct drm_exec exec;
 	struct xe_svm_range *range;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
-	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -894,27 +892,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
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

