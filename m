Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6771FCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A686610E6A9;
	Wed, 18 Mar 2026 07:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMaPv8bI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B9210E698
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817821; x=1805353821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lj9Z3EVMc6VaQF6JsCFDID58NLrraVyeLdKczJjt3vY=;
 b=YMaPv8bIwOj7+axkcfZM7vfzENhKv3EZHn9Y+HV3nr/3TFjJYPAmPxLy
 VXROkD6vqjAQ2ZxHcwwp2snBitEduzu5g9VfTy0Cm/SPwb+7l/6HD8xDn
 zML4HoG+rEgykUIpaJLiFAcfMU+gHL99kThpPXiTEjq5vZMqJroPqySaB
 20bDn8Vj6SoXt61L0qzzUvStk3IT7QxSadULhvbTA0IpuBcw/+dN18IL8
 /LcsFQeGyIyFutSo6xRJ3d1fL8C6mFTPjLfjqKmyR6nrfLD2cSZ33XchQ
 oANw0gDY8NqbFzQMOAd82j+LQDwtz0FWQkUmmHvtqjTW/QWJT7bNr6WIz w==;
X-CSE-ConnectionGUID: YyjIVJwvQMmoCCI+bTgS+A==
X-CSE-MsgGUID: +6E7SWX1T4+B/gctyiMuWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764261"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:21 -0700
X-CSE-ConnectionGUID: bqSrp9yRSNatD6zH08bTOw==
X-CSE-MsgGUID: ihRxk/RUSDek9BtziNv/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424030"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 06/15] drm/xe: Extract xe_vma_lock_and_validate helper
Date: Wed, 18 Mar 2026 13:14:47 +0530
Message-Id: <20260318074456.2839499-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 22 ++--------------------
 drivers/gpu/drm/xe/xe_vm.c        | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h        |  3 +++
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 67dd07927684..8c159e3512ee 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -45,24 +45,6 @@ static int xe_pagefault_entry_size(void)
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
-	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
-		xe_bo_validate(bo, vm, true, exec);
-}
-
 static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 				   bool atomic)
 {
@@ -103,8 +85,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
-					 needs_vram == 1);
+		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram,
+					       needs_vram == 1);
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5572e12c2a7e..659504ec5a13 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1170,6 +1170,37 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
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
+	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
+		xe_bo_validate(bo, vm, true, exec);
+}
+
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0bc7ed23eeae..127cecfcb80b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -271,6 +271,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move);
+
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
-- 
2.34.1

