Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21ADCA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAD410E6AF;
	Tue,  2 Sep 2025 12:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJU2OoBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1A910E6AF
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816876; x=1788352876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q4kf6U5C6mMMrdnPfS7BfuIaboYTs914fELstCBkYmw=;
 b=UJU2OoBHAetwslOWpATnjgHDve/xl5o3ZpLPn3wP5h8jod8/ADUMn7JT
 7KlFAg6whjLvecRP0s2cdNY8vZHC5H4DkZgtnQPzOdpsfC7FLYll+af5E
 YPX1WujQ5/EDbW1yqH7Hk7rIPORIgeNg5P4/bR3O5NHML06nUUW7vK0qI
 BdZvDeSxGEm+5oQwdUhy/URs65ArDKYlj4gc8KW7BKQlL4QRaMkfN6XCA
 yc9RU7Ccfm4eIkqDBo+ZpBoO32jiX+p4fc7gfinsme7qcrA/9pWwMxfNA
 AQXV3//o/hipeS6XVX5et4Qso5vpfzCYnUVC+w+IB94BrNhLkze00uZyd Q==;
X-CSE-ConnectionGUID: 8NqY8fOjR0CS6+EUako1Pg==
X-CSE-MsgGUID: Z95ZdrfJRFG1bROY8UAjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59157330"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59157330"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:16 -0700
X-CSE-ConnectionGUID: ZEt0Tvz6S5SS5tBuklkilg==
X-CSE-MsgGUID: i2Ppj5+EQ86i0oIXKBOO7A==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 10/13] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
Date: Tue,  2 Sep 2025 14:40:18 +0200
Message-ID: <20250902124021.70211-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Adapt to signature change of xe_validation_guard(). (Matt Brost)
- Fix up documentation.
v4:
- Postpone the change to i915_gem_stolen_insert_node_in_range() to
  a later patch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 42 +++++------
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 72 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h                    | 13 ++--
 drivers/gpu/drm/xe/xe_eu_stall.c              |  5 +-
 5 files changed, 83 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3d7045852154..287b0c4355ef 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -102,29 +102,29 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
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
+						   XE_BO_FLAG_SYSTEM |
+						   XE_BO_FLAG_GGTT |
+						   XE_BO_FLAG_PAGETABLE,
+						   alignment, false);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 826ac3d578b7..94f00def811b 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
-				     ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
+					  ttm_bo_type_kernel, flags, 0, false);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
 			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9f5f6b48ab0f..ce2869406a8b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2416,27 +2416,17 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
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
+						     u64 alignment, struct drm_exec *exec)
 {
 	struct xe_bo *bo;
 	int err;
 	u64 start = offset == ~0ull ? 0 : offset;
-	u64 end = offset == ~0ull ? offset : start + size;
-	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
+	u64 end = offset == ~0ull ? ~0ull : start + size;
 
 	if (flags & XE_BO_FLAG_STOLEN &&
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
@@ -2468,11 +2458,57 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
+/**
+ * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
+ * @xe: The xe device.
+ * @tile: The tile to select for migration of this bo, and the tile used for
+ * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @size: The storage size to use for the bo.
+ * @offset: Optional VRAM offset or %~0ull for don't care.
+ * @type: The TTM buffer object type.
+ * @flags: XE_BO_FLAG_ flags.
+ * @alignment: GGTT alignment.
+ * @intr: Whether to execute any waits for backing store interruptible.
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
+			     u64 alignment, bool intr)
+{
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = intr},
+			    ret) {
+		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
+						     type, flags, alignment, &exec);
+		if (IS_ERR(bo)) {
+			drm_exec_retry_on_contention(&exec);
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
+					       0, exec);
 }
 
 static void __xe_bo_unpin_map_no_vm(void *arg)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 13f3ef9fab6e..fd181d8f4361 100644
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
+			     u32 flags, u64 alignment, bool intr);
 struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index fdd514fec5ef..f5cfdf29fde3 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -617,9 +617,8 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
 
 	size = stream->per_xecore_buf_size * last_xecore;
 
-	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
-					     size, ~0ull, ttm_bo_type_kernel,
-					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
+	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
+					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64, false);
 	if (IS_ERR(bo)) {
 		kfree(stream->xecore_buf);
 		return PTR_ERR(bo);
-- 
2.50.1

