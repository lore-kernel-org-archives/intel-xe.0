Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A708CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2338110E6F9;
	Wed, 13 Aug 2025 10:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoDSciiJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835D010E6F9
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082337; x=1786618337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ouZNXtOEsYnI7vTdSIQRNRRc5y9MoEgHxrsH3FHnNZs=;
 b=eoDSciiJ+3fTDZ0G2b2pToWUABkQ5dJo7yabmwuSE/gAObHj7puqAkDk
 8SDpahKy777w67exYIR2dLzq3cA7fcC9bB9cQ+ymujpxUeemWM5aJvK0c
 vzQiGyxsP2/vno4jMLA7QMxFdpiXccpmvA6FDBX6qm2UWlsmjU60a/VQ8
 whbsyDtc1fl2r/gK9Gf8zheLZ2/Ad1GCJx/bZnQRnWBi6eWB2rAxiwR9B
 lGU3pI2lDV8HbkiJ6Im/T2RdHIr3BBZc/xmXdcMYkSXjBrb3Rqyp/yBO9
 v8XRL4GA+f3SJM5Nc9U4LvRsNgvv4DqOIhVa4QCcsyd2T0Cy5x5oMIuDr A==;
X-CSE-ConnectionGUID: cdSWlksSR4++mMzgXcSr2g==
X-CSE-MsgGUID: f9s4x1tXRFmhy24FDZIyJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450061"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450061"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:17 -0700
X-CSE-ConnectionGUID: UnZ7ZZzyROqYkYq4nnAqHQ==
X-CSE-MsgGUID: GsEmdwpFRWiQBUHaZAdW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166069109"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 13/15] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
Date: Wed, 13 Aug 2025 12:51:19 +0200
Message-ID: <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Most users of xe_bo_create_pin_map_at() and
xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
and that simplifies conversion. Introduce an
xe_bo_create_pin_map_at_novm() function and make the _aligned()
version static. Use xe_validation_guard() for conversion.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../compat-i915-headers/gem/i915_gem_stolen.h | 24 ++----
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 45 +++++-----
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 83 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h                    | 13 +--
 drivers/gpu/drm/xe/xe_eu_stall.c              |  6 +-
 6 files changed, 101 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
index 1ce1e9da975b..ab48635ddffa 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
@@ -21,9 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 						       u32 size, u32 align,
 						       u32 start, u32 end)
 {
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_bo *bo;
-	int err;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
 
 	if (start < SZ_4K)
@@ -34,25 +32,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 		start = ALIGN(start, align);
 	}
 
-	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
-				       NULL, size, start, end,
-				       ttm_bo_type_kernel, flags, 0, exec);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		bo = NULL;
-		return err;
-	}
-	err = xe_bo_pin(bo, exec);
-	xe_bo_unlock_vm_held(bo);
-
-	if (err) {
-		xe_bo_put(fb->bo);
-		bo = NULL;
-	}
+	bo = xe_bo_create_pin_map_at_novm(xe, xe_device_get_root_tile(xe),
+					  size, start, ttm_bo_type_kernel, flags,
+					  false, 0, true);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	fb->bo = bo;
 
-	return err;
+	return 0;
 }
 
 static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 43c45344ea26..d46ff7ebb0a1 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -102,29 +102,32 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 				 XE_PAGE_SIZE);
 
 	if (IS_DGFX(xe))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size, ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_VRAM0 |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
+						   dpt_size, ~0ull,
+						   ttm_bo_type_kernel,
+						   true,
+						   XE_BO_FLAG_VRAM0 |
+						   XE_BO_FLAG_GGTT |
+						   XE_BO_FLAG_PAGETABLE,
+						   alignment, false);
 	else
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_STOLEN |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
+						   dpt_size,  ~0ull,
+						   ttm_bo_type_kernel,
+						   true,
+						   XE_BO_FLAG_STOLEN |
+						   XE_BO_FLAG_GGTT |
+						   XE_BO_FLAG_PAGETABLE,
+						   alignment, false);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_SYSTEM |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
+						   dpt_size,  ~0ull,
+						   ttm_bo_type_kernel,
+						   true,
+						   XE_BO_FLAG_SYSTEM |
+						   XE_BO_FLAG_GGTT |
+						   XE_BO_FLAG_PAGETABLE,
+						   alignment, false);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 826ac3d578b7..79d00127caf4 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
-				     ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
+					  ttm_bo_type_kernel, flags, true, 0, false);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
 			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 23b28eeef59f..c9928d4ee5a0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2253,29 +2253,20 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 	return bo;
 }
 
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
-				      struct xe_vm *vm,
-				      size_t size, u64 offset,
-				      enum ttm_bo_type type, u32 flags)
-{
-	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, offset,
-					       type, flags, 0);
-}
-
-struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
-					      struct xe_tile *tile,
-					      struct xe_vm *vm,
-					      size_t size, u64 offset,
-					      enum ttm_bo_type type, u32 flags,
-					      u64 alignment)
+static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
+						     struct xe_tile *tile,
+						     struct xe_vm *vm,
+						     size_t size, u64 offset,
+						     enum ttm_bo_type type, u32 flags,
+						     bool vmap, u64 alignment,
+						     struct drm_exec *exec)
 {
 	struct xe_bo *bo;
 	int err;
 	u64 start = offset == ~0ull ? 0 : offset;
 	u64 end = offset == ~0ull ? offset : start + size;
-	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
 
-	if (flags & XE_BO_FLAG_STOLEN &&
+	if (flags & XE_BO_FLAG_STOLEN && vmap &&
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_FLAG_GGTT;
 
@@ -2289,9 +2280,11 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 	if (err)
 		goto err_put;
 
-	err = xe_bo_vmap(bo);
-	if (err)
-		goto err_unpin;
+	if (vmap) {
+		err = xe_bo_vmap(bo);
+		if (err)
+			goto err_unpin;
+	}
 
 	xe_bo_unlock_vm_held(bo);
 
@@ -2305,11 +2298,59 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
+/**
+ * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
+ * @xe: The xe device.
+ * @tile: The tile to select for migration of this bo, and the tile used for
+ * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @size: The storage size to use for the bo.
+ * @offset: Optional VRAM offset or %0 for don't care.
+ * @type: The TTM buffer object type.
+ * @flags: XE_BO_FLAG_ flags.
+ * @vmap: Whether to create a buffer object map.
+ * @alignment: GGTT alignment.
+ * @intr: Whether to execut any waits for backing store interruptible.
+ *
+ * Create a pinned and optionally mapped bo with VRAM offset and GGTT alignment
+ * options. The bo will be external and not associated with a VM.
+ *
+ * Return: The buffer object on success. Negative error pointer on failure.
+ * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
+ * to true on entry.
+ */
+struct xe_bo *
+xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
+			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
+			     bool vmap, u64 alignment, bool intr)
+{
+	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
+		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
+						     type, flags, vmap,
+						     alignment, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+		}
+	}
+
+	return ret ? ERR_PTR(ret) : bo;
+}
+
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
 				   enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
+	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
+
+	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
+					       true, 0, exec);
 }
 
 static void __xe_bo_unpin_map_no_vm(void *arg)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a625806deeb6..d06266af9662 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -109,15 +109,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
 				   enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
-				      struct xe_vm *vm, size_t size, u64 offset,
-				      enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
-					      struct xe_tile *tile,
-					      struct xe_vm *vm,
-					      size_t size, u64 offset,
-					      enum ttm_bo_type type, u32 flags,
-					      u64 alignment);
+struct xe_bo *
+xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
+			     size_t size, u64 offset, enum ttm_bo_type type,
+			     u32 flags, bool vmap, u64 alignment, bool intr);
 struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index fdd514fec5ef..afabfc125488 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -617,9 +617,9 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
 
 	size = stream->per_xecore_buf_size * last_xecore;
 
-	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
-					     size, ~0ull, ttm_bo_type_kernel,
-					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
+	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
+					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, true,
+					  SZ_64, false);
 	if (IS_ERR(bo)) {
 		kfree(stream->xecore_buf);
 		return PTR_ERR(bo);
-- 
2.50.1

