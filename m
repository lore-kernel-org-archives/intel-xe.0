Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560BFC3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B27D10E404;
	Mon,  7 Apr 2025 09:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6Z8UUgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1115C10E404
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019609; x=1775555609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5VzQ4UAWS4E77pMHPXHQea7gC7+/BZ81gpZXW5yguKo=;
 b=F6Z8UUgETHv2IE7I14m+W5gJsHIoPsjSJduJK5Az8E0XE+PgAUIRyK5y
 77nWTL9h2WHrlk9piPu3867gN6qEaY1wVA0JvFM4lVMjMyPZHgf9BbFdL
 DzGfMxjYpksqqjykS6mFQrXMoT+ZqGFqOwctTBw0PmzWIMjys6u+OlyQz
 SxeTYxEtiK5iQ9ZyACNs+sMwq6UwyH/HtyfEf48CF7MOWLeKaITfGBEkQ
 JDpaPATJbNDFEWuoUIozU2x1GdMUmfQIkrW1UGyjOwzlQkBmeZfawDFM4
 7DJ/yQT+IaVM8aEXzFAcEc7cINNPQe5w5QComoDUwmF9qiW157HCPCbGs Q==;
X-CSE-ConnectionGUID: Pe4sjxzSRkmKQyb00miqqg==
X-CSE-MsgGUID: Rhz4mSmfSSO81lUHGvsV7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029456"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:29 -0700
X-CSE-ConnectionGUID: D3UOKZCaR4GJ4o5k67ehMg==
X-CSE-MsgGUID: bmnlhvatTPq2h4MU9Q+rZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778885"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 25/32] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Date: Mon,  7 Apr 2025 15:47:12 +0530
Message-Id: <20250407101719.3350996-26-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

If the platform does not support atomic access on system memory, and the
ranges are in system memory, but the user requires atomic accesses on
the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
operations as well.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         |  9 +++++++--
 drivers/gpu/drm/xe/xe_svm.c        | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 11 ++++++++++-
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2479d830d90a..ba9b30b25ded 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
 	return true;
 }
 
-static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
+static bool xe_atomic_for_system(struct xe_vm *vm,
+				 struct xe_bo *bo,
+				 struct xe_vma *vma)
 {
 	struct xe_device *xe = vm->xe;
 
 	if (!xe->info.has_device_atomics_on_smem)
 		return false;
 
+	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
+		return true;
+
 	/*
 	 * If a SMEM+LMEM allocation is backed by SMEM, a device
 	 * atomics will cause a gpu page fault and which then
@@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
 		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
-		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
+		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index efcba4b77250..d40111e29bfe 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -717,6 +717,16 @@ static bool supports_4K_migration(struct xe_device *xe)
 	return false;
 }
 
+static bool needs_ranges_in_vram_to_support_atomic(struct xe_device *xe, struct xe_vma *vma)
+{
+	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
+	    (xe->info.has_device_atomics_on_smem &&
+	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
+		return false;
+
+	return true;
+}
+
 /**
  * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
  * @range: SVM range for which migration needs to be decided
@@ -735,7 +745,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	if (!range->base.flags.migrate_devmem)
 		return false;
 
-	needs_migrate = region;
+	needs_migrate =  needs_ranges_in_vram_to_support_atomic(vm->xe, vma) || region;
 
 	if (needs_migrate && !IS_DGFX(vm->xe)) {
 		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
@@ -828,7 +838,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	}
 
-	if (atomic)
+	if (atomic && needs_ranges_in_vram_to_support_atomic(vm->xe, vma))
 		ctx.vram_only = 1;
 
 	range_debug(range, "GET PAGES");
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 92b8e0cac063..0f9c45ce82b4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2930,6 +2930,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
 			svm_range = xa_load(&op->prefetch_range.range, i);
 			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+				region = region ? region : 1;
 				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
 				if (err) {
@@ -2938,6 +2939,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 					return -ENODATA;
 				}
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
+				ctx.vram_only = 1;
 			}
 
 			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index ef50031649e0..7e1a95106cb9 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -69,7 +69,16 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			  struct xe_vma **vmas, int num_vmas,
 			  struct drm_xe_madvise_ops ops)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
+	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
+		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
+	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.atomic_access = ops.atomic.val;
+	/*TODO: handle bo backed vmas */
 	return 0;
 }
 
-- 
2.34.1

