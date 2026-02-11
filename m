Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D5EA3F27
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F150710E623;
	Wed, 11 Feb 2026 15:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vgu+czvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAC110E622
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770823629; x=1802359629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UwORRdvNE86pPA1I/g/0KYBUe0ffCZqioJ72VkNQ0mw=;
 b=Vgu+czvI3m3odRrI+6/Rg5r4sGhf6oMv00fdODNXme/ToRF5Fg0mdq9V
 1/JSz+3LwY2Q4nOy6x/J8DGWNrna0on1+J69c/79OmkpRt1j75fx1yAVQ
 hStCGqr56s8h8m9ohhNAr6kDX81q5rZieuShBgv/13lvruelagt6iTyxd
 YzjyWjzhQiewFGdPxB6TGfLgn2JpzmxPofc23bHI0KH71/eyy3YosMq53
 bOY82EEH/khhX3laH6Md8qMwDEv12syxEJ54t7rXPm2Y2ZLfHoArKNuRo
 bgcu8KVTQdrA7zDEysXbWJZSkEAetcLfl0YjHur/VLFCqJD73f3onh2wK g==;
X-CSE-ConnectionGUID: DqViaX4uSWuqcwBaW9QLLg==
X-CSE-MsgGUID: z4r1MM4qQXCXaqEENwswhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89564292"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89564292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:09 -0800
X-CSE-ConnectionGUID: vHVbytfdSsKPtmhLOLX19w==
X-CSE-MsgGUID: PEnQ08i+TIKbfczQGtWpew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211388160"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:08 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v5 5/9] drm/xe/vm: Prevent binding of purged buffer objects
Date: Wed, 11 Feb 2026 20:56:34 +0530
Message-ID: <20260211152644.1661165-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
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

Add purge checking to vma_lock_and_validate() to block new mapping
operations on purged BOs while allowing cleanup operations to proceed.

Purged BOs have their backing pages freed by the kernel. New
mapping operations (MAP, PREFETCH, REMAP) must be rejected with
-EINVAL to prevent GPU access to invalid memory. Cleanup
operations (UNMAP) must be allowed so applications can release
resources after detecting purge via the retained field.

REMAP operations require mixed handling - reject new prev/next
VMAs if the BO is purged, but allow the unmap portion to proceed
for cleanup.

The check_purged flag in struct xe_vma_lock_and_validate_flags
distinguishes between these cases: true for new mappings (must reject),
false for cleanup (allow).

v2:
  - Clarify that purged BOs are permanently invalid (i915 semantics)
  - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs

v3:
  - Move xe_bo_is_purged check under vma_lock_and_validate (Matt)
  - Add check_purged parameter to distinguish new mappings from cleanup
  - Allow UNMAP operations to prevent resource leaks
  - Handle REMAP operation's dual nature (cleanup + new mappings)

v5:
  - Replace three boolean parameters with struct xe_vma_lock_and_validate_flags
    to improve readability and prevent argument transposition (Matt)
  - Use u32 bitfields instead of bool members to match xe_bo_shrink_flags
    pattern - more efficient packing and follows xe driver conventions (Thomas)
  - Pass struct as const since flags are read-only (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 67 +++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 21a2527ca064..71cf3ce6c62b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2907,8 +2907,20 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 	}
 }
 
+/**
+ * struct xe_vma_lock_and_validate_flags - Flags for vma_lock_and_validate()
+ * @res_evict: Allow evicting resources during validation
+ * @validate: Perform BO validation
+ * @check_purged: Reject operation if BO is purged
+ */
+struct xe_vma_lock_and_validate_flags {
+	u32 res_evict : 1;
+	u32 validate : 1;
+	u32 check_purged : 1;
+};
+
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 const struct xe_vma_lock_and_validate_flags *flags)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2917,10 +2929,15 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 	if (bo) {
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
-		if (!err && validate)
+
+		/* Reject new mappings to purged BOs; allow cleanup operations */
+		if (!err && flags->check_purged && xe_bo_is_purged(bo))
+			err = -EINVAL;
+
+		if (!err && flags->validate)
 			err = xe_bo_validate(bo, vm,
 					     !xe_vm_in_preempt_fence_mode(vm) &&
-					     res_evict, exec);
+					     flags->res_evict, exec);
 	}
 
 	return err;
@@ -3013,9 +3030,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		if (!op->map.invalidate_on_bind)
 			err = vma_lock_and_validate(exec, op->map.vma,
-						    res_evict,
-						    !xe_vm_in_fault_mode(vm) ||
-						    op->map.immediate);
+						    &(struct xe_vma_lock_and_validate_flags) {
+							    .res_evict = res_evict,
+							    .validate = !xe_vm_in_fault_mode(vm) ||
+									op->map.immediate,
+							    .check_purged = true
+						    });
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -3024,13 +3044,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
-					    res_evict, false);
+					    &(struct xe_vma_lock_and_validate_flags) {
+						    .res_evict = res_evict,
+						    .validate = false,
+						    .check_purged = false
+					    });
 		if (!err && op->remap.prev)
 			err = vma_lock_and_validate(exec, op->remap.prev,
-						    res_evict, true);
+						    &(struct xe_vma_lock_and_validate_flags) {
+							    .res_evict = res_evict,
+							    .validate = true,
+							    .check_purged = true
+						    });
 		if (!err && op->remap.next)
 			err = vma_lock_and_validate(exec, op->remap.next,
-						    res_evict, true);
+						    &(struct xe_vma_lock_and_validate_flags) {
+							    .res_evict = res_evict,
+							    .validate = true,
+							    .check_purged = true
+						    });
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
@@ -3039,7 +3071,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    res_evict, false);
+					    &(struct xe_vma_lock_and_validate_flags) {
+						    .res_evict = res_evict,
+						    .validate = false,
+						    .check_purged = false
+					    });
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -3052,9 +3088,18 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 				  region <= ARRAY_SIZE(region_to_mem_type));
 		}
 
+		/*
+		 * Prefetch attempts to migrate BO's backing store without
+		 * repopulating it first. Purged BOs have no backing store
+		 * to migrate, so reject the operation.
+		 */
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    res_evict, false);
+					    &(struct xe_vma_lock_and_validate_flags) {
+						    .res_evict = res_evict,
+						    .validate = false,
+						    .check_purged = true
+					    });
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
-- 
2.43.0

