Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02639CA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 16:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2F410E4EF;
	Mon,  1 Sep 2025 16:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XP2TLlVR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32210E4EF
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756743222; x=1788279222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZK7jMbKMb9FpyqiNxNJdMD6Ua5Y/hAJMzeNA1yoX27o=;
 b=XP2TLlVRr6IwGo+FaxBRxQYNVqCnYXeO4GT828mL0mGkYRcaNth1gk8q
 A8Wl70LMeuGDtobuB9GgD2A81WC1J2opOQQYHkplSXF+jrNNymSFRouzs
 09rWpTLYeFBPEPvKg+mSZYFIWmJjeA+Y4IxDCTKNEVHpqhf28JYYyWdIr
 hUO2XlkZb3RYOdiAE4DkR5igaqAi4Z9MhNQ3WjEXb7yP6vK30R1wfOMvZ
 sQ6nF67NRj9ls3nYU17tRNkP7d/i+DDlWmnCYTOc8pr4ARbWkgGSLd2+i
 RPkHhAreURiLXvNsaBLXC+AyMv0MiUthnmwRjLrINJaXeK2CzEXQn8D1z w==;
X-CSE-ConnectionGUID: 2GGe+JVrQBqHj7i/SpvaQQ==
X-CSE-MsgGUID: goUWKHALQIK+GhNlZS3f3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58204375"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58204375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:42 -0700
X-CSE-ConnectionGUID: 1mCOBp6ZSUmvVSXwmkjcBA==
X-CSE-MsgGUID: bGz4rAiIRB2kKtJcn0pvCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171215210"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 11/14] drm/xe: Convert xe_bo_create_pin_map() for
 exhaustive eviction
Date: Mon,  1 Sep 2025 18:12:46 +0200
Message-ID: <20250901161250.5279-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
References: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
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

Introduce an xe_bo_create_pin_map_novm() function that does not
take the drm_exec paramenter to simplify the conversion of many
callsites.
For the rest, ensure that the same drm_exec context that was used
for locking the vm is passed down to validation.

Use xe_validation_guard() where appropriate.

v2:
- Avoid gotos from within xe_validation_guard(). (Matt Brost)
- Break out the change to pf_provision_vf_lmem8 to a separate
  patch.
- Adapt to signature change of xe_validation_guard().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  18 +--
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   9 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  52 +++++++-
 drivers/gpu/drm/xe/xe_bo.h                    |   6 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  24 ++--
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  13 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  20 ++-
 drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c            |  34 +++--
 drivers/gpu/drm/xe/xe_vm.c                    | 121 +++++++++++-------
 17 files changed, 231 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index d96ba2b51065..8ea9a472113c 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -42,11 +42,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	obj = ERR_PTR(-ENODEV);
 
 	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_GGTT);
+		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
+						size,
+						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						XE_BO_FLAG_STOLEN |
+						XE_BO_FLAG_GGTT, false);
 		if (!IS_ERR(obj))
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
@@ -54,10 +54,10 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	}
 
 	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					   XE_BO_FLAG_GGTT);
+		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
+						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+						XE_BO_FLAG_GGTT, false);
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 9f941fc2e36b..58581d7aaae6 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -43,11 +43,11 @@ bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *d
 		return false;
 
 	/* Set scanout flag for WC mapping */
-	obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-				   NULL, PAGE_ALIGN(size),
-				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-				   XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT);
+	obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
+					PAGE_ALIGN(size),
+					ttm_bo_type_kernel,
+					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+					XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(obj)) {
 		kfree(vma);
 		return false;
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 30f1073141fc..4ae847b628e2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -72,10 +72,10 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	int ret = 0;
 
 	/* allocate object of two page for HDCP command memory and store it */
-	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), PAGE_SIZE * 2,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT, false);
 
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "Failed to allocate bo for HDCP streaming command!\n");
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index afa794e56065..5904d658d1f2 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -204,7 +204,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 
 	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
 				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				   XE_BO_FLAG_VRAM_IF_DGFX(tile),
+				   exec);
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
 		goto vunmap;
@@ -212,7 +213,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 
 	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile),
+				  exec);
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
@@ -222,7 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
-				    XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				    XE_BO_FLAG_VRAM_IF_DGFX(tile),
+				    exec);
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
 			   PTR_ERR(tiny));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ce2869406a8b..583d48d5d240 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2501,16 +2501,59 @@ xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+/**
+ * xe_bo_create_pin_map() - Create pinned and mapped bo
+ * @xe: The xe device.
+ * @tile: The tile to select for migration of this bo, and the tile used for
+ * @vm: The vm to associate the buffer object with. The vm's resv must be locked
+ * with the transaction represented by @exec.
+ * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @size: The storage size to use for the bo.
+ * @type: The TTM buffer object type.
+ * @flags: XE_BO_FLAG_ flags.
+ * @exec: The drm_exec transaction to use for exhaustive eviction, and
+ * previously used for locking @vm's resv.
+ *
+ * Create a pinned and mapped bo. The bo will be external and not associated
+ * with a VM.
+ *
+ * Return: The buffer object on success. Negative error pointer on failure.
+ * In particular, the function may return ERR_PTR(%-EINTR) if @exec was
+ * configured for interruptible locking.
+ */
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
-				   enum ttm_bo_type type, u32 flags)
+				   enum ttm_bo_type type, u32 flags,
+				   struct drm_exec *exec)
 {
-	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
-
 	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
 					       0, exec);
 }
 
+/**
+ * xe_bo_create_pin_map_novm() - Create pinned and mapped bo
+ * @xe: The xe device.
+ * @tile: The tile to select for migration of this bo, and the tile used for
+ * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @size: The storage size to use for the bo.
+ * @type: The TTM buffer object type.
+ * @flags: XE_BO_FLAG_ flags.
+ * @intr: Whether to execut any waits for backing store interruptible.
+ *
+ * Create a pinned and mapped bo. The bo will be external and not associated
+ * with a VM.
+ *
+ * Return: The buffer object on success. Negative error pointer on failure.
+ * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
+ * to true on entry.
+ */
+struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
+					size_t size, enum ttm_bo_type type, u32 flags,
+					bool intr)
+{
+	return xe_bo_create_pin_map_at_novm(xe, tile, size, ~0ull, type, flags, 0, intr);
+}
+
 static void __xe_bo_unpin_map_no_vm(void *arg)
 {
 	xe_bo_unpin_map_no_vm(arg);
@@ -2523,8 +2566,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	int ret;
 
 	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
-
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_novm(xe, tile, size, ttm_bo_type_kernel, flags, true);
 	if (IS_ERR(bo))
 		return bo;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index fd181d8f4361..7de0f5a166d5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -108,7 +108,11 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
 				u16 cpu_caching, u32 flags, struct drm_exec *exec);
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
-				   enum ttm_bo_type type, u32 flags);
+				   enum ttm_bo_type type, u32 flags,
+				   struct drm_exec *exec);
+struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
+					size_t size, enum ttm_bo_type type, u32 flags,
+					bool intr);
 struct xe_bo *
 xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
 			     size_t size, u64 offset, enum ttm_bo_type type,
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index f5ae28af60d4..83d61bf8ec62 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -136,10 +136,10 @@ static int query_compatibility_version(struct xe_gsc *gsc)
 	u64 ggtt_offset;
 	int err;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile, GSC_VER_PKT_SZ * 2,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(bo)) {
 		xe_gt_err(gt, "failed to allocate bo for GSC version query\n");
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index c712111aa30d..44cc612b0a75 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -55,12 +55,12 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(size, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -91,12 +91,12 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(size, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 92e1f9f41b8c..2b99c1ebdd58 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -94,16 +94,17 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo, *metadata_bo;
 
-	metadata_bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL, PAGE_ALIGN(metadata_size),
-					   ttm_bo_type_kernel, XE_BO_FLAG_SYSTEM |
-					   XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE);
+	metadata_bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
+						ttm_bo_type_kernel, XE_BO_FLAG_SYSTEM |
+						XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE,
+						false);
 
 	if (IS_ERR(metadata_bo))
 		return PTR_ERR(metadata_bo);
 
-	bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL, PAGE_ALIGN(size),
-				  ttm_bo_type_kernel, XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile, PAGE_ALIGN(size),
+				       ttm_bo_type_kernel, XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE, false);
 
 	if (IS_ERR(bo)) {
 		xe_bo_unpin_map_no_vm(metadata_bo);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index f2bfbfa3efa1..62fc5a1a332d 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -67,12 +67,12 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 		goto out;
 	}
 
-	bo = xe_bo_create_pin_map(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt), NULL,
-				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
-					     lmtt->ops->lmtt_pte_num(level)),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_FLAG_NEEDS_64K);
+	bo = xe_bo_create_pin_map_novm(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt),
+				       PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
+						  lmtt->ops->lmtt_pte_num(level)),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
+				       XE_BO_FLAG_NEEDS_64K, false);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8f6c3ba47882..6d52e0eb97f5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1340,9 +1340,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
-				       ttm_bo_type_kernel,
-				       bo_flags);
+	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
+					    bo_size,
+					    ttm_bo_type_kernel,
+					    bo_flags, false);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9643442ef101..27813308f411 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -35,6 +35,7 @@
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
+#include "xe_validation.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
 
@@ -173,7 +174,7 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 }
 
 static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
-				 struct xe_vm *vm)
+				 struct xe_vm *vm, struct drm_exec *exec)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
@@ -200,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PAGETABLE);
+				  XE_BO_FLAG_PAGETABLE, exec);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -404,6 +405,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	struct xe_tile *tile = m->tile;
 	struct xe_gt *primary_gt = tile->primary_gt;
 	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_vm *vm;
 	int err;
 
@@ -413,11 +416,16 @@ int xe_migrate_init(struct xe_migrate *m)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	xe_vm_lock(vm, false);
-	err = xe_migrate_prepare_vm(tile, m, vm);
-	xe_vm_unlock(vm);
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
+	}
 	if (err)
-		goto err_out;
+		return err;
 
 	if (xe->info.has_usm) {
 		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a188bad172ad..a4894eb0d7f3 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -883,9 +883,9 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	struct xe_bo *bo;
 
-	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
-				  size, ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
+				       size, ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c129048a9a09..1f861725087a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -89,6 +89,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * @vm: The vm to create for.
  * @tile: The tile to create for.
  * @level: The page-table level.
+ * @exec: The drm_exec object used to lock the vm.
  *
  * Allocate and initialize a single struct xe_pt metadata structure. Also
  * create the corresponding page-table bo, but don't initialize it. If the
@@ -100,7 +101,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * error.
  */
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
-			   unsigned int level)
+			   unsigned int level, struct drm_exec *exec)
 {
 	struct xe_pt *pt;
 	struct xe_bo *bo;
@@ -124,9 +125,11 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
 	pt->level = level;
+
+	drm_WARN_ON(&vm->xe->drm, IS_ERR_OR_NULL(exec));
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  bo_flags);
+				  bo_flags, exec);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
@@ -590,7 +593,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	if (covers || !*child) {
 		u64 flags = 0;
 
-		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1);
+		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1,
+					xe_vm_validation_exec(vm));
 		if (IS_ERR(xe_child))
 			return PTR_ERR(xe_child);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 5ecf003d513c..4daeebaab5a1 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -10,6 +10,7 @@
 #include "xe_pt_types.h"
 
 struct dma_fence;
+struct drm_exec;
 struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
@@ -29,7 +30,7 @@ struct xe_vma_ops;
 unsigned int xe_pt_shift(unsigned int level);
 
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
-			   unsigned int level);
+			   unsigned int level, struct drm_exec *exec);
 
 void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_pt *pt);
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index ca95f2a4d4ef..e60526e30030 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -54,8 +54,9 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
 	 * Each termination is 16 DWORDS, so 4K is enough to contain a
 	 * termination for each sessions.
 	 */
-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT,
+				       false);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_queue;
@@ -87,7 +88,9 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_validation_ctx ctx;
 	struct xe_hw_engine *hwe;
+	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_bo *bo;
 	struct xe_exec_queue *q;
@@ -106,15 +109,26 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 		return PTR_ERR(vm);
 
 	/* We allocate a single object for the batch and the in/out memory */
-	xe_vm_lock(vm, false);
-	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
-	xe_vm_unlock(vm);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		goto vm_out;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags){}, err) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			break;
+
+		bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
+					  ttm_bo_type_kernel,
+					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED |
+					  XE_BO_FLAG_NEEDS_UC, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
 	}
+	if (err)
+		goto vm_out;
 
 	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
 	if (IS_ERR(fence)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d3060c5b2e8f..f9f6ae08e8a2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1605,6 +1605,7 @@ static void vm_destroy_work_func(struct work_struct *w);
  * @xe: xe device.
  * @tile: tile to set up for.
  * @vm: vm to set up for.
+ * @exec: The struct drm_exec object used to lock the vm resv.
  *
  * Sets up a pagetable tree with one page-table per level and a single
  * leaf PTE. All pagetable entries point to the single page-table or,
@@ -1614,20 +1615,19 @@ static void vm_destroy_work_func(struct work_struct *w);
  * Return: 0 on success, negative error code on error.
  */
 static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
-				struct xe_vm *vm)
+				struct xe_vm *vm, struct drm_exec *exec)
 {
 	u8 id = tile->id;
 	int i;
 
 	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
-		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
+		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i, exec);
 		if (IS_ERR(vm->scratch_pt[id][i])) {
 			int err = PTR_ERR(vm->scratch_pt[id][i]);
 
 			vm->scratch_pt[id][i] = NULL;
 			return err;
 		}
-
 		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
 	}
 
@@ -1655,9 +1655,26 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void xe_vm_pt_destroy(struct xe_vm *vm)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	xe_vm_assert_held(vm);
+
+	for_each_tile(tile, vm->xe, id) {
+		if (vm->pt_root[id]) {
+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
+			vm->pt_root[id] = NULL;
+		}
+	}
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 {
 	struct drm_gem_object *vm_resv_obj;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_vm *vm;
 	int err, number_tiles = 0;
 	struct xe_tile *tile;
@@ -1744,49 +1761,68 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	drm_gem_object_put(vm_resv_obj);
 
-	err = xe_vm_lock(vm, true);
-	if (err)
-		goto err_close;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
+			    err) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
 
-	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
-		vm->flags |= XE_VM_FLAG_64K;
+		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+			vm->flags |= XE_VM_FLAG_64K;
 
-	for_each_tile(tile, xe, id) {
-		if (flags & XE_VM_FLAG_MIGRATION &&
-		    tile->id != XE_VM_FLAG_TILE_ID(flags))
-			continue;
+		for_each_tile(tile, xe, id) {
+			if (flags & XE_VM_FLAG_MIGRATION &&
+			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+				continue;
 
-		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
-		if (IS_ERR(vm->pt_root[id])) {
-			err = PTR_ERR(vm->pt_root[id]);
-			vm->pt_root[id] = NULL;
-			goto err_unlock_close;
+			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
+						       &exec);
+			if (IS_ERR(vm->pt_root[id])) {
+				err = PTR_ERR(vm->pt_root[id]);
+				vm->pt_root[id] = NULL;
+				xe_vm_pt_destroy(vm);
+				drm_exec_retry_on_contention(&exec);
+				xe_validation_retry_on_oom(&ctx, &err);
+				break;
+			}
 		}
-	}
+		if (err)
+			break;
 
-	if (xe_vm_has_scratch(vm)) {
-		for_each_tile(tile, xe, id) {
-			if (!vm->pt_root[id])
-				continue;
+		if (xe_vm_has_scratch(vm)) {
+			for_each_tile(tile, xe, id) {
+				if (!vm->pt_root[id])
+					continue;
 
-			err = xe_vm_create_scratch(xe, tile, vm);
+				err = xe_vm_create_scratch(xe, tile, vm, &exec);
+				if (err) {
+					xe_vm_free_scratch(vm);
+					xe_vm_pt_destroy(vm);
+					drm_exec_retry_on_contention(&exec);
+					xe_validation_retry_on_oom(&ctx, &err);
+					break;
+				}
+			}
 			if (err)
-				goto err_unlock_close;
+				break;
+			vm->batch_invalidate_tlb = true;
 		}
-		vm->batch_invalidate_tlb = true;
-	}
 
-	if (vm->flags & XE_VM_FLAG_LR_MODE)
-		vm->batch_invalidate_tlb = false;
+		if (vm->flags & XE_VM_FLAG_LR_MODE) {
+			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+			vm->batch_invalidate_tlb = false;
+		}
 
-	/* Fill pt_root after allocating scratch tables */
-	for_each_tile(tile, xe, id) {
-		if (!vm->pt_root[id])
-			continue;
+		/* Fill pt_root after allocating scratch tables */
+		for_each_tile(tile, xe, id) {
+			if (!vm->pt_root[id])
+				continue;
 
-		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
+			xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
+		}
 	}
-	xe_vm_unlock(vm);
+	if (err)
+		goto err_close;
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1819,7 +1855,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 				      &xe->usm.next_asid, GFP_KERNEL);
 		up_write(&xe->usm.lock);
 		if (err < 0)
-			goto err_unlock_close;
+			goto err_close;
 
 		vm->usm.asid = asid;
 	}
@@ -1828,8 +1864,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	return vm;
 
-err_unlock_close:
-	xe_vm_unlock(vm);
 err_close:
 	xe_vm_close_and_put(vm);
 	return ERR_PTR(err);
@@ -1958,13 +1992,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	 * destroy the pagetables immediately.
 	 */
 	xe_vm_free_scratch(vm);
-
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id]) {
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-			vm->pt_root[id] = NULL;
-		}
-	}
+	xe_vm_pt_destroy(vm);
 	xe_vm_unlock(vm);
 
 	/*
@@ -4011,7 +4039,6 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
  */
 int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	int ret;
 
 	if (intr)
@@ -4019,9 +4046,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
 	else
 		ret = dma_resv_lock(xe_vm_resv(vm), NULL);
 
-	if (!ret)
-		xe_vm_set_validation_exec(vm, exec);
-
 	return ret;
 }
 
@@ -4033,7 +4057,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	xe_vm_set_validation_exec(vm, NULL);
 	dma_resv_unlock(xe_vm_resv(vm));
 }
 
-- 
2.50.1

