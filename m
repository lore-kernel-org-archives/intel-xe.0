Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8995CCF9F0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E56310E5CF;
	Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mijhY18Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E490810E3E8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654311; x=1793190311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YtyhYsAL4Rvw9hleiPEo3JGTj8il1MIcLj6qYOwaKYc=;
 b=mijhY18YB7LRfMleHOqJco/k0DueEkQ5CnvyHhwLHythLbOsWW4XXAJB
 OKML4PGqXAlvTPDsCCP512B/lHoah5okBBcq3bbCrWZd4R8eDPo0W1F09
 oDKN+2Y7hbxsnEbNDtEW6B+XCMoKppdXBu/hktGvlCqMZmYCmchrdMaYj
 NaUlitmTgbqSkssJ7S3ZlV9oPYr1yRHk8RWOcjEenPCMBIUjuuFs6Leq+
 vVOF52QzZF5OWJbur/3zzj+pIzJ2iilroNMWaz1TIyc/+rrbM3qUVgqKu
 FvXgB+11vHfy4rT1DhqouDbnYE3q7YNSf5+KwWpJwE/wFbHcYY7oNxCiy A==;
X-CSE-ConnectionGUID: Onk8QtMTSZ6jrRkV6sbqPw==
X-CSE-MsgGUID: DbFYUO6vSRWCB29xY2oMSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956627"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:08 -0700
X-CSE-ConnectionGUID: 5Wkz9HaVTW6YE54wTP51Fg==
X-CSE-MsgGUID: r1nAc0jjRMiPmF3AvWh9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524432"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:06 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 3/9] drm/xe/madvise: Implement purgeable buffer object
 support
Date: Tue, 28 Oct 2025 17:54:09 +0530
Message-ID: <20251028122415.1136721-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

This allows userspace applications to provide memory usage hints to
the kernel for better memory management under pressure:

- WILLNEED: BO will be needed again, re-validate if purged
- DONTNEED: BO not currently needed, may be purged if needed

When userspace marks BO as DONTNEED, the kernel can reclaim
their memory during memory pressure. BO transition to PURGED
state when reclaimed, and attempting to access purged buffers
triggers appropriate fault handling.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 75 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++++++
 2 files changed, 130 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbc3ee157218..3b3eb83658cc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -836,6 +836,60 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+static int xe_bo_invalidate_tlb_before_purge(struct xe_bo *bo)
+{
+	struct drm_gpuvm_bo *vm_bo;
+	struct drm_gpuva *gpuva;
+	struct drm_gem_object *obj = &bo->ttm.base;
+	int ret;
+
+	/* BO must be locked before invalidating */
+	dma_resv_assert_held(bo->ttm.base.resv);
+
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+			ret = xe_vm_invalidate_vma(vma);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void xe_bo_set_purged(struct xe_bo *bo)
+{
+	/* BO must be locked before modifying madv state */
+	dma_resv_assert_held(bo->ttm.base.resv);
+
+	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
+}
+
+static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
+	if (ttm_bo->ttm) {
+		struct ttm_placement place = {};
+		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
+		int ret_inval;
+
+		drm_WARN_ON(&xe->drm, ret);
+		if (!ret && bo) {
+			if (atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED) {
+				/* Invalidate TLB before marking BO as purged */
+				ret_inval = xe_bo_invalidate_tlb_before_purge(bo);
+				if (!ret_inval)
+					xe_bo_set_purged(bo);
+
+			}
+		}
+	}
+}
+
 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_mem,
@@ -853,8 +907,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
+	int state = atomic_read(&bo->madv_purgeable);
 	int ret = 0;
 
+	if (evict && state == XE_MADV_PURGEABLE_DONTNEED) {
+		xe_ttm_bo_purge(ttm_bo, ctx);
+			return 0;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -1606,18 +1666,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
-static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
-{
-	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
-
-	if (ttm_bo->ttm) {
-		struct ttm_placement place = {};
-		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
-
-		drm_WARN_ON(&xe->drm, ret);
-	}
-}
-
 static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct ttm_operation_ctx ctx = {
@@ -2472,6 +2520,9 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 				       ttm_bo_type_device, flags, 0, true);
 	}
 
+	/* Initialize purge advisory state */
+	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+
 	return bo;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index cad3cf627c3f..1f0356ea4403 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -158,6 +158,54 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/*
+ * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
+ * Returns 0 on success, negative errno on error.
+ */
+static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
+				       struct xe_vma **vmas, int num_vmas,
+				       struct drm_xe_madvise *op, struct drm_exec *exec)
+{
+
+	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
+
+	for (int i = 0; i < num_vmas; i++) {
+		struct xe_bo *bo = xe_vma_bo(vmas[i]);
+		int state;
+		int ret;
+
+		if (!bo)
+			continue;
+
+		/* BO must be locked before modifying madv state */
+		dma_resv_assert_held(bo->ttm.base.resv);
+
+		switch (op->purge_state_val.val) {
+		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
+			state = atomic_read(&bo->madv_purgeable);
+			if (state == XE_MADV_PURGEABLE_PURGED) {
+				ret = xe_bo_validate(bo, NULL, true, exec);
+				if (ret) {
+					drm_err(&vm->xe->drm,
+						"Failed to validate purged BO: %d\n", ret);
+					return;
+				}
+			}
+			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+			break;
+		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
+			state = atomic_read(&bo->madv_purgeable);
+			if (state != XE_MADV_PURGEABLE_PURGED)
+				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
+			break;
+		default:
+			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
+				 op->purge_state_val.val);
+			return;
+		}
+	}
+}
+
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
 			     struct drm_xe_madvise *op);
@@ -283,6 +331,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 			return false;
 		break;
 	}
+	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
+	{
+		u32 val = args->purge_state_val.val;
+
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->purge_state_val.reserved))
+			return false;
+
+		break;
+	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
@@ -402,6 +463,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 					goto err_fini;
 			}
 		}
+		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
+			xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
+						   madvise_range.num_vmas, args, &exec);
+			goto err_fini;
+
+		}
 	}
 
 	if (madvise_range.has_svm_userptr_vmas) {
-- 
2.43.0

