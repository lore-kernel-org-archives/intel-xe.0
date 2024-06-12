Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC1EC2BA12
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062D910E77E;
	Wed, 12 Jun 2024 02:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TG9WR75g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A2510E780
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158541; x=1749694541;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mk4kwFMI9A4PyR0vSVkhZe2uD5/K3+xPH7LEOsEYr7I=;
 b=TG9WR75g2shDbkMW2NQ+wRgLcdD6pUw3UaPED541BXJQ+z+2ZL3FzdAk
 S4CkCS6IbVUJqwH3GxhHKpPgSdCJTfFUfWsi2xaoJqgPUR4LUcDkgZ1Iz
 h0yhCOa4CpMjicDqsk8DSlnMtCD3p85NRApMXYaYxFptpx23jUWucPAjO
 CiRIOwBdnpt+x5yD9cOvFcQyN/aGRMHXG4u0OWcYr4RO3vB9Vs7p1dPx7
 0exf906BsTW+/rv7PJi6tLAOQDksnhci2UFAnu05gQTb3g1A6HP6anBYe
 u5Wveya6y2A8T9+xVuFIMb04577XFfvXu/3VD2ohOfEROzjGCO65yLDBt w==;
X-CSE-ConnectionGUID: mSAprsx7TLO6/SQEFWVhMg==
X-CSE-MsgGUID: 3PPuNChmQry5iuIW62ge+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427824"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: SbSobul/RGq090FdD0jFjw==
X-CSE-MsgGUID: kARypjkmSKqss8t/kyxo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763659"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 40/43] drm/xe/svm: Migration from sram to vram for system
 allocator
Date: Tue, 11 Jun 2024 22:26:02 -0400
Message-Id: <20240612022605.385062-40-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

If applicable, migrate a range of hmmptr from sram to vram for
system allocator. Traditional userptr is not migrated. Only userptr
created during fault (aka userptr splitted from system allocator vma,
aka fault userptr in codes) can be migrated.

Instead of the whole userptr, only a sub-range of userptr is populated
and bind to GPU page table. Right now the range granularity is 2MiB,
which will be overwritten by memory attribute API.

FIXME: The migration should be conditional on user memory attributes
setting. Add this logic when memory attributes are supported

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 17 +++++++-----
 drivers/gpu/drm/xe/xe_vm.h           |  2 +-
 3 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9e47e0c97a1b..004cd4d8e1a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -128,6 +128,12 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	ktime_t end = 0;
 	int err;
 	bool atomic;
+	/**FIXME: use migration granularity from memory attributes*/
+	u64 migrate_granularity = SZ_2M;
+	u64 fault_addr = pf->page_addr;
+	u64 fault_offset, fault_cpu_addr;
+	u64 aligned_cpu_fault_start, aligned_cpu_fault_end;
+	u64 cpu_va_start, cpu_va_end, gpu_va_start, gpu_va_end;
 
 	trace_xe_vma_pagefault(vma);
 	atomic = access_is_atomic(pf->access_type);
@@ -144,13 +150,42 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 		}
 	}
 
+	fault_offset = fault_addr - xe_vma_start(vma);
+	fault_cpu_addr = xe_vma_userptr(vma) + fault_offset;
+	aligned_cpu_fault_start = ALIGN_DOWN(fault_cpu_addr, migrate_granularity);
+	aligned_cpu_fault_end  = aligned_cpu_fault_start + migrate_granularity;
+
+	if (xe_vma_is_userptr(vma)) {
+		cpu_va_start = max_t(u64, xe_vma_userptr(vma), aligned_cpu_fault_start);
+		cpu_va_end = min_t(u64, xe_vma_userptr_end(vma), aligned_cpu_fault_end);
+		gpu_va_start = xe_vma_start(vma) + (cpu_va_start - xe_vma_userptr(vma));
+		gpu_va_end = xe_vma_end(vma) - (xe_vma_userptr_end(vma) - cpu_va_end);
+	} else {
+		gpu_va_start = xe_vma_start(vma);
+		gpu_va_end = xe_vma_end(vma);
+	}
+
 retry_userptr:
 	xe_vm_userptr_garbage_collector(vm);
 	if (xe_vma_is_userptr(vma) &&
 	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+		struct xe_userptr *userptr = &uvma->userptr;
+		struct drm_hmmptr *hmmptr = &userptr->hmmptr;
+
+		mmap_read_lock(hmmptr->notifier.mm);
+		if (xe_vma_is_fault_userptr(vma)) {
+			/**FIXME: add migration policy here*/
+			err = drm_svm_migrate_hmmptr_to_vram(&vm->gpuvm, &tile->mem.vram.drm_mr,
+                hmmptr, cpu_va_start, cpu_va_end);
+			if (err) {
+				mmap_read_unlock(hmmptr->notifier.mm);
+				return err;
+			}
 
-		err = xe_vma_userptr_pin_pages(uvma);
+		}
+		err = xe_vma_userptr_pin_pages(uvma, cpu_va_start, cpu_va_end, true);
+		mmap_read_unlock(hmmptr->notifier.mm);
 		if (err)
 			return err;
 	}
@@ -167,8 +202,8 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 
 		/* Bind VMA only to the GT that has faulted */
 		trace_xe_vma_pf_bind(vma);
-		fence = xe_vma_rebind(vm, vma, xe_vma_start(vma),
-			    xe_vma_end(vma), BIT(tile->id));
+		fence = xe_vma_rebind(vm, vma, gpu_va_start,
+			    gpu_va_end, BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			if (xe_vm_validate_should_retry(&exec, err, &end))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4de4817f041b..a5f732db9e1c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -63,7 +63,7 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 		-EAGAIN : 0;
 }
 
-int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
+int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma, u64 start, u64 end, bool mmap_locked)
 {
 	struct drm_hmmptr *hmmptr = &uvma->userptr.hmmptr;
 	struct xe_vma *vma = &uvma->vma;
@@ -73,14 +73,15 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 
 	lockdep_assert_held(&vm->lock);
 	xe_assert(xe, xe_vma_is_userptr(vma));
+	xe_assert(xe, start >= xe_vma_userptr(vma));
+	xe_assert(xe, end <= xe_vma_userptr_end(vma));
 
-	ret = drm_svm_hmmptr_populate(hmmptr, NULL, xe_vma_userptr(vma),
-			 xe_vma_userptr(vma) + xe_vma_size(vma),
-			 !xe_vma_read_only(vma), false);
+	ret = drm_svm_hmmptr_populate(hmmptr, NULL, start, end,
+			 !xe_vma_read_only(vma), mmap_locked);
 	if (ret)
 		return ret;
 
-	xe_vma_userptr_dma_map_pages(uvma, xe_vma_userptr(vma), xe_vma_userptr_end(vma));
+	xe_vma_userptr_dma_map_pages(uvma, start, end);
 	return 0;
 }
 
@@ -736,7 +737,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	/* Pin and move to temporary list */
 	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
 				 userptr.repin_link) {
-		err = xe_vma_userptr_pin_pages(uvma);
+		err = xe_vma_userptr_pin_pages(uvma, xe_vma_userptr(&uvma->vma),
+			xe_vma_userptr_end(&uvma->vma), false);
 		if (err == -EFAULT) {
 			list_del_init(&uvma->userptr.repin_link);
 
@@ -2116,7 +2118,8 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		drm_exec_fini(&exec);
 
 	if (xe_vma_is_userptr(vma) && !xe_vma_is_fault_userptr(vma)) {
-		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
+		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma), xe_vma_userptr(vma),
+				xe_vma_userptr_end(vma), false);
 		if (err) {
 			prep_vma_destroy(vm, vma, false);
 			xe_vma_destroy_unlocked(vma);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4c75438e7504..ec4201b042ec 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -253,7 +253,7 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 	}
 }
 
-int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
+int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma, u64 start, u64 end, bool mmap_locked);
 
 void xe_vma_userptr_dma_map_pages(struct xe_userptr_vma *uvma,
 		u64 start, u64 end);
-- 
2.26.3

