Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC76CD128D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 21:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3879F112098;
	Tue,  2 Apr 2024 21:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZH5zyLz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855A61120AC
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 21:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712094861; x=1743630861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCoZLU/nCq7iE4eUM44cWAtWXmzYZTKFev4KuipyawU=;
 b=fZH5zyLzvZBpPlD8KSxWsRxe4WgZSKOZi8rfGrnu4pfndzIwoufA10YN
 7EgX2bS1sqfZjEgiLWx+ZRBBGgklwFtzRupnyxsAJmq4OjQtJEaXbtg9i
 Tc8YMMpbsAjySQjJdriV6rHAQWVT0vZC+Tvejf2VGUwEsI/F/rRnZdAtU
 6BtuH4Mb9c0CLEYpVvhVuGJA21tOHqzMy4IkKWdGiN+9y+m1W9RMbHrAy
 nB0CCpFmHGI0j+MxV6Gea6rWPwT5WRVfqc0fES6aOsbNvfy+ETC2vC39g
 wblyUssjT4d/Wf06grgVyD7v4WC/gmVPHpo1eUAoYn3AEcIvvQ/MRusyO g==;
X-CSE-ConnectionGUID: uMQ4WM8ZTMaTXp3b07lX3A==
X-CSE-MsgGUID: smxuhDOmQK6FN1RZjWI3gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24754034"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="24754034"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 14:54:14 -0700
X-CSE-ConnectionGUID: VVSthshCQV6x1VedGZFadg==
X-CSE-MsgGUID: W/MujFdxSE+DJ7du2MgoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="49206658"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 14:54:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Drop XE_BO_FLAG_VRAM_IF_DGFX()
Date: Tue,  2 Apr 2024 14:54:55 -0700
Message-ID: <20240402215455.1839828-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402215455.1839828-1-lucas.demarchi@intel.com>
References: <20240402215455.1839828-1-lucas.demarchi@intel.com>
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

Now that each tile has a default placement for BOs, it's not needed
anymore to pass it to the various bo_create functions. There are a few
cases in which it's needed to override the default, coming from tests:
when xe_bo_create_user() is used with tile set to NULL, but the test
is specific to VRAM[0|1] rather than going to the root tile.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c |  1 -
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c  |  1 -
 drivers/gpu/drm/xe/tests/xe_bo.c            | 12 ++++--------
 drivers/gpu/drm/xe/tests/xe_migrate.c       |  3 ---
 drivers/gpu/drm/xe/xe_bo.c                  |  3 +--
 drivers/gpu/drm/xe/xe_ggtt.c                |  2 --
 drivers/gpu/drm/xe/xe_guc_pc.c              |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c           |  1 -
 drivers/gpu/drm/xe/xe_lmtt.c                |  1 -
 drivers/gpu/drm/xe/xe_lrc.c                 |  1 -
 drivers/gpu/drm/xe/xe_migrate.c             |  1 -
 drivers/gpu/drm/xe/xe_pt.c                  |  1 -
 drivers/gpu/drm/xe/xe_sa.c                  |  1 -
 13 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 9e4bcfdbc7e5..ea428993c67f 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -53,7 +53,6 @@ struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	if (IS_ERR(obj)) {
 		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
 					  ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					  XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
 					  XE_BO_FLAG_PINNED);
 	}
 
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 44c9fd2143cc..64ff1b3f0c2a 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -45,7 +45,6 @@ bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *d
 	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
 				   NULL, PAGE_ALIGN(size),
 				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
 				   XE_BO_FLAG_GGTT);
 	if (IS_ERR(obj)) {
 		kfree(vma);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..332e2da7cc21 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -112,19 +112,15 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 			      struct kunit *test)
 {
 	struct xe_bo *bo;
-
 	int ret;
 
-	/* TODO: Sanity check */
-	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
-
 	if (IS_DGFX(xe))
 		kunit_info(test, "Testing vram id %u\n", tile->id);
 	else
 		kunit_info(test, "Testing system memory\n");
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
-			       ttm_bo_type_device, bo_flags);
+			       ttm_bo_type_device, tile->mem.default_pl_flag);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
@@ -186,7 +182,6 @@ EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
 static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
 {
 	struct xe_bo *bo, *external;
-	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
 	struct xe_gt *__gt;
 	int err, i, id;
@@ -199,7 +194,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
 				       DRM_XE_GEM_CPU_CACHING_WC,
 				       ttm_bo_type_device,
-				       bo_flags);
+				       tile->mem.default_pl_flag);
 		xe_vm_unlock(vm);
 		if (IS_ERR(bo)) {
 			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
@@ -208,7 +203,8 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
 					     DRM_XE_GEM_CPU_CACHING_WC,
-					     ttm_bo_type_device, bo_flags);
+					     ttm_bo_type_device,
+					     tile->mem.default_pl_flag);
 		if (IS_ERR(external)) {
 			KUNIT_FAIL(test, "external bo create err=%pe\n", external);
 			goto cleanup_bo;
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 977d5f4e4490..3525606aee3f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -281,7 +281,6 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
 				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				   XE_BO_FLAG_PINNED);
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
@@ -290,7 +289,6 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
@@ -301,7 +299,6 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
-				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				    XE_BO_FLAG_PINNED);
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 71446688c643..80934bd93dbe 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1589,7 +1589,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
 {
 	struct xe_bo *bo;
-	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
+	u32 dst_flags = XE_BO_FLAG_GGTT;
 
 	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
 
@@ -2287,7 +2287,6 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
 			       DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device,
-			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
 			       XE_BO_FLAG_SCANOUT |
 			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..ea91e3db809c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -227,8 +227,6 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	flags = XE_BO_FLAG_PINNED;
 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
 		flags |= XE_BO_FLAG_SYSTEM;
-	else
-		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
 
 	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
 	if (IS_ERR(ggtt->scratch)) {
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 521ae24f2314..1a0dcceb2710 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -929,7 +929,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
-					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a688bb2d96ce..0afafa365a83 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -518,7 +518,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_whitelist(hwe);
 
 	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
-						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						 XE_BO_FLAG_GGTT |
 						 XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(hwe->hwsp)) {
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 418661a88918..adf4bb3b8f93 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -70,7 +70,6 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
 				  XE_BO_NEEDS_64K | XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 552ebf6eeee7..1684d2fa39e6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -743,7 +743,6 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->bo = xe_bo_create_pin_map(xe, tile, vm,
 				      ring_size + xe_lrc_size(xe, hwe->class),
 				      ttm_bo_type_kernel,
-				      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				      XE_BO_FLAG_GGTT |
 				      XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(lrc->bo))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5e0f48c51b72..4cec392c9768 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -155,7 +155,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 271f13eeb852..9096dbae5880 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -108,7 +108,6 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 				  XE_BO_FLAG_PINNED |
 				  XE_BO_FLAG_NO_RESV_EVICT |
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 8941522b7705..443b86269974 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -48,7 +48,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	sa_manager->bo = NULL;
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_GGTT |
 				  XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(bo)) {
-- 
2.43.0

