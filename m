Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FC9C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C510E68F;
	Tue, 22 Jul 2025 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3R2AIZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366910E68F
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189754; x=1784725754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BU7w4Ws3CpYAPR/fwr/ENSXEjQ9g2VrJIOIX718BKO0=;
 b=J3R2AIZtSTL+3drOnfTCfd787iFGV+7ItycBS1YFJpsFqMDqFFv2/OIb
 Ro+TcPYNpMOSiupCQaRnePmWUbMxcmP5TycCCGP8bcSKDcnLqnhJ8VntZ
 ug3IlSnFOs00Uwp9SXMkZusEJrSRPCVKhOARfNmvTfHpiu/VMomU1fXaW
 83D+dbcsTxU8uWUHSQB2wMdTdmbbH3P+xO6lU4Lyx/B+RcNwSfHywvLUE
 3WOLYGzG4yPW38yElB7cCxQVbfhwgbvXVAL0es34lIgCU09aYxuSAUBlP
 MvcA8bUCr57S2aZnznl29REkX9+X9oiE+iXEOalX7vm8DvSl4SRWahCiA g==;
X-CSE-ConnectionGUID: AqO6FLhQSZCL+6ldPdj/Cw==
X-CSE-MsgGUID: dUdLp0J2So2P13Ut84WyLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530400"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:14 -0700
X-CSE-ConnectionGUID: +DZCq4IVQWeui2Gu/gWAhg==
X-CSE-MsgGUID: +8RStIbtQb2qirsQ5d1jrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420698"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 18/23] drm/xe/madvise: Skip vma invalidation if mem attr
 are unchanged
Date: Tue, 22 Jul 2025 19:05:21 +0530
Message-Id: <20250722133526.3550547-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

If a VMA within the madvise input range already has the same memory
attribute as the one requested by the user, skip PTE zapping for that
VMA to avoid unnecessary invalidation.

v2 (Matthew Brost)
- fix skip_invalidation for new attributes
- s/u32/bool
- Remove unnecessary assignment  for kzalloc'ed

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 52 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 ++++
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 727833780b4b..fbb6aa8a7a5e 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -84,13 +84,19 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
 
 	for (i = 0; i < num_vmas; i++) {
-		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
-
-		/* Till multi-device support is not added migration_policy
-		 * is of no use and can be ignored.
-		 */
-		vmas[i]->attr.preferred_loc.migration_policy =
+		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		    vmas[i]->attr.preferred_loc.migration_policy ==
+		    op->preferred_mem_loc.migration_policy) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			/* Till multi-device support is not added migration_policy
+			 * is of no use and can be ignored.
+			 */
+			vmas[i]->attr.preferred_loc.migration_policy =
 						op->preferred_mem_loc.migration_policy;
+		}
 	}
 }
 
@@ -105,7 +111,12 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
 
 	for (i = 0; i < num_vmas; i++) {
-		vmas[i]->attr.atomic_access = op->atomic.val;
+		if (vmas[i]->attr.atomic_access == op->atomic.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.atomic_access = op->atomic.val;
+		}
 
 		bo = xe_vma_bo(vmas[i]);
 		if (!bo)
@@ -130,9 +141,14 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
-	for (i = 0; i < num_vmas; i++)
-		vmas[i]->attr.pat_index = op->pat_index.val;
-
+	for (i = 0; i < num_vmas; i++) {
+		if (vmas[i]->attr.pat_index == op->pat_index.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.pat_index = op->pat_index.val;
+		}
+	}
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -158,17 +174,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
 		XE_WARN_ON(1);
 
-	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
-
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-		if (xe_vma_is_cpu_addr_mirror(vma))
+		if (vma->skip_invalidation)
 			continue;
 
-		for_each_tile(tile, vm->xe, id) {
-			if (xe_pt_zap_ptes(tile, vma)) {
-				tile_mask |= BIT(id);
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+								      xe_vma_start(vma),
+								      xe_vma_end(vma));
+		} else {
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes(tile, vma)) {
+					tile_mask |= BIT(id);
 
 				/*
 				 * WRITE_ONCE pairs with READ_ONCE
@@ -176,6 +195,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				 */
 				WRITE_ONCE(vma->tile_invalidated,
 					   vma->tile_invalidated | BIT(id));
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index cd94d8b5819d..81d92d886578 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -157,6 +157,12 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
+	/**
+	 * @skip_invalidation: Used in madvise to avoid invalidation
+	 * if mem attributes doesn't change
+	 */
+	bool skip_invalidation;
+
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.34.1

