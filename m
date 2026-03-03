Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B98EDA687
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38D510E835;
	Tue,  3 Mar 2026 15:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNh3ZshM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B1D10E835
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551249; x=1804087249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0OI+M4YnFKa6M1n6UqzeTMpnQkQLXJwvCXFoP8/k8rY=;
 b=dNh3ZshMP62T79tH5ZgY6y5GsGlEyytfIIHEgVfZOphAlSZTW8joUyvf
 GHnY1c4b+lWMQNJdQobyYh8HAcrC2O/Qf+x2joJ2qyaVr0Wp8R0DfUO5m
 3urMN4+s9l+HbTRjjLn1SUE0ubwYpOM3LFpnLrDJW66MV0nTTMQfbqkTZ
 817pyH3QoIYaf4mS1uAy/SeCS+pjBQdPR3fPjjfBz2A5nSGDjYcvx6t3T
 BtKDsqfbZwqjhglKKH3Dvo4Si7Ao2ok+uieWKlRrJaruLkN8TKmPSLOPp
 MNQ5P0UpnWhZ3zATkXEnMWUQAW0ZkZ2+cilpQiTnBpOJ5dpFE/Vt69v9r g==;
X-CSE-ConnectionGUID: MxC+mt9OQdS8KIv3BKhBQA==
X-CSE-MsgGUID: MWQ1alI9TqWrHzcYzESRSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655919"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:48 -0800
X-CSE-ConnectionGUID: aydHQ1oER3anktDHKXLVlw==
X-CSE-MsgGUID: w36EuwxdRVyW19qRHUOrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506882"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:47 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 05/12] drm/xe/vm: Prevent binding of purged buffer objects
Date: Tue,  3 Mar 2026 20:50:01 +0530
Message-ID: <20260303152015.3499248-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
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

v6:
  - Block VM_BIND to DONTNEED BOs with -EBUSY (Thomas, Matt)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 71 ++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c65d014c7491..4a8abdcfb912 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2917,8 +2917,20 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
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
@@ -2927,10 +2939,19 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 	if (bo) {
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
-		if (!err && validate)
+
+		/* Reject new mappings to DONTNEED/purged BOs; allow cleanup operations */
+		if (!err && flags->check_purged) {
+			if (xe_bo_madv_is_dontneed(bo))
+				err = -EBUSY;  /* BO marked purgeable */
+			else if (xe_bo_is_purged(bo))
+				err = -EINVAL; /* BO already purged */
+		}
+
+		if (!err && flags->validate)
 			err = xe_bo_validate(bo, vm,
 					     xe_vm_allow_vm_eviction(vm) &&
-					     res_evict, exec);
+					     flags->res_evict, exec);
 	}
 
 	return err;
@@ -3023,9 +3044,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -3034,13 +3058,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
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
@@ -3049,7 +3085,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
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
@@ -3062,9 +3102,18 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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

