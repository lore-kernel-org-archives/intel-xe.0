Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ED2CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527CB10E4C3;
	Mon,  8 Sep 2025 10:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRG7QnxO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9410E4C6
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326403; x=1788862403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4EF3z2qUxIKMpTjAazXmaEow+O0C15aKg+uR4+CWhHY=;
 b=XRG7QnxO7/Dryh/F66LU95gBZZZtLRVjGIpF0ZJNb5T+X2itZwCFax56
 Y5J0WA7HGLmhVvZmi2rxwz8da4Xfov400wUNx0LvABQL7RayUJ1kHabBY
 HVgVaj0kN9pJ6mf+dOVqoHqRf4qa6MSRMLVC2B86I1YQ1+Pd5odOtZxmp
 v/++V/4MStIP00oKWwlzkR1pyzlTvd2meBLz7f77SF7nEknNAFTAdv//l
 XYIIbFJcxMEDIRMmCycib9FFjdBsrOMIqScqm+N9b79hudYV9Gt9kCwdg
 VhVtE/nis6LY5QFx4bGpLuQQqwxIooN7krgw7OJnvSzHpvI6E9RwfEc2W g==;
X-CSE-ConnectionGUID: IhWmgnpMQqiZ8EzCuDRcvQ==
X-CSE-MsgGUID: ae+Mc959SmOSnSyUMI2zDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022831"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85022831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:23 -0700
X-CSE-ConnectionGUID: 9HJX7L3jQT6EqWcZTDuG2Q==
X-CSE-MsgGUID: YCmaAUdURciMfiLZ9f0EDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172673768"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.9])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 12/13] drm/xe: Rework instances of variants of
 xe_bo_create_locked()
Date: Mon,  8 Sep 2025 12:12:45 +0200
Message-ID: <20250908101246.65025-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
References: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
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

A common pattern is to create a locked bo, pin it without mapping
and then unlock it. Add a function to do that, which internally
uses xe_validation_guard().
With that we can remove xe_bo_create_locked_range() and add
exhaustive eviction to stolen, pf_provision_vf_lmem and
psmi_alloc_object.

v4:
- New patch after reorganization.
v5:
- Replace DRM_XE_GEM_CPU_CACHING_WB with 0. (CI)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 .../compat-i915-headers/gem/i915_gem_stolen.h | 13 +--
 drivers/gpu/drm/xe/xe_bo.c                    | 86 +++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h                    |  9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 23 ++---
 drivers/gpu/drm/xe/xe_psmi.c                  | 26 ++----
 5 files changed, 70 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
index 1ce1e9da975b..a2d1f684a3a8 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
@@ -21,7 +21,6 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 						       u32 size, u32 align,
 						       u32 start, u32 end)
 {
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_bo *bo;
 	int err;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
@@ -34,21 +33,13 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 		start = ALIGN(start, align);
 	}
 
-	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
-				       NULL, size, start, end,
-				       ttm_bo_type_kernel, flags, 0, exec);
+	bo = xe_bo_create_pin_range_novm(xe, xe_device_get_root_tile(xe),
+					 size, start, end, ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		bo = NULL;
 		return err;
 	}
-	err = xe_bo_pin(bo, exec);
-	xe_bo_unlock_vm_held(bo);
-
-	if (err) {
-		xe_bo_put(fb->bo);
-		bo = NULL;
-	}
 
 	fb->bo = bo;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 79dc3d0daafb..c8f97ba98744 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2309,37 +2309,6 @@ __xe_bo_create_locked(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
-/**
- * xe_bo_create_locked_range() - Create a BO with range- and alignment options
- * @xe: The xe device.
- * @tile: The tile to select for migration of this bo, and the tile used for
- * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
- * @vm: The local vm or NULL for external objects.
- * @size: The storage size to use for the bo.
- * @start: Start of fixed VRAM range or 0.
- * @end: End of fixed VRAM range or ~0ULL.
- * @type: The TTM buffer object type.
- * @flags: XE_BO_FLAG_ flags.
- * @alignment: For GGTT buffer objects, the minimum GGTT alignment.
- * @exec: The drm_exec transaction to use for exhaustive eviction.
- *
- * Create an Xe BO with range- and alignment options. If @start and @end indicate
- * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM placement
- * only. The @alignment parameter can be used for GGTT alignment.
- *
- * Return: The buffer object on success. Negative error pointer on failure.
- */
-struct xe_bo *
-xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_tile *tile, struct xe_vm *vm,
-			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags, u64 alignment,
-			  struct drm_exec *exec)
-{
-	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type,
-				     flags, alignment, exec);
-}
-
 /**
  * xe_bo_create_locked() - Create a BO
  * @xe: The xe device.
@@ -2428,6 +2397,55 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 	return bo;
 }
 
+/**
+ * xe_bo_create_pin_range_novm() - Create and pin a BO with range options.
+ * @xe: The xe device.
+ * @tile: The tile to select for migration of this bo, and the tile used for
+ * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @size: The storage size to use for the bo.
+ * @start: Start of fixed VRAM range or 0.
+ * @end: End of fixed VRAM range or ~0ULL.
+ * @type: The TTM buffer object type.
+ * @flags: XE_BO_FLAG_ flags.
+ *
+ * Create an Xe BO with range- and options. If @start and @end indicate
+ * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM placement
+ * only.
+ *
+ * Return: The buffer object on success. Negative error pointer on failure.
+ */
+struct xe_bo *xe_bo_create_pin_range_novm(struct xe_device *xe, struct xe_tile *tile,
+					  size_t size, u64 start, u64 end,
+					  enum ttm_bo_type type, u32 flags)
+{
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int err = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
+		bo = __xe_bo_create_locked(xe, tile, NULL, size, start, end,
+					   0, type, flags, 0, &exec);
+		if (IS_ERR(bo)) {
+			drm_exec_retry_on_contention(&exec);
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
+
+		err = xe_bo_pin(bo, &exec);
+		xe_bo_unlock(bo);
+		if (err) {
+			xe_bo_put(bo);
+			drm_exec_retry_on_contention(&exec);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
+	}
+
+	return err ? ERR_PTR(err) : bo;
+}
+
 static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 						     struct xe_tile *tile,
 						     struct xe_vm *vm,
@@ -2444,9 +2462,9 @@ static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_FLAG_GGTT;
 
-	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
-				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
-				       alignment, exec);
+	bo = __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type,
+				   flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
+				   alignment, exec);
 	if (IS_ERR(bo))
 		return bo;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dcb7663e0cc0..827cb80e5e75 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -94,12 +94,6 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 				struct ttm_lru_bulk_move *bulk, size_t size,
 				u16 cpu_caching, enum ttm_bo_type type,
 				u32 flags, struct drm_exec *exec);
-struct xe_bo *
-xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_tile *tile, struct xe_vm *vm,
-			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags, u64 alignment,
-			  struct drm_exec *exec);
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags,
@@ -113,6 +107,9 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
 					size_t size, enum ttm_bo_type type, u32 flags,
 					bool intr);
+struct xe_bo *xe_bo_create_pin_range_novm(struct xe_device *xe, struct xe_tile *tile,
+					  size_t size, u64 start, u64 end,
+					  enum ttm_bo_type type, u32 flags);
 struct xe_bo *
 xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
 			     size_t size, u64 offset, enum ttm_bo_type type,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 906011671b60..6a9a752fe24a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1452,7 +1452,6 @@ static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
 static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
@@ -1479,24 +1478,16 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		return 0;
 
 	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
-	bo = xe_bo_create_locked(xe, tile, NULL,
-				 ALIGN(size, PAGE_SIZE),
-				 ttm_bo_type_kernel,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				 XE_BO_FLAG_NEEDS_2M |
-				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE,
-				 exec);
+	bo = xe_bo_create_pin_range_novm(xe, tile,
+					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
+					 ttm_bo_type_kernel,
+					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					 XE_BO_FLAG_NEEDS_2M |
+					 XE_BO_FLAG_PINNED |
+					 XE_BO_FLAG_PINNED_LATE_RESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	err = xe_bo_pin(bo, exec);
-	xe_bo_unlock(bo);
-	if (unlikely(err)) {
-		xe_bo_put(bo);
-		return err;
-	}
-
 	config->lmem_obj = bo;
 
 	if (xe_device_has_lmtt(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 2815987c190d..45d142191d60 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -68,10 +68,7 @@ static void psmi_cleanup(struct xe_device *xe)
 static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
 				       unsigned int id, size_t bo_size)
 {
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
-	struct xe_bo *bo = NULL;
 	struct xe_tile *tile;
-	int err;
 
 	if (!id || !bo_size)
 		return NULL;
@@ -79,23 +76,12 @@ static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
 	tile = &xe->tiles[id - 1];
 
 	/* VRAM: Allocate GEM object for the capture buffer */
-	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
-				 ttm_bo_type_kernel,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE |
-				 XE_BO_FLAG_NEEDS_CPU_ACCESS,
-				 exec);
-
-	if (!IS_ERR(bo)) {
-		/* Buffer written by HW, ensure stays resident */
-		err = xe_bo_pin(bo, exec);
-		if (err)
-			bo = ERR_PTR(err);
-		xe_bo_unlock(bo);
-	}
-
-	return bo;
+	return xe_bo_create_pin_range_novm(xe, tile, bo_size, 0, ~0ull,
+					   ttm_bo_type_kernel,
+					   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					   XE_BO_FLAG_PINNED |
+					   XE_BO_FLAG_PINNED_LATE_RESTORE |
+					   XE_BO_FLAG_NEEDS_CPU_ACCESS);
 }
 
 /*
-- 
2.51.0

