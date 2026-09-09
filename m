Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3138C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9A10F110;
	Wed,  9 Sep 2026 12:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mv4w68w0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C788610F104
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957718; x=1820493718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/zORRCwbb/9pnQjakMa5i6LxZlMfqBcxvdDt02s6xcs=;
 b=Mv4w68w0cDd70kTXP6v+42+RYz1V168KRpKsevgdptnCEOdLbSdVTbIU
 i7uu8sztmmWSKjJ8vZ8+qf2YCyOODqKlZp9Di2KKc+VSHjH5REINZBEG/
 WDYDQe+seTDtJ0qcydj5VFN5ty6TIxvp1iMlx1Qc7jmsQ3tbbq6MYl8WV
 NRn7UKVn++JahPSpTky/oXg3M5uGCPpxLzx8VVBIlAe49ZeB9WQPC80Ge
 GvlrFJF+tL2NfcA8LgzYRgeXxMDc6ZcYMd+0ZxfWCT1U2mjExfv7RyQXZ
 8MAWrA0rzADvPA8HNct0mvuBah6M9N+vIpoitpXE6rxO5ncJLJ0Mwz6zR A==;
X-CSE-ConnectionGUID: PzmfQtDTThKTeWyn2C4rUQ==
X-CSE-MsgGUID: QW6n0QAzThSRKViSR9bZXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715490"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:57 -0700
X-CSE-ConnectionGUID: KccOXuTLSzyXfpP1Zxu39w==
X-CSE-MsgGUID: 9vHDslf3Q02GzIl67zzVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246538"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 05/21] drm/xe: Extract xe_vma_lock_and_validate helper
Date: Wed,  9 Sep 2026 18:14:59 +0530
Message-ID: <20260909124457.1610890-28-himal.prasad.ghimiray@intel.com>
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

Move xe_pagefault_begin to xe_vm.c as xe_vma_lock_and_validate for reuse
in access counter processing.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 35 ++----------------------
 drivers/gpu/drm/xe/xe_vm.c        | 44 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h        |  3 +++
 3 files changed, 49 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index e81ca24df37f..347cca1ec1c3 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -113,37 +113,6 @@ static int xe_pagefault_entry_size(void)
 	return roundup_pow_of_two(sizeof(struct xe_pagefault));
 }
 
-static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
-			      struct xe_vram_region *vram, bool need_vram_move)
-{
-	struct xe_bo *bo = xe_vma_bo(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	int err;
-
-	err = xe_vm_lock_vma(exec, vma);
-	if (err)
-		return err;
-
-	if (!bo)
-		return 0;
-
-	/*
-	 * Skip validate/migrate for DONTNEED/purged BOs - repopulating
-	 * their pages would prevent the shrinker from reclaiming them.
-	 * For non-scratch VMs there is no safe fallback so fail the fault.
-	 * For scratch VMs let xe_vma_rebind() run normally; it will install
-	 * scratch PTEs so the GPU gets safe zero reads instead of faulting.
-	 */
-	if (unlikely(xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo))) {
-		if (!xe_vm_has_scratch(vm))
-			return -EACCES;
-		return 0;
-	}
-
-	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
-		xe_bo_validate(bo, vm, true, exec);
-}
-
 static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 				   struct xe_pagefault *pf, bool atomic)
 {
@@ -190,8 +159,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
 				       (struct xe_val_flags) {});
 		drm_exec_until_all_locked(&exec) {
-			err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
-						 needs_vram == 1);
+			err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram,
+						       needs_vram == 1);
 			drm_exec_retry_on_contention(&exec);
 			xe_validation_retry_on_oom(&ctx, &err);
 			if (err)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 753a5fc55baa..7dd8fbf94bc8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1318,6 +1318,50 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 	return err;
 }
 
+/**
+ * xe_vma_lock_and_validate - Lock Vma and Validate bo location
+ * @exec: drm execution context
+ * @vma: VMA to prepare
+ * @vram: target VRAM region
+ * @need_vram_move: true if BO must be moved to VRAM
+ *
+ * Locks the VMA and its associated BO, then ensures the BO is in the correct
+ * memory location for GPU access. If need_vram_move is true, migrates the BO
+ * to VRAM; otherwise validates it in its current location.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	int err;
+
+	err = xe_vm_lock_vma(exec, vma);
+	if (err)
+		return err;
+
+	if (!bo)
+		return 0;
+
+	/*
+	 * Skip validate/migrate for DONTNEED/purged BOs - repopulating
+	 * their pages would prevent the shrinker from reclaiming them.
+	 * For non-scratch VMs there is no safe fallback so fail the fault.
+	 * For scratch VMs let xe_vma_rebind() run normally; it will install
+	 * scratch PTEs so the GPU gets safe zero reads instead of faulting.
+	 */
+	if (unlikely(xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo))) {
+		if (!xe_vm_has_scratch(vm))
+			return -EACCES;
+		return 0;
+	}
+
+	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
+		xe_bo_validate(bo, vm, true, exec);
+}
+
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..ef34fe742d22 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -281,6 +281,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move);
+
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
-- 
2.43.0

